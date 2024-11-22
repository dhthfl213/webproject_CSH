<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HD_Community</title>
</head>
<body>
<h2>HD_Community - 상세 보기(View)</h2>

<table border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>
    <!-- 
    Controller에서 인출한 레코드를 저장한 DTO객체를 출력해준다.
    EL을 사용하면 멤버변수명만으로 getter를 호출하여 내용을 출력할 수 있다.
     --> 
    <tr>
        <td>번호</td> <td>${ dto.post_id }</td>
        <td>작성자</td> <td>${ dto.user_id }</td>
    </tr>
    <tr>
        <td>작성일</td> <td>${ dto.reg_date }</td>
        <td>조회수</td> <td>${ dto.view_count }</td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${ dto.title }</td>
    </tr>
    <tr>
        <td>내용</td>
        <!-- 게시물 작성시 등록한 첨부파일이 있는 경우에는 -->
        <td colspan="3" height="100">${ dto.content }</td>
           <!-- 이미지를 출력한다 -->
           <c:if test="${ not empty dto.ofile }">
              <br><img src="../Uploads/${ dto.sfile }" style="max-width:100%;"/>
           </c:if>
    </tr> 
    <tr>
        <td>첨부파일</td>
        <td>
           <!-- 첨부파일이 있다면 다운로드 링크를 출력한다. -->
           <c:if test = "${ not empty dto.ofile }">
           ${ dto.ofile }
              <!-- 링크는 공백없이  한줄로 작성해야한다. -->
              <a href = "../board/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&file_name=${ dto.file_name }">            
                [다운로드] 
              </a>
            </c:if>           
        </td>
         <td>다운로드수</td>
         <td>${ dto.downcount }</td>
        
    </tr> 
    <tr>
        <td colspan="4" align="center">
            <button type="button" onclick="location.href='../board/edit.do?post_id=${ param.post_id }';">수정하기</button>
              
            <button type="button" 
                  onclick = "location.href='../board/delete.do?post_id=${ param.post_id }';">삭제하기</button>
            <button type="button"
                onclick="location.href='../board/list.do';">목록 바로가기</button>
        </td>
    </tr>
</table>
	
</body>
</html>

