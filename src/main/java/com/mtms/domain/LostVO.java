package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LostVO {
	private int lostNo;				// 습득물 번호
	private String lostTitle;		// 습득물 제목
	private String lostContent;		// 습득물 내용
	private Date lostDate;			// 습득물 작성 시간
	private int lostView;			// 습득물 조회수
}
