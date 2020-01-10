package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.Criteria;

import com.mtms.domain.SuggestVO;

public interface SuggestMapper {
	// 건의사항 등록
	public void insertSuggestSelectKey(SuggestVO svo);
	// 건의사항 조회
	public List<SuggestVO> getSuggestList();
	// 건의사항 상세 보기
	public SuggestVO getSuggest(int suggestNo);
	// 건의사항 삭제
	public int deleteSuggest(int suggestNo);
	// 건의사항 수정
	public int updateSuggest(SuggestVO svo);
	
	public int getTotalCount(Criteria cri);
}
