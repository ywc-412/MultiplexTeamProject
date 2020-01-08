package com.mtms.service;

import java.util.List;

import com.mtms.domain.MemberVO;

public interface MemberService {
	// 회원 가입 서비스 메서드
	public void join(MemberVO memberVO);
	// 회원 아이디 찾기 서비스 메서드
	public String findId(MemberVO memberVO);
	// 회원 비밀번호 찾기 -> 재설정 서비스 메서드
	public int findPw(MemberVO memberVO);
	// 회원 목록 조회 서비스 메서드
	public List<MemberVO> getMemberList();
	// 회원 상세보기 서비스 메서드
	public MemberVO getMember(int memberId);
	// 회원 삭제 서비스 메서드
	public int removeMember(int memberId);
}
