<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="db.UsersDAO" %>
<%
    // 폼 데이터 가져오기
    String userId = (String) session.getAttribute("UserId");
	//current(현재)비밀번호 확인
    String currentPassword = request.getParameter("current_password");
    String newPassword = request.getParameter("new_password");
    String userName = request.getParameter("user_name");
    String userEmail = request.getParameter("user_email");

    // DB 연결 정보 가져오기
    String oracleDriver = application.getInitParameter("OracleDriver");
    String oracleURL = application.getInitParameter("OracleURL");
    String oracleId = application.getInitParameter("OracleId");
    String oraclePwd = application.getInitParameter("OraclePwd");

    UsersDAO dao = new UsersDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
    boolean isUpdated = false;

    try {
        // 현재 비밀번호 검증
        boolean isPasswordCorrect = dao.validatePassword(userId, currentPassword);
        if (isPasswordCorrect) {
            // 새 비밀번호가 입력된 경우만 비밀번호 변경
            String passwordToUpdate = newPassword.isEmpty() ? currentPassword : newPassword;

            // 회원정보 수정
            isUpdated = dao.updateUserInfo(userId, passwordToUpdate, userName, userEmail);
        } else {
            request.setAttribute("errorMsg", "현재 비밀번호가 올바르지 않습니다.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        dao.close();
    }

    if (isUpdated) {
        // 수정 성공
        session.setAttribute("UserName", userName); // 세션 정보 업데이트
        response.sendRedirect("editSuccess.jsp");
    } else {
        // 수정 실패
        request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
        request.getRequestDispatcher("editProfile.jsp").forward(request, response);
    }
%>