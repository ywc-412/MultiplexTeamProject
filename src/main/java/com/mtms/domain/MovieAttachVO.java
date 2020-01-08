package com.mtms.domain;

import lombok.Data;

@Data
public class MovieAttachVO {
	private String uuid;			// 영화 uuid
	private String uploadPath;		// 영화 업로드 경로 들어감
	private String fileName;		// 영화 실제 파일 이름
	private String fileType;		// 파일 타입
	private int movieNo;			// 영화 번호
}
