package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.MovieAttachVO;
import com.mtms.domain.MovieVO;

public interface MovieService {
	
	//영화 수정
	public boolean modify(MovieVO movie);
	
	//영화 삭제
	public boolean remove(int movieNo); 
	
	//영화 상세보기
	public MovieVO get(int movieNo); 
	
	//영화 등록
	public void register(MovieVO movie); 
	
	//영화 페이징
	public List<MovieVO> getList(Criteria cri); 
	

	public List<MovieAttachVO> attachGetList();
	
	//영화 페이지 전체 조회
	public List<MovieVO> myMovieList();
	
	//영화 총페이지
	public int getTotal(Criteria cri);
	
	//영화 첨부파일
	public List<MovieAttachVO> getAttachList(int movieNo);

	//평균 평점
	public int totalStar(int movieNo);
	
	//평균 평점
	public int totalComment(int movieNo);
	
	//예매율
	public int totalMovie(int movieNo);
	
	//예매율
	public int totalGetMovie(int movieNo);
	
	//전체예매율
	public int totalMovie();
	
	//한나
	// 한나 -> 영화명 검색
    public List<MovieVO> getMovieName(String movieName);
   
    // 한나 -> 예매시 영화의 오늘 관객수 +1
    public void audience(int movieNo, int audienceNum);
   
    // 희홍 -> 영화명 가져오기
    public String getMovie(int movieNo);


}
