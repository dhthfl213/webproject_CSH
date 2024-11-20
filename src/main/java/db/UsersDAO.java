package db;

import jakarta.servlet.ServletContext;


public class UsersDAO extends JDBConnect {

	// 생성자 추가
    public UsersDAO(String oracleDriver, String oracleURL, String oracleId, String oraclePwd) {
        super(oracleDriver, oracleURL, oracleId, oraclePwd);  // 부모 클래스인 JDBConnect의 생성자 호출
    }
    
    public UsersDAO(ServletContext servletContext) {
		// TODO Auto-generated constructor stub
	}

	public UsersDTO getUsersDTO(String uid, String upass)	{
		//회원인증을 위한 쿼리문 실행 후 회원정보를 저장하기 위한 인스턴스 생성
		UsersDTO dto = new UsersDTO();
		/*로그인 폼에서 입력한 아이디, 패스워드를 통해 인파라미터를
		 설정할 수 있도록 쿼리문을 작성*/
		String query = "SELECT * From member WHERE id=? AND pass=?";
		
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
				dto.setUser_id(rs.getString(1));
	            dto.setPassword(rs.getString(2));
	            dto.setName(rs.getString(3));
	            dto.setEmail(rs.getString(4));
	            dto.setPhone(rs.getString(5));
	            dto.setDate(rs.getString(6));

			}
		}
		catch (Exception e)	{
			e.printStackTrace();
		}
		//회원정보를 저장한 DTO객체를 반환한다.
		return dto;
	}
    
    

	public int userInsert(UsersDTO usersDTO) {
		int result = 0;
		String query = "insert into users (user_id, password, name, email, phone, date) values "
				+ " (?, ?, ?, ?, ?, sysdate)";		
		try {
			
			psmt = con.prepareStatement(query);
	         //인스턴스를 통해 인파라미터 설정
	         psmt.setString(1, usersDTO.getUser_id());
	         psmt.setString(2, usersDTO.getPassword());
	         psmt.setString(3, usersDTO.getName());
	         psmt.setString(4, usersDTO.getEmail());
	         psmt.setString(5, usersDTO.getPhone());
	         psmt.setString(6, usersDTO.getDate());
	         //쿼리문 실행. insert 쿼리의 경우 입력된 행의 갯수가 반환됨.
	         result = psmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace(); // 콘솔에 예외 메시지를 출력
		}
		
		return result;		
	}
}
