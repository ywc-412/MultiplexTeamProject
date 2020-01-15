package com.mtms.mapper;

import java.util.Date;
import java.util.List;

import com.mtms.domain.ScheduleVO;

public interface ScheduleMapper {
	
	// 상영스케줄 등록
	public void insert(ScheduleVO rvo);
	
	// 상영스케줄 수정
	public int update(int scheduleNo);
	
	// 상영스케줄 삭제
	public int delete(int scheduleNo);
	
	// 날짜별 상영스케줄 조회
	public List<ScheduleVO> getList(String scheduleDate);

}
