package com.mtms.service;

import java.util.List;

import com.mtms.domain.SeatVO;

public interface SeatService {
	
	// 현재 좌석 상태 가져오기 - 스케줄 번호(날짜/시간/스크린) 별 좌석번호와 상태
	public List<SeatVO> getStatus(int scheduleNo);
	
	// 좌석 추가하기 (상영스케줄 등록될 때) - fin
	public void register(int scheduleNo);
	
	// 좌석 삭제하기 (상영스케줄 삭제될 때)
	// - Schedule Controller에서 지울 때 scheduleDate로 scheduleNo List로 받아와서
	// 하나하나 다 지워야함
	public boolean remove(int scheduleNo);
	
	// 좌석 수정하기 (상영스케줄 수정될 때)
	public boolean modify(List<SeatVO> seatList);

}
