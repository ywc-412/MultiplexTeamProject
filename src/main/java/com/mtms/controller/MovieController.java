package com.mtms.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Criteria;
import com.mtms.domain.MovieAttachVO;
import com.mtms.domain.MovieVO;
import com.mtms.domain.PageDTO;
import com.mtms.service.MovieService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/movie/*")
@AllArgsConstructor
public class MovieController {
   
   private MovieService movieService;

   //첨부 파일 삭제 메서드 - 영화사진 
   private void deleteFiles(List<MovieAttachVO> attachList) {
      log.info("delete attach files");
      
      attachList.forEach(attach -> {
         try {
            Path file = Paths.get("C:\\upload\\movie\\" + attach.getMovieUploadPath()  + "\\" + attach.getMovieUuid() + "_" + attach.getMovieFileName());
            Files.deleteIfExists(file); //원본파일 삭제
            
            if(Files.probeContentType(file).startsWith("image")) {
               Path thumbNail = Paths.get("C:\\upload\\movie\\\\" + attach.getMovieUploadPath() + "\\s_" + attach.getMovieUuid() + "_" + attach.getMovieFileName());
               Files.delete(thumbNail); //썸네일파일 삭제
            }
         } catch (IOException e) {
            log.error("delete file error" + e.getMessage());
            e.printStackTrace();
         }
      });
   }
   
   //영화 상세보기(보여주기)
   @GetMapping("get")
   public void get(Model model, @RequestParam("movieNo") int movieNo, @ModelAttribute("cri") Criteria cri) {
      System.out.println("컨트롤러 상세보기 get");
      
      //평균 평점
      int totalStar = movieService.totalStar(movieNo);
      int totalComment = movieService.totalComment(movieNo);
      double avgStar = totalStar / (double) totalComment;
      int percentStar = (int) (avgStar*100);
      
      //예매율
      int totalMovie = movieService.totalMovie(movieNo);
      int totalGetMovie = movieService.totalGetMovie(movieNo);
      double avgMovie = totalGetMovie / (double) totalMovie;
      int percentMovie = (int) (avgMovie*100);
      
      model.addAttribute("percentMovie", percentMovie);
      model.addAttribute("percentComment", percentStar);
      model.addAttribute("totalComment", avgStar);
      model.addAttribute("movie", movieService.get(movieNo));
   }

   //영화 수정 보여주기
   @GetMapping("modify")
   public void modify(Model model, @RequestParam("movieNo") int movieNo, @ModelAttribute("cri") Criteria cri) {
      System.out.println("컨트롤러 상세보기 modify");
      model.addAttribute("movie", movieService.get(movieNo));
   }
   
   //영화 수정 처리
//   @PreAuthorize("principal.username == #memo.id") //수정필요
   @PostMapping("modify")
   public String modify(MovieVO movie, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
      
      System.out.println("컨트롤러 모디파이");
      
      if(movieService.modify(movie)) {
         rttr.addFlashAttribute("result", "success");
      }
      
      rttr.addAttribute("pageNum", cri.getPageNum());
      rttr.addAttribute("amount", cri.getAmount());
      rttr.addAttribute("type", cri.getType());
      rttr.addAttribute("keyword", cri.getKeyword());
      
      return "redirect:/movie/list";
      
   }
   
   //영화  삭제 처리
   @GetMapping("remove")
   public String remove(@RequestParam("movieNo") int movieNo, RedirectAttributes rttr,  @ModelAttribute("cri") Criteria cri) {
      System.out.println("컨트롤러 제거");
      
      //첨부파일이 있는경우 파일 삭제 메서드 호출
      List<MovieAttachVO> attachList = movieService.getAttachList(movieNo);
       if(movieService.remove(movieNo)) {
            if(attachList != null || attachList.size() > 0 ) {
               deleteFiles(attachList);
            }
            rttr.addFlashAttribute("result", "success");
       }
       
       rttr.addAttribute("pageNum", cri.getPageNum());
      rttr.addAttribute("amount", cri.getAmount());
      rttr.addAttribute("type", cri.getType());
      rttr.addAttribute("keyword", cri.getKeyword());
      
      return "redirect:/movie/list";
   }
   
   //영화 등록 창 보여주기
   @Secured("ROLE_ADMIN")
   @GetMapping("register")
   public void register() {
      log.info("controller 영화 register");
   }
      
   //영화 등록 처리
   @PostMapping("register")
   @Secured("ROLE_ADMIN")
   public String register(MovieVO movie, RedirectAttributes rttr) {
      log.info("controller 영화 register");
      
      //첨부파일 있을때 처리
      if(movie.getAttachList() != null) {
         movie.getAttachList().forEach(attach -> log.info(attach));
      }
      
      movieService.register(movie);
      
      return "redirect:/movie/list";
   }
   
   //영화 전체 조회
   @GetMapping("list")
   public void list(Criteria cri, Model model) {
      System.out.println("컨트롤러 영화조회");
      
      int totalMovie = movieService.totalMovie();
      System.out.println(totalMovie);
      
      model.addAttribute("totalMovie", totalMovie);
      model.addAttribute("attachList", movieService.attachGetList());
      model.addAttribute("moveList", movieService.getList(cri));
      model.addAttribute("pageMaker", new PageDTO(cri, movieService.getTotal(cri)));
   }
   
   //사진 보여주기
   @GetMapping(value = "getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   @ResponseBody
   public ResponseEntity<List<MovieAttachVO>> getAttachList(int movieNo) {
      System.out.println("무비사진");
      return new ResponseEntity<>(movieService.getAttachList(movieNo), HttpStatus.OK);
   }
   
   // 한나 - 영화명 검색
   @RequestMapping(value="getName/{movieName}", 
         produces = { MediaType.APPLICATION_XML_VALUE,
                        MediaType.APPLICATION_JSON_UTF8_VALUE})
   public ResponseEntity<List<MovieVO>> getName(@PathVariable("movieName") String movieName){
      System.out.println("MOVIE CONTROLLER - GETNAME");
      return new ResponseEntity<>(movieService.getMovieName(movieName), HttpStatus.OK);
   }
   
}