package com.mtms.domain;

import lombok.Data;

@Data
public class ScreenVO {
	private int screenNo;		// 상영관
	private int screenRow;		// 관 행 수
	private int screenCol;		// 관 열 수
}
