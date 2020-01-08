package com.mtms.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MyGiftVO {
	private String memberId;			// 회원 아이디
	private int giftNo;					// 기프티콘 번호
	private int myGiftNo;				// 내 기프티콘 번호
	private Date buyingDate;			// 구입 일자
	private Date expireDate;			// 만료 일자
	private boolean expireChk;			// 만료 여부?
	private int status;					// 현재 상태
	
	private List<GiftAttachVO> attachList; //기프티콘 품목사진
}
