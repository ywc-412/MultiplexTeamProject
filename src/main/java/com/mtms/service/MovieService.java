package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.MovieAttachVO;
import com.mtms.domain.MovieVO;

public interface MovieService {
	
//	//영화 수정
//	public boolean modify(MovieVO movie);
//	
//	//영화 삭제
//	public boolean remove(int movieNo); 
//	
//	//영화 상세보기
//	public MovieVO get(int movieNo); 
//	
//	//영화 등록
//	public void register(MovieVO movie); 
//	
//	//영화 페이징
//	public List<MovieVO> getList(Criteria cri);  
//	
//	//영화 총페이지
//	public int getTotal(Criteria cri);
//	
//	//영화 첨부파일
//	public List<MovieAttachVO> getAttachList(int movieNo);
	
	// 한나 -> 영화명 검색
	public List<MovieVO> getMovieName(String movieName);

}
