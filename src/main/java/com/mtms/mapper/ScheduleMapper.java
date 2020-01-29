package com.mtms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.MovieVO;
import com.mtms.domain.ScheduleVO;

public interface ScheduleMapper {
	
	// 등록) 상영스케줄 등록
	public int insert(ScheduleVO rvo);
	
	// 등록) 해당 날짜, 관에 상영시간대가 있는 지 확인
	public int checkSchedule(@Param("scheduleDate") String scheduleDate, @Param("screen") String screen);

	// 상영스케줄 수정
	public int update(@Param("scheduleTime") String scheduleTime, @Param("scheduleNo") int scheduleNo);
	
	// 상영스케줄 삭제 - 등록하다가 취소 시
	public int delete(int scheduleNo);
	
	// 상영스케줄 삭제 - 상영날짜, 스크린
	public int deleteScreen(@Param("scheduleDate") String scheduleDate, @Param("screen") String screen);
	
	// 삭제) 날짜별 상영스케줄 삭제
	public int deleteAll(@Param("scheduleDate") String scheduleDate);
	
	// 조회) 날짜별 상영스케줄 조회
	public List<ScheduleVO> get(@Param("scheduleDate") String scheduleDate, @Param("screen") String screen);
	
	// 조회) 날짜별 상영스케줄 전체 조회
	public List<ScheduleVO> getAll(@Param("scheduleDate") String scheduleDate);
	
	// 예매) 현재 상영중인 영화 목록 가져오기 - fin
	public List<ScheduleVO> getMovie(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("time") String time);
	
	// 예매) 해당 영화의 상영 날짜 받아오기 - fin
	public List<String> getDay(@Param("movieNo") int movieNo, @Param("startDate") String startDate, @Param("endDate") String endDate, @Param("time") String time);
	
	// 예매) 해당 영화, 해당 날짜의 상영 시간 조회 - fin
	public List<String> getTime(@Param("movieNo") int movieNo, @Param("scheduleDate") String scheduleDate, @Param("time") String time);
	
	// 등록 후 좌석 등록) 방금 삽입한 스케줄의 번호 알아오기 - fin
	public int getSeq();
	
	// 예매할 때)영화번호, 날짜, 시간으로 스케줄 번호 알아오기 - fin
	public int getScheduleNo(@Param("movieNo") int movieNo, @Param("scheduleDate") String scheduleDate, @Param("scheduleTime") String scheduleTime);
	
	// 예매 후 결과) 스케줄 번호로 스케줄 정보 알아오기 - fin
	public ScheduleVO getSchedule(@Param("scheduleNo") int scheduleNo);
	
	// 영화 삭제 시 - 해당 영화가 스케줄 등록되어있는 지 확인
	public int movieChk(int movieNo);

}