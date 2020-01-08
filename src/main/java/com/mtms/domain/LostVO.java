package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LostVO {
	private int lostNo;
	private String lostTitle;
	private String lostContent;
	private Date lostDate;
	private int lostView;
}
