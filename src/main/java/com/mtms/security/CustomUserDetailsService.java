package com.mtms.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.mtms.domain.MemberVO;
import com.mtms.mapper.MemberMapper;
import com.mtms.security.domain.CustomUser;

import lombok.Setter;

public class CustomUserDetailsService implements UserDetailsService{
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
		
		MemberVO vo = memberMapper.read(memberId);
		
		return vo == null? null : new CustomUser(vo);
	}
	
}
