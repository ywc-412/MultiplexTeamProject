package com.mtms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.SeatVO;

public interface SeatMapper {
	
	// 좌석 상태 가져오기 - fin
	public List<SeatVO> getStatus(@Param("scheduleNo") int scheduleNo);
	
	// 예매완료된 좌석의 상태 1로 변경
	public int modifyStatus(@Param("seats") String seats, @Param("scheduleNo") int scheduleNo);
	
	// 좌석 추가 - fin
	public void insert(@Param("scheduleNo") int scheduleNo, @Param("seatNo") String seatNo);
	
}
