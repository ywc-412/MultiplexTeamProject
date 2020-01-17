package com.mtms.service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mtms.domain.Criteria;
import com.mtms.domain.MemberVO;
import com.mtms.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	private MemberMapper memberMapper;
	private BCryptPasswordEncoder bcryptpwEncoder;
	
	@Override
	@Transactional
	public int join(MemberVO memberVO) {
		// password 인코딩을 위한 bcryptpwEncoder;;;
		String password = memberVO.getMemberPw();
		String encodedPassword = bcryptpwEncoder.encode(password);
		memberVO.setMemberPw(encodedPassword);
		// 인코딩 완료
		// 회원 먼저 insert 하기 때문에 pk 문제 없음
		memberMapper.insert(memberVO);
		
		//회원 권한 같이 전송
		return memberMapper.insertAuth(memberVO.getMemberId());
	}

	@Override
	public String findId(MemberVO memberVO) {
		return memberMapper.selectId(memberVO);
	}
	
	@Override
	public MemberVO findPwByEmail(MemberVO memberVO) {
		
		return memberMapper.findPw(memberVO);
	}
	
	@Override
	public int findPw(MemberVO memberVO) {
		
		String get = memberVO.getMemberId();
		
		
		String password = memberVO.getMemberPw();
		String encodedPassword = bcryptpwEncoder.encode(password);
		memberVO.setMemberPw(encodedPassword);
		
		
		return memberMapper.updatePw(memberVO);
	}

	@Override
	public List<MemberVO> getMemberList(Criteria cri) {
		return memberMapper.getMemberList(cri);
	}

	// 내 정보 상세보기 메서드
	@Override
	public MemberVO getMember(String memberId) {
		return memberMapper.getMember(memberId);
	}

	@Override
	public int removeMember(MemberVO memberVO) {
		
		String memberId = memberVO.getMemberId();
		
		String memberRealId [] = memberId.split(",");
		
		
		String resultPw = memberMapper.memberPw(memberRealId[0]);
		
		if(resultPw != null) {
			boolean result = bcryptpwEncoder.matches(memberVO.getMemberPw(), resultPw);
			if(result == false) {
				return -1;
			}
		}
		
		return memberMapper.deleteMember(memberRealId[0]);
	}

	@Override
	public int modifyMember(MemberVO memberVO) {
		
		String password = memberVO.getMemberPw();
		String encodedPassword = bcryptpwEncoder.encode(password);
		memberVO.setMemberPw(encodedPassword);
		
		
		return memberMapper.updateMember(memberVO);
	}

	@Override
	public MemberVO duplicatedId(String memberId) {
		return memberMapper.duplicatedId(memberId);
	}

	@Override
	public MemberVO duplicatedEmail(String totalEmail) {
		
		
		String totalMemberEmail[] = totalEmail.split("@");
		
		String memberEmail = totalMemberEmail[0];	
		String memberEmailSecond = totalMemberEmail[1];
				
		return memberMapper.duplicatedEmail(memberEmail, memberEmailSecond);
	}

	
}
