package com.mtms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.ScheduleVO;

public interface ScheduleMapper {
	
	// 상영스케줄 등록
	public int insert(ScheduleVO rvo);

//	// 상영스케줄 수정
//	public int update(int scheduleNo);
//	
//	// 상영스케줄 삭제
//	public int delete(int scheduleNo);
	
	// 날짜별 상영스케줄 삭제
	public int deleteAll(@Param("scheduleDate") String scheduleDate);
	
	// 날짜별 상영스케줄 조회
	public List<ScheduleVO> get(@Param("scheduleDate") String scheduleDate, @Param("screen") String screen);

}