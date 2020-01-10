package com.mtms.service;

import java.util.Date;
import java.util.List;

import com.mtms.domain.ReserveVO;

public interface ReserveService {
	
	// 예매번호로 예매내역 가져오기
	public ReserveVO get(String reserveNo);
	
	// 회원별 예매내역 가져오기
	public List<ReserveVO> getList(String memberId);
	
	// 예매하기
	public void register(ReserveVO rvo);
	
	// 예매 수정하기 (환불완료라던가..)
	public boolean refund(String reserveNum);

}
