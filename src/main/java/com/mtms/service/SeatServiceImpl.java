package com.mtms.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mtms.domain.SeatVO;
import com.mtms.mapper.MovieMapper;
import com.mtms.mapper.ScheduleMapper;
import com.mtms.mapper.SeatMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class SeatServiceImpl implements SeatService {
	
	private SeatMapper seatMapper;

	@Override
	public List<SeatVO> getStatus(int scheduleNo) {
		// 영화번호/상영날짜/시간에 대한 좌석 상태 가져오기
		System.out.println("seat service impl");
		return seatMapper.getStatus(scheduleNo);
	}

	@Override
	public int modifyStatus(String seats, int scheduleNo) {
		// 예매 완료된 좌석의 상태 변경
		System.out.println("seat si - modifystatus : " + seats);
		seats = "(" + seats + ")";
		System.out.println("seat si - modifystatus2 : " + seats);
		System.out.println("seat si - scheduleNo : " + scheduleNo);
		int upint = seatMapper.modifyStatus(seats, scheduleNo);
		System.out.println("seat si return int : " + upint);
		
		return upint;
	}

	@Override
	public void register(int scheduleNo) {
		// 스케줄 번호에 대한 좌석 추가
		List<String> list = new ArrayList<String>();
		
		for(int i=1; i<6; i++) {
			list.add("A"+i);
			list.add("B"+i);
			list.add("C"+i);
			list.add("D"+i);
			list.add("E"+i);
		}
		
		for(int i=0; i<list.size(); i++) {
			String seatNo = list.get(i);
			seatMapper.insert(scheduleNo, seatNo);
		}
	}

	@Override
	public boolean remove(int scheduleNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify(List<SeatVO> seatList) {
		// TODO Auto-generated method stub
		return false;
	}

}
