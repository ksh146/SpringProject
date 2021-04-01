package kr.co.ezen;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MybatisTest {
	
	@Autowired
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFatory() {
		System.out.println("::::::::::::::");
		System.out.println(sqlFactory);
		System.out.println("::::::::::::::");
	}
	
	@Test
	public void testSession() {
		SqlSession session = sqlFactory.openSession();
		
		System.out.println(session);
		session.close();
	}
	
	

}
