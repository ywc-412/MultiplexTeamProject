package com.mtms.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	@Override
	public void register(MovieVO movie) {
		log.info("영화 register " + movie);
		System.out.println(movie.getMovieNo());
		
		movieMapper.insert(movie);

		System.out.println(movie.getMovieNo());
		
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
				movieAttachMapper.insert(movieAttach);	//파일등록처리
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
	
	//영화 페이징 조회
	@Override
	public List<MovieVO> getList(Criteria cri){
		System.out.println("무비 리스트");
		
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
		System.out.println("무비 리스트");
		
		return movieAttachMapper.attachList();
	}
	
	//영화 첨부파일
	@Override
	public List<MovieAttachVO> getAttachList(int movieNo){
		
		return movieAttachMapper.findByNo(movieNo);
	}

	
	
	
}
