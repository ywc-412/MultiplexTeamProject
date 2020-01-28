package com.mtms.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mtms.domain.CommentPageDTO;
import com.mtms.domain.CommentVO;
import com.mtms.domain.Criteria;
import com.mtms.domain.PageDTO;
import com.mtms.service.CommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/comment/")
@RestController
@Log4j
@AllArgsConstructor
public class CommentController {
   
   private CommentService commentService;
   
   //한줄평 등록 - AJAX
   @PostMapping(value = "new", consumes = "application/json"            
                       , produces = { MediaType.TEXT_PLAIN_VALUE })   
   public ResponseEntity<String> register(@RequestBody CommentVO comment){
      // JSON 데이터를 RVO 객체로 변환할 거라 @RequestBody 사용
      
      int checkRegister = commentService.registerComment(comment.getMovieNo(), comment.getMemberId());
      if(checkRegister > 0) {
//         System.out.println("이미 이 영화에 대한 한줄평을 등록한 회원");
         return new ResponseEntity<>("already", HttpStatus.OK);
      } else {
         int insertCount = commentService.register(comment);
         
         System.out.println("Reply INSERT COUNT " + insertCount);
         
         // result가 1이면(성공) : ResponseEntity로 success 와 OK 보냄
         return insertCount == 1 ? 
               new ResponseEntity<>("success", HttpStatus.OK) : 
                  new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
      }
   }
   
   //한줄평 전체 조회 - AJAX
    // page와 {page} 차이 알아야함
    @GetMapping(value = "pages/{movieNo}/{pageNum}", produces = { MediaType.APPLICATION_XML_VALUE,
                                                    MediaType.APPLICATION_JSON_UTF8_VALUE } )
                                     // URL의 일부를 파라미터로 사용하는 PathVariable
    public ResponseEntity<CommentPageDTO> getList(@PathVariable("pageNum") int pageNum, @PathVariable("movieNo") int movieNo ) {
      
//       System.out.println("컨트롤러 댓글 페이징");
        // 댓글의 페이지수를 받아서 10개씩 페이징할 것
       Criteria cri = new Criteria(pageNum, 10);
       
        // service에서 받아온 리스트의 값과 OK를 함께 넘김
        return new ResponseEntity<>(commentService.getListPage(cri, movieNo), HttpStatus.OK);
    }
   
   //한줄평 삭제 - AJAX
//   @PreAuthorize("principal.username == #rvo.replyer") //수정필요
    @Secured("ROLE_MEMBER")
   @DeleteMapping(value = "{commentNo}", produces = { MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> remove(@RequestBody CommentVO commentVO, @PathVariable("commentNo") int commentNo){
      
      return commentService.remove(commentNo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   //한줄평 수정 - AJAX
   @Secured("ROLE_MEMBER")
   @RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
               value = "{commentNo}",
               consumes = "application/json",
               produces = { MediaType.TEXT_PLAIN_VALUE })
   public ResponseEntity<String> modify(@RequestBody CommentVO comment, @PathVariable("commentNo") int commentNo){
      comment.setCommentNo(commentNo);
      return commentService.modify(comment) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
      
   }
   
   //댓글 조회
   @GetMapping(value = "{commentNo}", produces = { MediaType.APPLICATION_XML_VALUE,
                                   MediaType.APPLICATION_JSON_UTF8_VALUE} )      
   public ResponseEntity<CommentVO> get(@PathVariable("commentNo") int commentNo){
      return new ResponseEntity<>(commentService.get(commentNo),HttpStatus.OK);
      
   }

   

   
}