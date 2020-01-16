package com.mtms.service;

import java.util.List;

import com.mtms.domain.ScheduleVO;

public interface ScheduleService {
	
	/*				 __
	 * 		   .___(  .)<  duck
	 * 			\____)
	 * ~~~~~~~~~~~~~~
	 */
	
	// 상영스케줄 등록
	public int register(ScheduleVO rvo);
	
	// 상영스케줄 수정
	public boolean modify(int scheduleNo);
	
	// 상영스케줄 삭제
	public boolean remove(int scheduleNo);
	
	// 날짜별 상영스케줄 삭제
	public boolean removeDay(String scheduleDate);
	
	// 날짜별 상영스케줄 조회
//	public List<ScheduleVO> get(String scheduleDate);
	public List<ScheduleVO> get(String scheduleDate, String screen);

}
