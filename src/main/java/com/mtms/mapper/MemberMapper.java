package com.mtms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.Criteria;
import com.mtms.domain.MemberVO;

public interface MemberMapper {
	// 권한을 찾기 위한 read 메서드
	public MemberVO read(String memberId);
	// 회원 가입 매퍼
	public int insert(MemberVO memberVO);
	public int insertAuth(String memberId);
	
	// 회원 가입 시 회원 아이디 중복 체크
	public MemberVO duplicatedId(String memberId);
	// 회원 가입 시 회원 이메일 중복 체크
	public MemberVO duplicatedEmail(@Param("memberEmail") String memberEmail, @Param("memberEmailSecond") String memberEmailSecond);
	// 회원 아이디 찾기
	public String selectId(MemberVO memberVO);
	
	// 회원 비밀번호 찾을때 일치여부 쿼리..작동..
	public MemberVO findPw(MemberVO memberVO);
	// 회원 비밀번호 찾기 -> 비밀번호 재설정
	public int updatePw(MemberVO memberVO);
	// 회원 목록 조회 하기
	public List<MemberVO> getMemberList(Criteria cri);
	
	
	// 회원 상세 보기
	public MemberVO getMember(String memberId);
	// 회원 삭제 하기
	public int deleteMember(String memberId);
	// 회원 정보 수정하기
	public int updateMember(MemberVO memberVO);
	
	// 회원 비밀번호 비교하기 위해서 memberPw 를 가져옴
	public String memberPw(String memberId);
}
