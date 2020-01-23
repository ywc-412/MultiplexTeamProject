package com.mtms.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class CommentPageDTO {
	
	private int replyCnt;			//댓글갯수
	private List<CommentVO> list;		//댓글리스트

}
