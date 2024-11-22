package signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import db.JDBConnect; // JDBConnect 클래스를 import
import db.UsersDAO;
import db.UsersDTO;

@WebServlet("/signup")
public class SignUpController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	// 폼 데이터 가져오기
        String userId = request.getParameter("user_id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        //dto에 저장
        UsersDTO dto = new UsersDTO();
        dto.setUser_id(userId);
        dto.setPassword(password);
        dto.setName(name);
        dto.setEmail(email);
        dto.setPhone(phone);
        //나머지 값 채우기...
        
        
        //dao 인스턴스 생성 및 메서드 호출
        UsersDAO dao = new UsersDAO(getServletContext());
        int result = dao.userInsert(dto);
        
        //페이지이동
        if(result==1) {
        	System.out.println("성공");
        	response.sendRedirect("index.jsp");
        }
        else {
        	System.out.println("실패");
        	response.sendRedirect("signup.jsp");
        }	
    }   
}