package com.mtms.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.mapper.MemberMapper;
import com.mtms.mapper.MovieMapper;
import com.mtms.mapper.ReserveMapper;
import com.mtms.mapper.ScheduleMapper;
import com.mtms.domain.ReserveVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReserveServiceImpl implements ReserveService{
	
//	@Setter(onMethod_ = @Autowired)
	private ReserveMapper reserveMapper;
	private MovieMapper movieMapper;
	private MemberMapper memberMapper;
	private ScheduleMapper scheduleMapper;

	@Override
	public ReserveVO get(String reserveNo) {
		// TODO Auto-generated method stub
		// mapper.read
		return null;
	}

	@Override
	public List<ReserveVO> getList(String memberId) {
		// TODO Auto-generated method stub
		//mapper.getList
		return null;
	}

	@Override
	public void register(ReserveVO rvo) {
		// TODO Auto-generated method stub
		// mapper.insert
	}

	@Override
	public boolean refund(String reserveNum) {
		// TODO Auto-generated method stub
		//mapper.update
		return false;
	}
}
