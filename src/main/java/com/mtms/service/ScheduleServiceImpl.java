package com.mtms.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.mapper.MovieMapper;
import com.mtms.mapper.ScheduleMapper;
import com.mtms.mapper.ScreenMapper;
import com.mtms.domain.ScheduleVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ScheduleServiceImpl implements ScheduleService{
	@Setter(onMethod_ = @Autowired)
	private ScheduleMapper scheduleMapper;
	private ScreenMapper screenMapper;
	private MovieMapper movieMapper;

	@Override
	public void register(ScheduleVO rvo) {
		// 상영스케줄 등록 화면으로 이동
	}

	@Override
	public boolean modify(int scheduleNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(int scheduleNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<String> getList(Date scheduleDate) {
		// TODO Auto-generated method stub
		return null;
	}
}
