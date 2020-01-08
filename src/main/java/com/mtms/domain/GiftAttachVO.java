package com.mtms.domain;

import lombok.Data;

@Data
public class GiftAttachVO {
	private String uuid;			// gift 첨부파일 이름
	private String uploadPath;		// file upload path!!
	private String fileName;		// 실제 fileName이 들어감
	private String fileType;		// 파일 타입
	private int giftNo;				// 기프트 번호
}
