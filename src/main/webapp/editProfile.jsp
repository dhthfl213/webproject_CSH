<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="db.UsersDTO" %>
<%@ page import="db.UsersDAO" %>

<%
    // 세션에서 사용자 정보를 가져온다.
    String userId = (String) session.getAttribute("UserId");
    if (userId == null) {
        response.sendRedirect("login.jsp"); // 로그인하지 않으면 로그인 페이지로 리다이렉트
        return;
    }

    // DB 연결 정보 설정
    String oracleDriver = application.getInitParameter("OracleDriver");
    String oracleURL = application.getInitParameter("OracleURL");
    String oracleId = application.getInitParameter("OracleId");
    String oraclePwd = application.getInitParameter("OraclePwd");

    // DAO 인스턴스를 생성하여 사용자 정보 가져오기
    UsersDAO dao = new UsersDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
    UsersDTO user = dao.getUsersDTO(userId, null); // 패스워드가 필요 없으므로 null 전달

    dao.close(); // DB 연결 종료
    
    if (user == null) {
        // 사용자 정보가 없으면 에러 메시지 출력
        out.print("<script>alert('사용자 정보를 불러올 수 없습니다.'); window.location.href='index.jsp';</script>");
        return;
    }
 	// 프로필 수정 성공 여부
    String updateMessage = request.getParameter("updateMessage");
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .form-container {
            background: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        
        .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }

        .btn-custom {
            width: 100%;
        }
        
        .alert {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <div class="form-container">
    	<% if (updateMessage != null) { %>
            <div class="alert alert-success" role="alert">
                <%= updateMessage %>
            </div>
        <% } %>
        <h2 class="mb-4">회원정보 수정</h2>
        <form action="updateProfile.jsp" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="user_id" class="form-label">User ID:</label>
                <input type="text" class="form-control" id="user_id" name="user_id" value="<%= user.getUser_id() %>" readonly>
            </div>

            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= user.getName() %>" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" required>
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Phone:</label>
                <input type="text" class="form-control" id="phone" name="phone" value="<%= user.getPhone() %>" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">New Password:</label>
                <input type="password" class="form-control" id="password" name="password">
                <small class="form-text text-muted">비밀번호를 변경하려면 새로운 비밀번호를 입력하세요.</small>
            </div>

            <div class="d-flex justify-content-between">
                <input type="submit" value="정보 수정" class="btn btn-primary btn-custom">
                <a href="profile.jsp" class="btn btn-secondary btn-custom">취소</a>
            </div>
        </form>
    </div>

<%
    	// 비밀번호 변경이 있으면, 비밀번호 업데이트
        if (newPassword != null && !newPassword.isEmpty()) {
                dao.updatePassword(userId, newPassword);
        }

        // 사용자 정보 업데이트
        boolean updateResult = dao.updateUserProfile(userId, newName, newEmail, newPhone, fileName);
            
        // 업데이트 성공 여부
        if (updateResult) {
            response.sendRedirect("editProfile.jsp?updateMessage=회원 정보가 성공적으로 수정되었습니다.");
        } else {
            out.print("<script>alert('회원 정보 수정에 실패했습니다.');</script>");
        }
        
    }
%>

</body>
</html>