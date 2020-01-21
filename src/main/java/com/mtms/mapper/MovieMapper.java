package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.MovieVO;
import org.apache.ibatis.annotations.Param;

public interface MovieMapper {
	
	//게시글 총페이지
	public int getTotalCount(Criteria cri);
	
	//영화 전체조회(페이징)
	public List<MovieVO> getListWithPaging(Criteria cri);
	
	//영화 수정
	public int update(MovieVO movie);
	
	//영화 삭제
	public int delete(int movieNo);
	
	//영화 상세보기
	public MovieVO read(int movieNo);
	
	//영화 등록
	public void insert(MovieVO movie);
	
	// 한나 - 영화 이름으로 검색
	public List<MovieVO> getMovieName(@Param("movieName") String movieName);
	
	//예매율
	public int sumMovie(int movieNo);
	

	public int sumGetMovie(int movieNo);

}
