<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/css/style.css">
    <style>
        /* 공통 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .login-container h1 {
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
            color: #333;
        }
        .login-container form {
            display: flex;
            flex-direction: column;
        }
        .login-container label {
            margin-bottom: 0.5rem;
            text-align: left;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            padding: 0.8rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }
        .login-container input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 0.8rem;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .login-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .login-container .error-message {
            color: red;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }
        .login-container a {
            color: #007bff;
            text-decoration: none;
            font-size: 0.9rem;
        }
        .login-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%
    // 세션에 UserName 값이 있는지 확인
    if (session.getAttribute("UserName") == null) { 
        // UserName이 없으면 로그인 상태가 아니므로 로그인 폼을 표시
%>
    <div class="login-container">
        <h1>로그인</h1>

        <!-- 에러 메시지 표시 영역 -->
        <div class="error-message">
            <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
        </div>

        <!-- 로그인 폼 -->
        <form action="LoginProcess.jsp" method="post" onsubmit="return validateForm(this);">
            <label for="user_id">아이디</label>
            <input type="text" id="user_id" name="user_id" placeholder="아이디를 입력하세요" required>

            <label for="user_pw">비밀번호</label>
            <input type="password" id="user_pw" name="user_pw" placeholder="비밀번호를 입력하세요" required>

            <input type="submit" value="로그인">
        </form>

        <!-- 회원가입 링크 -->
        <p>계정이 없으신가요? <a href="signup.jsp">회원가입</a></p>
    </div>
<%
    } else { 
        // UserName이 있으면 로그인 상태이므로 환영 메시지와 로그아웃 링크를 표시
%>
    <div class="login-container">
        <h1>환영합니다!</h1>
        <p><%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.</p>
        <a href="logout.jsp">[로그아웃]</a>
        <a href="index.jsp">[Home]</a>
    </div>
<%
    }
%>
    <script>
        /**
         * 클라이언트 측 유효성 검증 함수
         * 로그인 폼이 비어 있는 경우 경고를 표시하고 제출을 방지
         */
        function validateForm(form) {
            if (!form.user_id.value) {
                alert("아이디를 입력하세요.");
                form.user_id.focus();
                return false;
            }
            if (!form.user_pw.value) {
                alert("비밀번호를 입력하세요.");
                form.user_pw.focus();
                return false;
            }
            return true;
        }
    </script>
</body>
</html>