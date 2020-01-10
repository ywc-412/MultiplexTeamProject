package com.mtms.service;

import java.util.List;

import com.mtms.domain.ScreenVO;

public interface ScreenService {
	
	// 스크린 가져오기 (상영시간표 등록할 때 필요)
	public List<ScreenVO> getList();

	
	
//	// 상영관별 좌석 번호 가져오기
//	public List<String> getSeat(int screenNo);
	
//	// 상영관별 좌석 수 가져오기
//	public int getNum(int screenNo);
	
	/*				 __
	 * 		   .___(  .)<  duck
	 * 			\____)
	 * ~~~~~~~~~~~~~~
	 */
	
}