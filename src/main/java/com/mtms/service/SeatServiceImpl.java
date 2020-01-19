package com.mtms.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mtms.domain.SeatVO;
import com.mtms.mapper.SeatMapper;

@Service
public class SeatServiceImpl implements SeatService {
	
	private SeatMapper seatMapper;

	@Override
	public List<SeatVO> getStatus(int scheduleNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean register(int scheduleNo) {
		// 스케줄 번호에 대한 좌석 추가
		System.out.println("seat service impl register - scheduleNo : " + scheduleNo);
		List<String> list = new ArrayList<String>();
		list.add("A1");
		list.add("A2");
		list.add("A3");
		
		int ab = seatMapper.insert(scheduleNo, list);
		System.out.println("seatserviceimpl - int : " + ab);
		if(ab>0) return true;
		else return false;
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
