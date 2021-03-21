package kr.co.repository;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String NS = "kr.co.mappers.memberMapper";

	@Override
	public void insert(MemberVO vo) throws Exception {
		sql.insert(NS + ".insert", vo);
		
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return sql.selectOne(NS + ".login", vo);
	}

}
