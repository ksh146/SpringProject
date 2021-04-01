package kr.co.ezen;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class OracleConnectionTest {
	
	private final String DRIVER = "oracle.jdbc.OracleDriver";
	private final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "ezen3";
	private final String PW = "ezen3";
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);
		System.out.println("드라이버 로딩 성공");
		
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PW);
			System.out.println("커넥션 연결 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
	}
	
}
