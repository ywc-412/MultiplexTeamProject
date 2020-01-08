package com.mtms.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;		// 회원 아이디
	private String memberPw;		// 회원 비밀번호
	private String memberName;		// 회원 이름
	private String memberAddress;	// 회원 주소
	private String memberPhone;		// 회원 전화번호
	private Date memberBirth;		// 회원 생년월일
	private String memberEmail;		// 회원 이메일
}
