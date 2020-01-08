package com.mtms.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MovieVO {
	private int movieNo;
	private String movieTitle;
	private String movieManager;
	private String movieMainActor;
	private String movieSupportActor;
	private String movieGenre;
	private int runningTime;
	private String summary;
	private Date openDate;
	private List<MovieAttachVO> attachList;
}
