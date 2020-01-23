package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.MovieAttachVO;

public interface MovieAttachMapper {
	
	//첨부파일 등록
	public void insert(MovieAttachVO movieAttach);
	
	//첨부파일 개별삭제
	public void delete(String uuid);
	
	//첨부파일 조회
	public List<MovieAttachVO> findByNo(int movieNo);
	
	//첨부파일 전체삭제
	public void deleteAll(int movieNo);
	
	
	public List<MovieAttachVO> attachList();
	
	
	
	//불필요한 사진 삭제
//	public List<MovieAttachVO> getOldFiles();
}
