<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="db.UsersDAO" %>
<%@ page import="db.UsersDTO" %>

<%
    // 사용자 입력 정보 받기
    String userId = request.getParameter("user_id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");

    // DB 연결 정보 설정
    String oracleDriver = application.getInitParameter("OracleDriver");
    String oracleURL = application.getInitParameter("OracleURL");
    String oracleId = application.getInitParameter("OracleId");
    String oraclePwd = application.getInitParameter("OraclePwd");

    // DAO 인스턴스를 생성하여 사용자 정보 업데이트
    UsersDAO dao = new UsersDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
    UsersDTO userDTO = new UsersDTO();
    userDTO.setUser_id(userId);
    userDTO.setName(name);
    userDTO.setEmail(email);
    userDTO.setPhone(phone);
    
    // 비밀번호가 입력된 경우에만 비밀번호 업데이트
    if (password != null && !password.isEmpty()) {
        userDTO.setPassword(password);
    }

    // 사용자 정보를 DB에 업데이트
    int result = dao.updateUser(userDTO); 
    dao.close(); // DB 연결 종료

    // 결과에 따라 처리
    if (result > 0) {
        // 성공 시 프로필 페이지로 리다이렉트
        response.sendRedirect("profile.jsp?updateMessage=회원 정보가 성공적으로 수정되었습니다.");
    } else {
        // 실패 시 수정 페이지로 리다이렉트하고 오류 메시지 전달
        request.setAttribute("updateError", "프로필 업데이트 실패!");
        request.getRequestDispatcher("editProfile.jsp").forward(request, response);
    }
%>