  package com.mtms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.CommentReportVO;
import com.mtms.domain.CommentVO;
import com.mtms.domain.Criteria;


public interface CommentMapper {
	
	//총페이지 갯수
	public int getCountByBno(@Param("movieNo") int movieNo);
	
	//한줄평 조회(페이징)
	public List<CommentVO> getListWithPaging(@Param("cri") Criteria cri, @Param("movieNo") int movieNo);
	
	
	//내 한줄평 총페이지
	public int myCommentTotal(@Param("memberId") String memberId);
	
	//내 한줄평 총 페이지
	public List<CommentVO> myCommentListWithPaging(@Param("cri") Criteria cri, @Param("memberId") String memberId);
	
	
	//한줄평 수정
	public int update(CommentVO comment);
	
	//한줄평 삭제
	public int delete(int commentNo);
	
	//한줄평 등록
	public int insert(CommentVO comment);
	
	//한줄평 조회
	public CommentVO read(int commentNo);
	
	//한줄평 갯수
	public int commentCount(Criteria cri);
	
	//한줄평 조회(페이징)
	public List<CommentVO> commentList();
	
//	<평점 평균>
	public int sumStar(int movieNo);
	
	public int sumComment(int movieNo);
	
	// 이미작성한사람체크
	public int insertComment(@Param("movieNo") int movieNo, @Param("memberId") String memberId);
	
	public int insertReport(@Param("commentNo") int commentNo, @Param("memberId") String memberId);
	
}
