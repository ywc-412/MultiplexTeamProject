package com.mtms.service;

import java.util.Date;
import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReserveVO;

public interface ReserveService {
	
	// 예매번호로 예매내역 가져오기
	public ReserveVO get(String reserveNo);
	
	// 회원별 예매내역 가져오기
	public List<ReserveVO> getList(String memberId, Criteria cri);
	
	// 관리자 - 회원별 예매내역 가져오기 ( 최근 20개 )
	public List<ReserveVO> getListAdm(String memberId);
	
	// 회원별 총 예매 수 (페이징)
	public int getTotal(String memberId, Criteria cri);
	
	// 예매하기
	public void register(ReserveVO rvo);
	
	// 예매 수정하기 (환불완료라던가..)
	public void refund(String reserveNo);

}
