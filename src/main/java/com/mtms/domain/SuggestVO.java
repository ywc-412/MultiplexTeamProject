package com.mtms.domain;

import lombok.Data;

@Data
public class SuggestVO {
	private int suggestNo;					// 건의사항 번호
	private String memberId;				// 회원 아이디
	private String suggestTitle;			// 건의사항 제목
	private String suggestContent;			// 건의사항 내용
	private boolean suggestPrivateChk;		// 건의사항 비밀글 여부
	private String suggestPw;				// 건의사항 비밀글 비밀번호
	private int suggestView;				// 건의사항 조회 수
}
