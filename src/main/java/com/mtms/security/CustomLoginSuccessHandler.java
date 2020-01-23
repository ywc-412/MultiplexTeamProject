package com.mtms.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		request.setAttribute("successMsg", "환영합니다!");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("s_cineS", "s_cine_"+(int)(Math.random()*999999));
		
		System.out.println(session.getAttribute("s_cineS"));
		response.sendRedirect("/");
	}
	
	
}
