package login;

import java.io.IOException;
import db.UsersDAO;
import db.UsersDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginAction")  // 로그인 액션 서블릿
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
        String password = request.getParameter("password");

        UsersDAO dao = new UsersDAO(getServletContext());
        UsersDTO user = dao.getUsersDTO(user_id, password);

        if (user != null) {
            // 로그인 성공 시 세션 생성
            HttpSession session = request.getSession();
            session.setAttribute("user_id", user.getUser_id()); // 세션에 user_id 저장

            // 로그인 성공 후 리디렉션
            response.sendRedirect("index.jsp");  // 로그인 후 메인 페이지로 이동
        } else {
            // 로그인 실패 시 메시지와 함께 로그인 페이지로 돌아가기
        	request.setAttribute("LoginErrMsg", "아이디 또는 비밀번호가 잘못되었습니다.");
            request.getRequestDispatcher("login.jsp").forward(request, response);  // 로그인 실패 시 로그인 페이지로 다시 리디렉션
        }
    }
}