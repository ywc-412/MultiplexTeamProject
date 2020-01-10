package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.SuggestVO;

public interface SuggestService {
	// 건의사항 등록
	public void registerSuggest(SuggestVO svo);

	// 건의사항 조회
	public List<SuggestVO> getSuggestListWithPaging(Criteria cri);
	
	// 건의사항 상세 보기
	public SuggestVO getSuggest(int suggestNo);

	// 건의사항 삭제
	public int removeSuggest(int suggestNo);

	// 건의사항 수정
	public int modifySuggest(SuggestVO svo);
	
	public int getTotalCount(Criteria cri);
}
