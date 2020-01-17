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
		
		System.out.println("si - no : " + rvo.getMovieNo());
		System.out.println("si - screen : " + rvo.getScreen());
		System.out.println("si - time : " + rvo.getScheduleTime());
		System.out.println("si - date : " + rvo.getScheduleDate());
		
		List<String> list = new ArrayList<String>();
		list.add("A1");
		list.add("A2");
		return scheduleMapper.insert(rvo);
	}

	@Override
	public boolean modify(int scheduleNo) {
		// TODO Auto-generated method stub
		// mapper.update
		return false;
	}

	@Override
	public boolean remove(int scheduleNo) {
		// TODO Auto-generated method stub
		// mapper.delete
		return false;
	}

	@Override
	public List<ScheduleVO> get(String scheduleDate, String screen){
		System.out.println("★ScheduleServiceImpl - get");
		System.out.println("scheduleDate : " + scheduleDate);
		System.out.println("scheduleScreen : " + screen);
		List<ScheduleVO> list = scheduleMapper.get(scheduleDate, screen);
		System.out.println("service list size : " + list.size());
		return list;
	}

	@Override
	public boolean removeDay(String scheduleDate) {
		// 날짜별 상영스케줄 전체 삭제
		System.out.println("★ScheduleServiceImpl - removeDay");
		System.out.println("schedule : " + scheduleDate);
		if(scheduleMapper.deleteAll(scheduleDate) > 0) {
			// deleteAll이 성공하면 true 보냄
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<ScheduleVO> getMovie(String startDate, String endDate) {
		// 현재 상영중인 영화 목록 가져오기
		System.out.println("schedule service impl - getMovie");
		System.out.println("si start : " + startDate + "si end : " + endDate);
		List<ScheduleVO> list = scheduleMapper.getMovie(startDate, endDate);
		System.out.println("si list size : " + list.size());
		return list;
	}

	@Override
	public List<String> getDay(int movieNo, String startDate, String endDate) {
//	public List<ScheduleVO> getDay(int movieNo, String startDate, String endDate) {
		// 해당 영화의 상영 날짜 받아오기
		System.out.println("schedule service i : get day");
		List<String> list = scheduleMapper.getDay(movieNo, startDate, endDate);
		for(int i=0; i<list.size(); i++) {
			System.out.println("impl / day / size " + list.get(i));
		}
		return list;
	}

	@Override
	public List<String> getTime(int movieNo, String scheduleDate) {
		// 해당 영화, 해당 날짜의 상영 시간 조회
		System.out.println("si - gettime");
		List<String> list = scheduleMapper.getTime(movieNo, scheduleDate);
		System.out.println("gettime list size impl : " + list.size());
		return list;
	}

	@Override
	public int getSeq() {
		// TODO Auto-generated method stub
		return scheduleMapper.getSeq();
	}
}
