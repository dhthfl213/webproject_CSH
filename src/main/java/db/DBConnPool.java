package db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnPool {
	
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	// 기본 생성자
	public DBConnPool() {
		try {
			// 1. context 인스턴스를 생성한다. Tomcat 웹서버라 생각하면 된다.
			Context initCtx = new InitialContext();
			// 2. JNDI 서비스 구조의 초기 Root 디렉토리를 얻어온다.
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			// 3. server.xml에 등록한 네이밍을 Lookup 하여 DataSource를 얻어온다.
			DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");
			// 4. 커넥션풀에 생성해 둔 객체를 가져다가 사용한다.
			con = source.getConnection();
			System.out.println("DB 커넥션 풀 연결 성공");
		} 
		catch (Exception e) {
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			System.out.println("DB 커넥션 풀 자원 반납");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
	
