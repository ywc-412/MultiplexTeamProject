package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.MemberVO;

public interface MemberService {
	// 회원 가입 서비스 메서드
	public int join(MemberVO memberVO);
	// 회원 가입 시 아이디 중복 확인
	public MemberVO duplicatedId(String memberId);
	// 회원 가입 시 이메일 중복 확인
	public MemberVO duplicatedEmail(String totalEmail);
	// 회원 아이디 찾기 서비스 메서드
	public String findId(MemberVO memberVO);
	// 회원 비밀찾기 할때 일치 여부?
	public MemberVO findPwByEmail(MemberVO memberVO);
	// 회원 비밀번호 찾기 -> 재설정 서비스 메서드
	public int findPw(MemberVO memberVO);
	// 회원 목록 조회 서비스 메서드
	public List<MemberVO> getMemberList(Criteria cri);
	public int getTotalCount(Criteria cri);
	// 내 정보 상세보기 서비스 메서드
	public MemberVO getMember(String memberId);
	// 회원 삭제 서비스 메서드
	public int removeMember(MemberVO memberVO);
	// 회원 정보 수정 메서드
	public int modifyMember(MemberVO memberVO);
	
}
