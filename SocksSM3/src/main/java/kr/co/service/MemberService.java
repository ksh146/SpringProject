package kr.co.service;

import javax.servlet.http.HttpSession;

import kr.co.domain.MemberVO;

public interface MemberService {
	
	public void insert(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public void logout(HttpSession session) throws Exception;
}
