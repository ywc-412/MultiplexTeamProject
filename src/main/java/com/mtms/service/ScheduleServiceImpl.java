package com.mtms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.mtms.mapper.MovieMapper;
import com.mtms.mapper.ScheduleMapper;
import com.mtms.domain.MovieVO;
import com.mtms.domain.ScheduleVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ScheduleServiceImpl implements ScheduleService{
	
	private ScheduleMapper scheduleMapper;
	private MovieMapper movieMapper;

	@Override
	public int register(ScheduleVO rvo) {
		// 상영스케줄 등록 ( 영화 하나 / 관 하나 / 시간 6개 )
		return scheduleMapper.insert(rvo);
	}

	@Override
	public int checkSchedule(String scheduleDate, String screen) {
		// 스케줄 등록 전 해당 날짜, 상영관에 스케줄이 있는 지 확인
		if(scheduleMapper.checkSchedule(scheduleDate, screen) < 6) {
			// 스케줄이 존재하지않으면 1을 보냄
			return 1;
		} else { // 스케줄이 존재 : 0 보냄
			return 0;
		}
	}

	@Override
//	public void modify(String scheduleDate, String screen, String[] time) {
	public void modify(String[] no, String[] time) {
		String scheduleTime;
		int scheduleNo;
		for(int i=0; i<time.length; i++) {
			scheduleTime = time[i];
			scheduleNo = Integer.parseInt(no[i]);
			int result = scheduleMapper.update(scheduleTime, scheduleNo);
		}
	}

	@Override
	public void remove(String[] scheduleNo) {
		// 등록하다가 취소 시 - 추가했던 스케줄 삭제
		for(int i=0; i<scheduleNo.length; i++) {
			scheduleMapper.delete(Integer.parseInt(scheduleNo[i]));
		}
	}

	@Override
	public void deleteScreen(String scheduleDate, String screen) {
		// 영화명 클릭해서 삭제 (상영날짜, 스크린 넘어옴)
		scheduleMapper.deleteScreen(scheduleDate, screen);
	}

	@Override
	public List<ScheduleVO> get(String scheduleDate, String screen){
		return scheduleMapper.get(scheduleDate, screen);
	}

	@Override
	public boolean removeDay(String scheduleDate) {
		// 날짜별 상영스케줄 전체 삭제
		if(scheduleMapper.deleteAll(scheduleDate) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<ScheduleVO> getMovie(String startDate, String endDate, String time) {
		// 현재 상영중인 영화 목록 가져오기
		return scheduleMapper.getMovie(startDate, endDate, time);
	}

	@Override
	public List<String> getDay(int movieNo, String startDate, String endDate, String time) {
		// 해당 영화의 상영 날짜 받아오기
		return scheduleMapper.getDay(movieNo, startDate, endDate, time);
	}

	@Override
	public List<String> getTime(int movieNo, String scheduleDate, String time) {
		// 해당 영화, 해당 날짜의 상영 시간 조회
		return scheduleMapper.getTime(movieNo, scheduleDate, time);
	}

	@Override
	public int getSeq() {
		// 방금 등록한 스케줄의 스케줄 번호 가져오기
		return scheduleMapper.getSeq();
	}

	@Override
	public int getScheduleNo(int movieNo, String scheduleDate, String scheduleTime) {
		// 시간선택->좌석선택에서 좌석 상태 끌어오기 위해서 상영스케줄 번호 가져오기
		return scheduleMapper.getScheduleNo(movieNo, scheduleDate, scheduleTime);
	}

	@Override
	public ScheduleVO getSchedule(int scheduleNo) {
		// 예매 결과) 스케줄 번호로 스케줄 정보 알아오기
		return scheduleMapper.getSchedule(scheduleNo);
	}



}
