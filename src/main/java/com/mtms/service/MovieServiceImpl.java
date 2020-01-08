package com.mtms.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mtms.domain.Criteria;
import com.mtms.domain.MovieAttachVO;
import com.mtms.domain.MovieVO;
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
	
	//영화 등록
	public void register(MovieVO movie) {
		
	}
	
	//영화 수정
	public boolean modify(MovieVO movie) {
		
		return false;
	}
	
	//영화 제거
	public boolean remove(int movieNo) {
		
		return false;
	}
	
	//영화 상세보기
	public MovieVO get(int movieNo) {
		
		return null;
	}
	
	//영화 페이징 조회
	public List<MovieVO> getList(Criteria cri){
		
		return null;
	}
	
	//영화 총페이지
	public int getTotal(Criteria cri) {
		
		return 0;
	}
	
	//영화 첨부파일
	public List<MovieAttachVO> getAttachList(int movieNo){
		
		return null;
	}
	
	
	
}
