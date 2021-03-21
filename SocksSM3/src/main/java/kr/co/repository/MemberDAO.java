package kr.co.repository;

import kr.co.domain.MemberVO;

public interface MemberDAO {
	
	public void insert(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;

}
