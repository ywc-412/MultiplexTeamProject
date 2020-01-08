package com.mtms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.persistence.CommentReportMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CommentReportServiceImpl implements CommentReportService{
	@Setter(onMethod_= @Autowired)
	private CommentReportMapper commentReportMapper;
}
