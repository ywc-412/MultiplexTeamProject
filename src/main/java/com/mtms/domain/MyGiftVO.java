package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MyGiftVO {
	private String memberId;
	private int giftNo;
	private int myGiftNo;
	private Date buyingDate;
	private Date expireDate;
	private Date expireChk;
	private int status;
}
