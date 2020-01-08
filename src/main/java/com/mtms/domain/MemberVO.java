package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberAddress;
	private String memberPhone;
	private Date memberBirth;
	private String memberEmail;
}
