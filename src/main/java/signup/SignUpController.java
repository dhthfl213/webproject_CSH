package signup;

import java.io.IOException;
import db.UsersDAO;
import db.UsersDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signupAction")  // 이 서블릿은 '/signupAction' URL 패턴으로 매핑됩니다.
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;  // 서블릿의 버전 관리용 serialVersionUID

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트에서 전달된 파라미터 값을 가져옵니다.
		// 회원 가입 폼에서 입력받은 값들을 파라미터로 받습니다.
		String user_id = req.getParameter("user_id");  // 사용자 아이디
		String password = req.getParameter("password");  // 사용자 비밀번호
		String name = req.getParameter("name");  // 사용자 이름
		String email = req.getParameter("email");  // 사용자 이메일
		String phone = req.getParameter("phone");  // 사용자 전화번호
		
		// 사용자 정보를 담을 UsersDTO 객체 생성
		UsersDTO usersDTO = new UsersDTO();
		usersDTO.setUser_id(user_id);  // 사용자 아이디 설정
		usersDTO.setPassword(password);  // 사용자 비밀번호 설정
		usersDTO.setName(name);  // 사용자 이름 설정
		usersDTO.setEmail(email);  // 사용자 이메일 설정
		usersDTO.setPhone(phone);  // 사용자 전화번호 설정
		
		// DAO 클래스의 userInsert 메서드를 호출하여 DB에 사용자 정보를 삽입
		UsersDAO dao = new UsersDAO(getServletContext());  // UsersDAO 객체 생성
		int result = dao.userInsert(usersDTO);  // userInsert 메서드를 호출하여 DB에 정보 삽입
		if(result == 1) {  // 삽입 성공시
			System.out.println("입력성공");  // 콘솔에 성공 메시지 출력
		}
		else {  // 삽입 실패시
			System.out.println("입력실패");  // 콘솔에 실패 메시지 출력
		}
		
		// 회원 가입 후 index.jsp로 리디렉션하여 페이지 이동
		resp.sendRedirect("./index.jsp");  // 회원가입 완료 후, index.jsp 페이지로 리디렉션
	}
}