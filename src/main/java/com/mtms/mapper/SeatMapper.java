package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.SeatVO;

public interface SeatMapper {
	
	// 좌석 상태 가져오기
	public List<SeatVO> getStatus(int scheduleNo);
	
	// 좌석 추가
	public void insert(List<SeatVO> seatList);
	
	// 좌석 삭제
	public int delete(int scheduleNo);
	
	// 좌석 수정
	public int update(List<SeatVO> seatList);
	
	

}
