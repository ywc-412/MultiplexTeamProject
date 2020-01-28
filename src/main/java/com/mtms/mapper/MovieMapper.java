package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.MovieVO;
import org.apache.ibatis.annotations.Param;

public interface MovieMapper {
   
   //인덱스 리스트indexList
   public List<MovieVO> indexList();
   
   //게시글 총페이지
   public int getTotalCount(Criteria cri);
   
   //영화 전체조회(페이징)
   public List<MovieVO> getListWithPaging(Criteria cri);
   
   //영화 리스트
   public List<MovieVO> movieList();
   
   //영화 수정
   public int update(MovieVO movie);
   
   //영화 삭제
   public int delete(int movieNo);
   
   //영화 상세보기
   public MovieVO read(int movieNo);
   
   //영화 등록
   public void insert(MovieVO movie);
   
   //예매율
   public int sumMovie(int movieNo);
   

   public int sumGetMovie(int movieNo);
   
   //전체예매율
   public int sumMovie();
   
   //어제 예매수 변경
   public int updateYesterday();
   
   //오늘 예매수 변경
   public int updateToday();
   
   
   //한나
   
   // 한나 - 영화 이름으로 검색
    public List<MovieVO> getMovieName(@Param("movieName") String movieName);
   
    // 한나 - 예매 시 관객수 +/-
    public int audience(@Param("movieNo") int movieNo, @Param("audienceNum") int audienceNum);
   
    // 희홍 - 영화 번호로 영화 이름 알아오기
    public String getMovie(@Param("movieNo") int movieNo);

}