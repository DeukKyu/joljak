<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.ssafy.vo.Food"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹거리 프로젝트</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style><%@include file="basiclayout.css"%></style>
</head>
<body>
	<div class="container">
		<header>
			<!-- nav : 네비게이션 시작을 알려주는 태그 (div로 해도되긴하지만 알려주기위해 사용)
			 navbar navbar-default: 배경 색상과 테투리를 지정해 주는 역할
			 navbar-fixed-top: 화면 상단에 고정 -->
			<nav class="navbar navbar-default navbar-fixed-top navbar-inverse"
				role="navigation">
				<div class="container">
					<div class="navbar-header">
						<!-- 화면 사이즈가 크면 안보임, 모바일 정도로 작아지면 보임 -->
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-ex1-collapse">
							<span class="sr-only">toggle navigation</span>
							<!-- screen reader only  없어도 되는 코드임. 화면상 아무 일 없다-->
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="main.mvc"><img
							src="https://edu.ssafy.com/asset/images/logo.png" height="50px"
							width="70px"></a>
					</div>
					<!-- class="navbar-header" -->

					<!-- navbar-collapse: 화면 사이즈가 작으면 안보임 -->
					<div
						class="collapse navbar-collapse navbar-left navbar-ex1-collapse">
						<ul class="nav navbar-nav" id="menu">
							<li><a href="#">공지 사항</a></li>
							<li><a href="list.mvc">상품 정보</a></li>
							<li><a href="#">베스트 섭취 정보</a></li>
							<li><a href="intakeInfo.mvc">내 섭취 정보</a></li>
							<li><a href="#">예상 섭취 정보</a></li>
						</ul>
					</div>
					<div
						class="collapse navbar-collapse navbar-right navbar-ex1-collapse">
						<ul class="nav navbar-nav" id="menuMember">
							<% if(session.getAttribute("id") != null) {
							String id = (String) session.getAttribute("id");
							%>
							<li><a href="logout.mvc">Logout</a></li>
							<li><a href="memberInfo.mvc">회원정보</a></li>
							<%}else{ %>
							<li><a href="login.mvc">Login</a></li>
							<li><a href="join.mvc">Join</a></li>
							<%} %>
						</ul>
					</div>
				</div>
			</nav>
		</header>
	</div>
	<!-- 본문 -->
	<div class="container">
		<!-- 배너 -->
		<div id="carousel-example-generic" class="carousel slide">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<!-- <li data-target="#carousel-example-generic" data-slide-to="1"></li>
              <li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
			</ol>
			<!-- Carousel items -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="img/banner_img.png" alt="First slide">
				</div>
				<!-- 
                <div class="item">
                   <img src="./slide2.jpg" alt="Second slide">               
                </div>
                <div class="item">
                   <img src="./slide3.jpg" alt="Third slide">                 
                </div>
                 -->
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				data-slide="prev"> <span class="icon-prev"></span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				data-slide="next"> <span class="icon-next"></span>
			</a>
		</div>

		<hr>
		<div class="container list">
			<table>
				<%
					ArrayList<Food> li = (ArrayList<Food>) request.getAttribute("list");
					ArrayList<Integer> li2 = (ArrayList<Integer>) request.getAttribute("list2");
					for (int i = 0; i < li.size(); i++) {
				%>
				<tr>
					<td><img src="img/<%=li.get(i).getName()%>.jpg" width="150px" height="150px"></td>
					<td><a href="showDetail.mvc?code=<%=li.get(i).getCode()%>"><%=li.get(i).getName()%></a>
						<p><%=li.get(i).getMaterials()%></p>
						<span>섭취 갯수 : <%= li2.get(i) %></span>
						<a href="intakeDelete.mvc?code=<%=li.get(i).getCode()%>">삭제</a>
					</td>
				</tr> 

				<%
					}
				%>
			</table>
		</div>
		<!-- end of container -->


	</div>
	<div class="container-fluid">
		<footer>
			<nav class="navbar navbar-default navbar-fixed-bottom navbar-inverse"
				role="navigation">
				<div class="container">
					<div
						class="collapse navbar-collapse navbar-left navbar-ex1-collapse">
						<h4>findUs</h4>
						<hr>
						<ul class="footerLink">
							<li><a href="#">(SSAFY) 서울시 강남구 테헤란로 멀티스퀘어</a></li>
							<li><a href="#">1544-9001</a></li>
							<li><a href="#">admin@ssafy.com</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</footer>
	</div>




</body>
</html>