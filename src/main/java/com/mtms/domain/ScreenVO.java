package com.mtms.domain;

import lombok.Data;

@Data
public class ScreenVO {
	private int screenNo;		// 상영관
	private String seatNo;		// 좌석번호 [A1, A2, A3, ... ]
}