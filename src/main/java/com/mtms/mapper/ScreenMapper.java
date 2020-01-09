package com.mtms.mapper;

import java.util.List;

public interface ScreenMapper {

	// 상영관별 좌석 목록
	public List<String> getSeat(int screenNo);
	
//	// 상영관별 총 좌석수
//	public int getNum(int screenNo);
	
}
