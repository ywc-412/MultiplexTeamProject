package com.mtms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.mapper.LostMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class LostServiceImpl implements LostService{
	@Setter(onMethod_= @Autowired)
	private LostMapper lostMapper;
}
