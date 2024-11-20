<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
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
    <div class="signup-form">
        <h2 class="text-center mb-4">회원가입</h2> <!-- 제목: 가운데 정렬, 아래 여백 -->
        <form action="signupAction" method="post"> <!-- 폼 데이터를 signupAction으로 POST 방식으로 전송 -->
            <!-- 아이디 입력 -->
            <div class="mb-3">
                <label for="user_id" class="form-label">아이디</label> <!-- 입력 필드에 대한 설명 -->
                <input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디를 입력하세요" required>
                <!-- 아이디 입력 필드: 필수 입력, 안내 텍스트 추가 -->
            </div>
            <!-- 비밀번호 입력 -->
            <div class="mb-3">
                <label for="password" class="form-label">비밀번호</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요" required>
                <!-- 비밀번호 입력 필드: 필수 입력, 비밀번호 가려짐 -->
            </div>
            <!-- 이름 입력 -->
            <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요" required>
                <!-- 이름 입력 필드: 필수 입력 -->
            </div>
            <!-- 이메일 입력 -->
            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input type="email" id="email" name="email" class="form-control" placeholder="example@email.com" required>
                <!-- 이메일 입력 필드: 필수 입력, 이메일 형식으로 검증 -->
            </div>
            <!-- 전화번호 입력 -->
            <div class="mb-3">
                <label for="phone" class="form-label">전화번호</label>
                <input type="text" id="phone" name="phone" class="form-control" placeholder="010-1234-5678">
                <!-- 전화번호 입력 필드: 선택 입력 -->
            </div>
            <!-- 회원가입 버튼 -->
            <button type="submit" class="btn btn-primary w-100">회원가입</button>
            <!-- 버튼 스타일: 파란색 버튼, 너비 100% -->
        </form>
        <p class="text-center mt-3">
            이미 계정이 있으신가요? <a href="login.jsp">로그인</a>
            <!-- 로그인 페이지로 이동하는 링크 -->
        </p>
    </div>
    <!-- Bootstrap JavaScript (선택 사항, 동적 컴포넌트 지원) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>