package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PhoneAuthVO {
	private String authPhone;
	private String authNumber;
	private Date authDate;
}
