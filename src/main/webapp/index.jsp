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
		<title>DevHub</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/skel.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/skel-layers.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-xlarge.css" />
		</noscript>
	</head>
	<body class="landing">

		<!-- Header -->
			<header id="header">
				<h1><a href="index.jsp">DevHub</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="generic.jsp">DH_introduce</a></li>
						<li><a href="elements.jsp">DH_Community </a></li>
						<li><a href="login.jsp" class="button special">Login</a></li> <!-- 로그인 링크 추가 -->
						<li><a href="signup.jsp" class="button special">Sign Up</a></li>
					</ul>
				</nav>
			</header>

		<!-- Banner -->
			<section id="banner">
				<h2>Hi. This is DevHub.</h2>
				<p>DevHub에 오신 것을 환영합니다. 코딩과 개발에 대한 지식을 나누고, 함께 성장하는 공간입니다.</p>
				<ul class="actions">
					<li>
						<a href="#" class="button big">코딩, 여기에 다 있다</a>
					</li>
				</ul>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style1 special">
				<div class="container">
					<header class="major">
						<h2>개발자들의 지식과 경험을 나누는 공간</h2>
						<p>지식 공유와 협업을 위한 커뮤니티</p>
					</header>
					<div class="row 150%">
						<div class="4u 12u$(medium)">
							<section class="box">
								<i class="icon big rounded color1 fa-cloud"></i>
								<h3>스터디룸</h3>
								<p>팁 / 칼럼 / 리뷰</p>
							</section>
						</div>
						<div class="4u 12u$(medium)">
							<section class="box">
								<i class="icon big rounded color9 fa-desktop"></i>
								<h3>Q&A</h3>
								<p>기술 / 커리어 / 기타</p>
							</section>
						</div>
						<div class="4u$ 12u$(medium)">
							<section class="box">
								<i class="icon big rounded color6 fa-rocket"></i>
								<h3>Jobs</h3>
								<p>좋은회사 / 나쁜회사</p>
							</section>
						</div>
					</div>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2 special">
				<div class="container">
					<header class="major">
						<h2>화제의 개발자</h2>
					</header>
					<section class="profiles">
						<div class="row">
							<section class="3u 6u(medium) 12u$(xsmall) profile">
								<img src="images/Bill Gates.png" alt="" class="profile-img" style="width: 100%; max-width: 200px; height: auto;" />
								<br>
									<br>
										<br>
											<br>
												<br>
													<br>
								<h4>Bill Gates</h4>
								<p>마이크로소프트(Microsoft) 공동 창립자</p>
							</section>
							<section class="3u 6u$(medium) 12u$(xsmall) profile">
								<img src="images/Jeff Bezos.png" alt="" class="profile-img" style="width: 100%; max-width: 200px; height: auto;"/>
								<br>
									<br>
										<br>
											<br>
												<br>
													<br>
								<h4>Jeff Bezos</h4>
								<p>아마존(Amazon) 창립자</p>
							</section>
							<section class="3u 6u(medium) 12u$(xsmall) profile">
								<img src="images/Mark Zuckerberg.png" alt="" class="profile-img" style="width: 100%; max-width: 200px; height: auto;" />
								<br>
									<br>
										<br>
											<br>
												<br>
													<br>
								<h4>Mark Zuckerberg</h4>
								<p>페이스북(Facebook) 공동 창립자</p>
							</section>
							<section class="3u 6u(medium) 12u$(xsmall) profile">
								<img src="images/Liu Wei.png" alt="" class="profile-img" style="width: 100%; max-width: 200px; height: auto;" />
								<br>
									<br>
										<br>
											<br>
												<br>
													<br>
								<h4>Liu Wei</h4>
								<p>'원신' 개발자</p>
							</section>
						</div>
					</section>
					<footer>
						<p>다양한 개발자들이 모여 서로의 지식과 경험을 나누는 공간입니다. <br>
						   초보자부터 전문가까지 다양한 레벨의 회원들이 함께 문제를 해결하고, 최신 기술 동향을 공유하며, <br>
						   서로 배우고 성장할 수 있는 환경을 제공합니다. <br>
						   질문과 답변, 코드 리뷰, 프로젝트 협업 등 다양한 기능을 통해 더 나은 개발자가 되어 보세요!</p>
						<ul class="actions">
							<li>
								<a href="#" class="button big">DevHub community</a>
							</li>
						</ul>
					</footer>
				</div>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper style3 special">
				<div class="container">
					<header class="major">
						<h2>커뮤니티 개선을 위한 의견</h2>
						<p>우리 커뮤니티에 대한 피드백을 남겨주세요!</p>
					</header>
				</div>
				<div class="container 50%">
					<form action="#" method="post">
						<div class="row uniform">
							<div class="6u 12u$(small)">
								<input name="name" id="name" value="" placeholder="Name" type="text">
							</div>
							<div class="6u$ 12u$(small)">
								<input name="email" id="email" value="" placeholder="Email" type="email">
							</div>
							<div class="12u$">
								<textarea name="message" id="message" placeholder="Message" rows="6"></textarea>
							</div>
							<div class="12u$">
								<ul class="actions">
									<li><input value="Send Message" class="special big" type="submit"></li>
								</ul>
							</div>
						</div>
					</form>
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