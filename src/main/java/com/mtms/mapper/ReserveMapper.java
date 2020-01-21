package com.mtms.mapper;

import java.util.Date;
import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReserveVO;

public interface ReserveMapper {

	// 예매내역 하나 조회
	public ReserveVO read(String reserveNo);
	
	// 회원별 예매내역 조회
	public List<ReserveVO> getList(String memberId, Criteria cri);
	
	// 회원별 총 예매 수
	public int getTotalCount(String memberId, Criteria cri);
	
	// 예매하기
	public void insert(ReserveVO rvo);
	
//	// 예매 수정하기 (환불한다던가)
//	public int update(String reserveNum);
}
