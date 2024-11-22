<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL사용을 위한 taglib 지시어 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HD_Community</title>
<style>
a {
	text-decoration: none;
}
</style>
</head>
<body>
	<h2>HD_Community - 목록(List)</h2>

	<!-- 검색 폼 -->
	<!-- 검색어를 입력후 "검색" 버튼을 누르면 현재페이지로 입력한 폼값이 전송된다.
       action속성을 별도로 추가하지 않으면 현재페이지가 된다. -->
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="name">작성자</option>
						<option value="board_type">게시판 유형</option>
				</select> <input type="text" name="searchWord" /> <input type="submit"
					value="검색하기" /></td>
			</tr>
		</table>
	</form>

	<!-- 목록 테이블 -->
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="15%">게시판 유형</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="8%">첨부</th>
			<th width="15%">수정일</th>
		</tr>
		<c:choose>
			<c:when test="${ empty boardLists }">
				<!--List에 저자된 값이 없다면 등록된 게시물이 없거나, 검색된 게시물이
      없는 경우  -->
				<tr>
					<td colspan="8" align="center">등록된 게시물이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<!-- List에 저장된 데이터가 있다면, 크기만큼 반복하여 출력한다.
   해당 루프의 데이터를 인출하여 변수 row에 할당한다 -->
				<c:forEach items="${ boardLists }" var="row" varStatus="loop">
					<tr align="center">
						<!-- 게시물의 갯수를 저장한 totalCOunt에서 인출되는 인스턴스의 인덱스를
           차감해서 순차적인 번호를 출력 -->
						<td>${ map.totalCount - loop.index }</td>
						<td align="left">
							<!-- 제목 클릭시 '열람'페이지로 이동해야 하므로 게시물의
                  일련번호를 파라미터로 전달한다/ --> <a
							href="../board/view.do?idx=${ row.idx }"> ${ row.title }</a>
						</td>
						<!-- 현재 루프에서 row는 MVCBoardDTO를 의미하므로 각 멤버변수의
               getter()를 통해 저장된 값을 출력한다.  -->
						<td>${ row.id }</td>
						<td>${ row.board_type }</td>
						<td>${ row.visitcount }</td>
						<td>${ row.postdate }</td>
						<td>
							<!-- 첨부파일이 있는 경우에몬 다운로드 링크를 출력한다 --> <c:if
								test="${ not empty row.ofile }">
								<a
									href="../board/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[Down]</a>
							</c:if>
						<td>${ row.updatedate }</td>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<!-- 하단 메뉴(바로가기, 글쓰기) -->
	<table border="1" width="90%">
		<tr align="center">
			<td>
				<!-- 현재 페이지번호 없음 -->
			</td>
			<td width="100"><button type="button"
					onclick="location.href='../board/write.do';">글쓰기</button></td>
		</tr>
	</table>
</body>
</html>