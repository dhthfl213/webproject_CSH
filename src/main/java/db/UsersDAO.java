package db;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletContext;
import db.UsersDTO;


public class UsersDAO extends JDBConnect {

	// 생성자 추가
    public UsersDAO(String oracleDriver, String oracleURL, String oracleId, String oraclePwd) {
        super(oracleDriver, oracleURL, oracleId, oraclePwd);  // 부모 클래스인 JDBConnect의 생성자 호출
    }
    
    //생성자2 : application 내장객체를 매개변수로 정의
  	public UsersDAO(ServletContext application)	{
  		super(application);
  	}
  	
	public UsersDTO getUsersDTO(String uid, String upass)	{
		//회원인증을 위한 쿼리문 실행 후 회원정보를 저장하기 위한 인스턴스 생성
		UsersDTO dto = new UsersDTO();
		/*로그인 폼에서 입력한 아이디, 패스워드를 통해 인파라미터를
		 설정할 수 있도록 쿼리문을 작성*/
		String query = "SELECT * From users WHERE user_id=? AND password=?"; 
		
		try	 {
			//쿼리문 실행을 위한 prepared 인스턴스 생성
			psmt = con.prepareStatement(query);
			//쿼리문의 인파라미터 설정(아이디와 비번)
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			//쿼리문 실행 및 결과는 ResultSet으로 반환받는다.    
			rs = psmt.executeQuery();
			//반환된 ResultSet 객체레 정보가 저장되어 있는지 확인한다.
			if (rs.next())	{
				//회원정보가 있다면 DTO 객체에 저장한다.
				dto = new UsersDTO(); // DTO 객체 초기화
				dto.setUser_id(rs.getString("user_id"));
	            dto.setPassword(rs.getString("password"));
	            dto.setName(rs.getString("name"));
	            dto.setEmail(rs.getString("email"));
	            dto.setPhone(rs.getString("phone"));
	            dto.setDate(rs.getString("date"));

			}
		}
		catch (Exception e)	{
			System.err.println("회원 인증 중 오류 발생");
			e.printStackTrace();
		}
		//회원정보를 저장한 DTO객체를 반환한다.
		return dto;
	}
    
    
	// 회원 가입 메서드
	public int userInsert(UsersDTO usersDTO) {
		int result = 0;
		String query = "insert into users (user_id, password, name, email, phone, reg_date) values "
				+ " (?, ?, ?, ?, ?, sysdate)";		
		try {
			
			 psmt = con.prepareStatement(query);
	         //인스턴스를 통해 인파라미터 설정
	         psmt.setString(1, usersDTO.getUser_id());
	         psmt.setString(2, usersDTO.getPassword());
	         psmt.setString(3, usersDTO.getName());
	         psmt.setString(4, usersDTO.getEmail());
	         psmt.setString(5, usersDTO.getPhone());
	   
	         //쿼리문 실행. insert 쿼리의 경우 입력된 행의 갯수가 반환됨.
	         result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.err.println("회원 가입 중 오류 발생");
			e.printStackTrace(); // 콘솔에 예외 메시지를 출력
		}
		
		return result;		
	}
	
	public boolean validatePassword(String userId, String password) throws Exception {
        String query = "SELECT COUNT(*) FROM users WHERE user_id = ? AND password = ?";
        psmt = con.prepareStatement(query);
        psmt.setString(1, userId);
        psmt.setString(2, password);
        rs = psmt.executeQuery();

        if (rs.next() && rs.getInt(1) > 0) {
            return true; // 비밀번호 일치
        }
        return false; // 비밀번호 불일치
    }

    // 회원정보 수정
	public boolean updateUserInfo(UsersDTO userDTO) {
	    String query = "UPDATE users SET name = ?, email = ?, phone = ?, password = ? WHERE user_id = ?";
	    try (PreparedStatement psmt = con.prepareStatement(query)) {
	        psmt.setString(1, userDTO.getName());
	        psmt.setString(2, userDTO.getEmail());
	        psmt.setString(3, userDTO.getPhone());
	        psmt.setString(4, userDTO.getPassword());
	        psmt.setString(5, userDTO.getUser_id());
	        return psmt.executeUpdate() > 0; // 업데이트 성공 여부 반환
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
    // 회원 정보 업데이트
    public int updateUser(UsersDTO userDTO) {
        int result = 0;
        String query = "UPDATE users SET name=?, email=?, phone=?, password=? WHERE user_id=?";
        
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, userDTO.getName());
            psmt.setString(2, userDTO.getEmail());
            psmt.setString(3, userDTO.getPhone());
            psmt.setString(4, userDTO.getPassword());
            psmt.setString(5, userDTO.getUser_id());
            
            result = psmt.executeUpdate(); // 쿼리 실행
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }
    // 회원 정보 삭제
    public boolean deleteUser(String userId) {
        String query = "DELETE FROM users WHERE user_id = ?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, userId);
            int result = psmt.executeUpdate();
            return result > 0; // 삭제 성공 여부 반환
        } catch (Exception e) {
            e.printStackTrace();
            return false; // 예외 발생 시 삭제 실패
        }
    }
    // 비밀번호 변경
    public boolean changePassword(String userId, String newPassword) {
        String query = "UPDATE users SET password = ? WHERE user_id = ?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, newPassword);
            psmt.setString(2, userId);
            int result = psmt.executeUpdate();
            return result > 0; // 비밀번호 변경 성공 여부 반환
        } catch (Exception e) {
            e.printStackTrace();
            return false; // 예외 발생 시 변경 실패
        }
    }
    public void close() {
        try {
            if (rs != null) rs.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
