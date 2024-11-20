<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /*
    로그아웃 처리 1: 세션 영역에서 사용자 정보를 담고 있는 속성들(UserId, UserName)을 개별적으로 제거합니다.
    */
    session.removeAttribute("UserId");  // UserId 세션 속성 삭제
    session.removeAttribute("UserName");  // UserName 세션 속성 삭제

    /*
    로그아웃 처리 2: 세션 영역 전체를 무효화하여 모든 세션 정보를 제거합니다.
    회원 인증 외에도 다른 데이터를 세션에 저장했다면 그 데이터도 함께 제거되므로 주의가 필요합니다.
    */
    session.invalidate();  // 세션 전체 무효화

    // 로그아웃 후 로그인 페이지로 리디렉션합니다.
    response.sendRedirect("login.jsp");  // 로그인 페이지로 리디렉션
%>

<!-- HTML을 추가하여 페이지 구조를 정의할 수 있습니다. 아래는 기본적인 틀로, 실제로 렌더링되지는 않지만 필요할 수 있습니다. -->
<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
</head>
<body>
    <!-- 이 페이지는 바로 리디렉션되므로 여기에는 내용이 표시되지 않습니다. -->
</body>
</html>