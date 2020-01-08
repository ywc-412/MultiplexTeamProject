package com.mtms.service;

import java.util.List;

public interface ScreenService {

	// 상영관별 좌석 번호 가져오기
	public List<String> getSeat(int screenNo);
	
	// 상영관별 좌석 수 가져오기
	public int getNum(int screenNo);
	
	/*				 __
	 * 		   .___(  .)<  duck
	 * 			\____)
	 * ~~~~~~~~~~~~~~
	 */
	
}