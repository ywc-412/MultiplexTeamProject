package com.mtms.service;

import java.util.List;
import java.util.Map;

import com.mtms.domain.MovieVO;
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
	
	// 상영중인 영화 목록
	public List<ScheduleVO> getMovie(String startDate, String endDate);
	
	// 해당 영화의 상영 스케줄 조회
//	public List<ScheduleVO> getDay(int movieNo, String startDate, String endDate);
	public List<String> getDay(int movieNo, String startDate, String endDate);
	
	// 해당 영화, 해당 날짜의 상영 시간 조회
	public List<String> getTime(int movieNo, String scheduleDate);
	
	// 방금 삽입한 스케줄 번호 알아오기
	public int getSeq();

}
