package com.mtms.domain;

import java.util.List;

import lombok.Data;

@Data
public class GiftVO {
	private int giftNo;			// 기프티콘 번호
	private String giftName;	// 기프티콘 품목이름
	private int giftPrice;		// 기프티콘 가격
	private String giftSet;		// 기프티콘 구성 (구성명)
	
	private List<GiftAttachVO> attachList; //기프티콘 품목사진
}
