package com.mtms.domain;

import lombok.Data;

@Data
public class SuggestVO {
	private int suggestNo;
	private String memberId;
	private String suggestTitle;
	private String suggestContent;
	private boolean suggestPrivateChk;
	private String suggestPw;
	private int suggestView;
}
