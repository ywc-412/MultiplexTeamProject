package com.mtms.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReserveVO;

public interface ReserveMapper {

	// 예매내역 하나 조회 - fin
	public ReserveVO read(String reserveNo);
	
	// 회원별 예매내역 조회 - fin
	public List<ReserveVO> getList(@Param("memberId") String memberId, @Param("cri") Criteria cri);
	
	// 회원별 예매 내역 조회 ( 관리자 / 최신 20개 )
	public List<ReserveVO> getListAdm(@Param("memberId") String memberId);
	
	// 회원별 총 예매 수 - 페이징 시 필요
	public int getTotalCount(@Param("memberId") String memberId, @Param("cri") Criteria cri);
	
	// 예매하기 - fin
	public void insert(ReserveVO rvo);
	
	// 상영시간이 지난 영화 - 상태값 변경 - fin
	public void changeStatus(@Param("scheduleDate") String scheduleDate, @Param("time") String time);
	
	// 상영시간 30분 전 - 상태값 변경 - fin
	public void beforeStatus(@Param("scheduleDate") String scheduleDate, @Param("time") String time);
	
	// 예매 수정하기 (환불한다던가)
	public int update(String reserveNo);
}
