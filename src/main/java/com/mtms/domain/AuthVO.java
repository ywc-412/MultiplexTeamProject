package com.mtms.domain;

import lombok.Data;

@Data
public class AuthVO {
	private String memberId;	// 회원 id
	private String memberAuth;	// 회원 권한
}
