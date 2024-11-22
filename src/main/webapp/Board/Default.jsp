<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HD_Community</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <div class="text-center">
        <h2 class="mb-4">HD_Community</h2>
        <a href="../board/list.do" class="btn btn-primary">게시판 목록 바로가기</a>
        
        <!-- 링크가 작동하지 않을 경우를 위한 에러 메시지 -->
        <% 
        String error = request.getParameter("error");
        if(error != null && error.equals("true")) {
        %>
            <div class="alert alert-danger mt-3">
                페이지를 찾을 수 없습니다. 관리자에게 문의하세요.
            </div>
        <% } %>
    </div>
</body>
</html>