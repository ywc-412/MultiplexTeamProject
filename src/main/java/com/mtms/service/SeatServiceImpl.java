package com.mtms.service;

import java.util.List;

import com.mtms.domain.SeatVO;
import com.mtms.mapper.SeatMapper;

public class SeatServiceImpl implements SeatService {
	
	private SeatMapper seatMapper;

	@Override
	public List<SeatVO> getStatus(int scheduleNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void register(List<SeatVO> seatList) {
		// TODO Auto-generated method stub
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
