<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!--
	Transit by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>HD_Communy</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-xlarge.css" />
		</noscript>
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<h1><a href="index.jsp">DevHub</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="generic.jsp">HD_introduce</a></li>
						<li><a href="elements.jsp">HD_Communy</a></li>
					</ul>
				</nav>
			</header>

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="container">

					<header class="major">
						<h2>HD_Communy</h2>
						<p>다양한 개발자들이 모여 서로의 지식과 경험을 나누는 공간입니다.</p>
					</header>

			<!-- Lists -->
			<section>
				<h3>공지</h3>
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="notice-detail.jsp?id=1">공지사항 제목 1</a></td>
								<td>2024-11-21</td>
								<td>123</td>
								<td><a href="edit-notice.jsp?id=1">수정</a> | <a
									href="delete-notice.jsp?id=1"
									onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
							</tr>
							<tr>
								<td><a href="notice-detail.jsp?id=2">공지사항 제목 2</a></td>
								<td>2024-11-20</td>
								<td>98</td>
								<td><a href="edit-notice.jsp?id=2">수정</a> | <a
									href="delete-notice.jsp?id=2"
									onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
							</tr>
							<!-- 추가적인 공지사항 목록 -->
						</tbody>
					</table>
				</div>

				<!-- 공지사항 작성 버튼 -->
				<ul class="actions">
					<li><a href="create-notice.jsp" class="button">공지사항 작성</a></li>
				</ul>
			</section>



			<!-- Table -->
			<section>
				<h3>게시판</h3>
				<h4>게시물 목록</h4>
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><a href="post.jsp?id=1">첫 번째 게시물 제목</a></td>
								<td>홍길동</td>
								<td>2024-11-21</td>
								<td>100</td>
								<td><a href="deletePost.jsp?id=1">삭제</a></td>
							</tr>
							<tr>
								<td>2</td>
								<td><a href="post.jsp?id=2">두 번째 게시물 제목</a></td>
								<td>김철수</td>
								<td>2024-11-20</td>
								<td>50</td>
								<td><a href="deletePost.jsp?id=2">삭제</a></td>
							</tr>
							<!-- 추가적인 게시글들은 이와 같은 형태로 계속 추가 -->
						</tbody>
					</table>
				</div>
			</section>

			<!-- Buttons -->
						<section>
							<h3>Buttons</h3>
							<ul class="actions">
								<li><a href="#" class="button alt">Special</a></li>
								<li><a href="#" class="button">Default</a></li>
							</ul>
							<ul class="actions">
								<li><span class="button alt disabled">Special</span></li>
								<li><span class="button disabled">Default</span></li>
							</ul>
						</section>

					<!-- Form -->
						<section>
							<h3>Form</h3>
							<form method="post" action="#">
								<div class="row uniform 50%">
									<div class="6u 12u$(4)">
										<input type="text" name="name" id="name" value="" placeholder="Name" />
									</div>
									<div class="6u$ 12u$(4)">
										<input type="email" name="email" id="email" value="" placeholder="Email" />
									</div>
									<div class="12u$">
										<div class="select-wrapper">
											<select name="category" id="category">
												<option value="">- Category -</option>
												<option value="1">Manufacturing</option>
												<option value="1">Shipping</option>
												<option value="1">Administration</option>
												<option value="1">Human Resources</option>
											</select>
										</div>
									</div>
									<div class="4u 12u$(3)">
										<input type="radio" id="priority-low" name="priority" checked>
										<label for="priority-low">Low Priority</label>
									</div>
									<div class="4u 12u$(3)">
										<input type="radio" id="priority-normal" name="priority">
										<label for="priority-normal">Normal Priority</label>
									</div>
									<div class="4u$ 12u$(3)">
										<input type="radio" id="priority-high" name="priority">
										<label for="priority-high">High Priority</label>
									</div>
									<div class="6u 12u$(3)">
										<input type="checkbox" id="copy" name="copy">
										<label for="copy">Email me a copy of this message</label>
									</div>
									<div class="6u$ 12u$(3)">
										<input type="checkbox" id="human" name="human" checked>
										<label for="human">I am a human and not a robot</label>
									</div>
									<div class="12u$">
										<textarea name="message" id="message" placeholder="Enter your message" rows="6"></textarea>
									</div>
									<div class="12u$">
										<ul class="actions">
											<li><input type="submit" value="Send Message" class="special" /></li>
											<li><input type="reset" value="Reset" /></li>
										</ul>
									</div>
								</div>
							</form>
						</section>

					<!-- Image -->
						<section>
							<h3>Image</h3>
							<h4>Fit</h4>
							<div class="box alt">
								<div class="row 50% uniform">
									<div class="12u$"><span class="image fit"><img src="images/pic07.jpg" alt="" /></span></div>
									<div class="4u"><span class="image fit"><img src="images/pic02.jpg" alt="" /></span></div>
									<div class="4u"><span class="image fit"><img src="images/pic03.jpg" alt="" /></span></div>
									<div class="4u$"><span class="image fit"><img src="images/pic04.jpg" alt="" /></span></div>
									<div class="4u"><span class="image fit"><img src="images/pic04.jpg" alt="" /></span></div>
									<div class="4u"><span class="image fit"><img src="images/pic02.jpg" alt="" /></span></div>
									<div class="4u$"><span class="image fit"><img src="images/pic03.jpg" alt="" /></span></div>
									<div class="4u"><span class="image fit"><img src="images/pic03.jpg" alt="" /></span></div>
									<div class="4u"><span class="image fit"><img src="images/pic04.jpg" alt="" /></span></div>
									<div class="4u$"><span class="image fit"><img src="images/pic02.jpg" alt="" /></span></div>
								</div>
							</div>

							<h4>Left &amp; Right</h4>
							<p><span class="image left"><img src="images/pic08.jpg" alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent.</p>
							<p><span class="image right"><img src="images/pic08.jpg" alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent.</p>
						</section>

				</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<section class="links">
						<div class="row">
							<section class="3u 6u(medium) 12u$(small)">
								<h3>Lorem ipsum dolor</h3>
								<ul class="unstyled">
									<li><a href="#">Lorem ipsum dolor sit</a></li>
									<li><a href="#">Nesciunt itaque, alias possimus</a></li>
									<li><a href="#">Optio rerum beatae autem</a></li>
									<li><a href="#">Nostrum nemo dolorum facilis</a></li>
									<li><a href="#">Quo fugit dolor totam</a></li>
								</ul>
							</section>
							<section class="3u 6u$(medium) 12u$(small)">
								<h3>Culpa quia, nesciunt</h3>
								<ul class="unstyled">
									<li><a href="#">Lorem ipsum dolor sit</a></li>
									<li><a href="#">Reiciendis dicta laboriosam enim</a></li>
									<li><a href="#">Corporis, non aut rerum</a></li>
									<li><a href="#">Laboriosam nulla voluptas, harum</a></li>
									<li><a href="#">Facere eligendi, inventore dolor</a></li>
								</ul>
							</section>
							<section class="3u 6u(medium) 12u$(small)">
								<h3>Neque, dolore, facere</h3>
								<ul class="unstyled">
									<li><a href="#">Lorem ipsum dolor sit</a></li>
									<li><a href="#">Distinctio, inventore quidem nesciunt</a></li>
									<li><a href="#">Explicabo inventore itaque autem</a></li>
									<li><a href="#">Aperiam harum, sint quibusdam</a></li>
									<li><a href="#">Labore excepturi assumenda</a></li>
								</ul>
							</section>
							<section class="3u$ 6u$(medium) 12u$(small)">
								<h3>Illum, tempori, saepe</h3>
								<ul class="unstyled">
									<li><a href="#">Lorem ipsum dolor sit</a></li>
									<li><a href="#">Recusandae, culpa necessita nam</a></li>
									<li><a href="#">Cupiditate, debitis adipisci blandi</a></li>
									<li><a href="#">Tempore nam, enim quia</a></li>
									<li><a href="#">Explicabo molestiae dolor labore</a></li>
								</ul>
							</section>
						</div>
					</section>
					<div class="row">
						<div class="8u 12u$(medium)">
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved.</li>
								<li>Design: <a href="http://templated.co">TEMPLATED</a></li>
								<li>Images: <a href="http://unsplash.com">Unsplash</a></li>
							</ul>
						</div>
						<div class="4u$ 12u$(medium)">
							<ul class="icons">
								<li>
									<a class="icon rounded fa-facebook"><span class="label">Facebook</span></a>
								</li>
								<li>
									<a class="icon rounded fa-twitter"><span class="label">Twitter</span></a>
								</li>
								<li>
									<a class="icon rounded fa-google-plus"><span class="label">Google+</span></a>
								</li>
								<li>
									<a class="icon rounded fa-linkedin"><span class="label">LinkedIn</span></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>

	</body>
</html>