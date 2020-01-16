package com.mtms.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mtms.mapper.MovieMapper;
import com.mtms.mapper.ScheduleMapper;
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
		System.out.println("schedule : " + scheduleDate);
		List<ScheduleVO> list = scheduleMapper.get(scheduleDate, screen);
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
}
