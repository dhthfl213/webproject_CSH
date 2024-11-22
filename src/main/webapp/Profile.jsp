<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="db.UsersDAO" %>
<%@ page import="db.UsersDTO" %>

<%
	HttpSession session = request.getSession();  // 세션 객체 가져오기
	String userId = (String) session.getAttribute("userId");  // 세션에서 userId 값 읽기

	if (userId != null) {
    out.println("환영합니다, " + userId + "님!");  // 세션 값 사용
	} else {
    out.println("로그인하지 않았습니다.");
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
	
 	// user 객체가 null인 경우 처리
    if (user == null) {
        out.print("<script>alert('사용자 정보를 불러올 수 없습니다.'); window.location.href='login.jsp';</script>");
        return;
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>내 프로필</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    	body {
    		background-color: #f8f9fa; /* 연한 회색 배경 */
    		display: flex; /* 페이지를 중앙 정렬 */
    		justify-content: center; /* 가로 중앙 정렬 */
    		align-items: center; /* 세로 중앙 정렬 */
    		height: 100vh; /* 화면 높이 전체 사용 */
    	}
    	
    	.signup-form {
    		background: #fff; /* 회원가입 카드 배경 흰색 */
            padding: 2rem; /* 카드 내부 여백 */
            border-radius: 8px; /* 모서리를 둥글게 처리 */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 카드에 그림자 추가 */
            width: 100%; /* 너비 100%로 설정 */
            max-width: 400px; /* 카드의 최대 너비 설정 */
        }
        .form-control:focus {
            /* 입력 필드가 포커스될 때 효과 */
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25); /* 파란색 효과 */
        }
    </style>
</head>
<body>
	
    <h2>내 프로필</h2>

    <h3>User_ID: <%= user.getUser_id() %></h3>

    <form action="editProfile.jsp" method="get">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= user.getName() %>" disabled><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= user.getEmail() %>" disabled><br><br>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="<%= user.getPhone() %>" disabled><br><br>


        <input type="submit" value="Edit Profile" > 
    </form>

    <br>
    
    <a href="editProfile.jsp">Edit Profile</a> <!-- 프로필 수정 페이지로 이동 -->
    
    <form action="logout.jsp" method="post">
        <input type="submit" value="Log Out" >
    </form>
</body>
</html>