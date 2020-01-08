package com.mtms.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.mtms.mapper.ReserveMapper;
=======
import com.mtms.domain.ReserveVO;
import com.mtms.persistence.ReserveMapper;
>>>>>>> d47745afa78514a48ab8d8d27ff650741a180262

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReserveServiceImpl implements ReserveService{
	@Setter(onMethod_ = @Autowired)
	private ReserveMapper reserveMapper;

	@Override
	public ReserveVO get(String reserveNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReserveVO> getList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void register(ReserveVO rvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean modify(String reserveNum) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<String> getSeat(int screenNo, Date scheduleDate, String scheduleTime) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getNum(int screenNo, Date scheduleDate, String scheduleTime) {
		// TODO Auto-generated method stub
		return 0;
	}
}
