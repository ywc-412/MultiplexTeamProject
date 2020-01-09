package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.mapper.ScreenMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ScreenServiceImpl implements ScreenService{
	
	private ScreenMapper screenMapper;

	@Override
	public List<String> getSeat(int screenNo) {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public int getNum(int screenNo) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
}
