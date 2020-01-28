package com.mtms.service;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mtms.domain.Criteria;
import com.mtms.domain.MovieAttachVO;
import com.mtms.domain.MovieVO;
import com.mtms.mapper.CommentMapper;
import com.mtms.mapper.MovieAttachMapper;
import com.mtms.mapper.MovieMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MovieServiceImpl implements MovieService{
   
   private MovieMapper movieMapper;
   private MovieAttachMapper movieAttachMapper;
   private CommentMapper commentMapper;
   
   //영화 등록
   @Transactional
   @Override
   public void register(MovieVO movie) {
      movieMapper.insert(movie);

      
      List<MovieAttachVO> attachList = movie.getAttachList();
      //첨부파일 없을 때 처리
      if(attachList == null || attachList.size() <= 0) {
         return;
      }
      //첨부파일 있을 때 처리
      movie.getAttachList().forEach(movieAttach ->{
         movieAttach.setMovieNo(movie.getMovieNo());
         movieAttachMapper.insert(movieAttach);
      });
   }
   
   //영화 수정
   @Transactional
   @Override
   public boolean modify(MovieVO movie) {
      
      //기존 첨부파일 삭제
      movieAttachMapper.deleteAll(movie.getMovieNo());
      //업데이트 처리
      boolean modifyResult = movieMapper.update(movie) == 1;
      
      //업데이트에 성공한경우 첨부 파일이 있으면
      if(modifyResult && movie.getAttachList() != null && movie.getAttachList().size() > 0) {
         movie.getAttachList().forEach(movieAttach -> {
            movieAttach.setMovieNo(movie.getMovieNo());
            movieAttachMapper.insert(movieAttach);   //파일등록처리
         });
      }
      return modifyResult;
      
   }
   
   //영화 제거
   @Override
   @Transactional
   public boolean remove(int movieNo) {
      movieAttachMapper.deleteAll(movieNo);
      
      return movieMapper.delete(movieNo) == 1;
   }
   
   //영화 상세보기
   @Override
   public MovieVO get(int movieNo) {
      
      MovieVO mvo = movieMapper.read(movieNo);
      
      return mvo;
   }
   
   //별점 평균구하기
   @Override
   public int totalStar(int movieNo) {
      
      return commentMapper.sumStar(movieNo);
   }
   
   //별점 평균구하기
   @Override
   public int totalComment(int movieNo) {
      
      return commentMapper.sumComment(movieNo);
   }
   
   //인덱스 조회
   @Override
   public List<MovieVO> getIndexList(){
      
      return movieMapper.indexList();
   }
   
   //영화 페이징 조회
   @Override
   public List<MovieVO> getList(Criteria cri){
      
      return movieMapper.getListWithPaging(cri);
   }
   
   //영화 총페이지
   @Override
   public int getTotal(Criteria cri) {
      
      return movieMapper.getTotalCount(cri);
   }
   
   //영화 페이징 조회
   @Override
   public List<MovieAttachVO> attachGetList(){
      
      return movieAttachMapper.attachList();
   }
   
   @Override
   public List<MovieVO> myMovieList() {

      return movieMapper.movieList();
   }
   
   //영화 첨부파일
   @Override
   public List<MovieAttachVO> getAttachList(int movieNo){
      
      return movieAttachMapper.findByNo(movieNo);
   }

   @Override
   public int totalMovie(int movieNo) {
      
      return movieMapper.sumMovie(movieNo);
   }

   @Override
   public int totalGetMovie(int movieNo) {

      return movieMapper.sumGetMovie(movieNo);
   }

   //전체 예매율
   @Override
   public int totalMovie() {
      
	   int result = movieMapper.sumMovie();
	   System.out.println(result);
	   if(result == 0) {
		   return 0;
	   }else {
		   return movieMapper.sumMovie();
	   }
   }
      

   // 한나 - 스케줄 : 영화 이름으로 검색
    @Override
    public List<MovieVO> getMovieName(String movieName) {
       return movieMapper.getMovieName(movieName);
    }

    // 한나 - 예매 : 예매 시 관객수 ++ / 취소 시 관객수 --
    @Override
    public void audience(int movieNo, int audienceNum) {
      movieMapper.audience(movieNo, audienceNum);
    }

    // 희홍 - 영화번호로 영화명 가져오기
    @Override
    public String getMovie(int movieNo) {
       return movieMapper.getMovie(movieNo);
    }
    
    //어제예매수변경
   @Override
   public boolean modifyYesterday() {
      
      return movieMapper.updateYesterday() == 1;
   }

   //오늘 예매수 변경
   @Override
   public boolean modifyToday() {

      return movieMapper.updateToday() == 1;
   }

   
   
}