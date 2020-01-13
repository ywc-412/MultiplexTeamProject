package com.mtms.domain;

import lombok.Data;

@Data
public class GiftAttachVO {
	private String giftUuid;			// gift 고유 이름
	private String giftUploadPath;		// 업로드 경로
	private String giftFileName;		// 파일 이름
	private int giftNo;				// 기프트 번호
}
