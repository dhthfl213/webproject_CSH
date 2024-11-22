package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
    // 멤버변수 : DB 연결, 정적/동적 쿼리 실행, select 결과 반환
    public Connection con;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;

    // 기본 생성자 : 매개변수가 없는 생성자
    public JDBConnect() {
        try {
            // 오라클 드라이버 메모리에 로드
            Class.forName("oracle.jdbc.OracleDriver");
            // 커넥션 URL 생성
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            // 계정의 아이디와 비밀번호
            String id = "webproject_db";
            String pwd = "1234";
            // 데이터베이스 연결 시도
            con = DriverManager.getConnection(url, id, pwd);
            // Connection 인스턴스가 반환되면 연결 성공
            System.out.println("DB 연결 성공(기본 생성자)");
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 인자 생성자1 : 데이터베이스 연결을 위한 매개변수 받기
    public JDBConnect(String driver, String url, String id, String pwd) {
        try {
            // 오라클 드라이버 메모리에 로드
            Class.forName(driver);
            // 데이터베이스 연결 시도
            con = DriverManager.getConnection(url, id, pwd);
            // Connection 인스턴스가 반환되면 연결 성공
            System.out.println("DB 연결 성공(인수 생성자1)");
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 인자 생성자2 : application 내장객체의 원본 타입을 매개변수로 선언
    public JDBConnect(ServletContext application) {
        try {
            // 내장 객체를 통해 web.xml의 파라미터값 가져오기
            String driver = application.getInitParameter("OracleDriver");
            String url = application.getInitParameter("OracleURL");
            String id = application.getInitParameter("OracleId");
            String pwd = application.getInitParameter("OraclePwd");

            // 디버깅을 위한 값을 출력
            System.out.println(driver + "=" + url + "=" + id + "=" + pwd);
            Class.forName(driver);
            // 데이터베이스 연결 시도
            con = DriverManager.getConnection(url, id, pwd);
            // Connection 인스턴스가 반환되면 연결 성공
            System.out.println("DB 연결 성공(인수 생성자2)");
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    // DB 연결 해제 메소드
    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();

            System.out.println("JDBC 자원 해제");
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    
}