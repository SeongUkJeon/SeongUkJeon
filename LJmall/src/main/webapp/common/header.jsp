<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>LJmall</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/style.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
	
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script> 
function reviewList() {
	var product_code = ${view.product_code};
	$.getJSON("/LJmall/detail/reviewList" + "?n=" + product_code, function(data){
		var str = "";
		var str2 = "";
		
		$(data).each(function(){
			console.log(data);
			
			var revdate = new Date(this.revdate);
			revdate = revdate.toLocaleDateString("ko-US")
			var star1 = (this.rating > 0 ? "class='on'" : "");
			var star2 = (this.rating > 1 ? "class='on'" : "");
			var star3 = (this.rating > 2 ? "class='on'" : "");
			var star4 = (this.rating > 3 ? "class='on'" : "");
			var star5 = (this.rating > 4 ? "class='on'" : "");
			
			if(this.userid == this.loginuser) {
				str2 = "<div class='replyFooter'>"
					+ 		"<button type='button' class='modify' data-revnum='" + this.revnum + "'>수정</button>"
					+ 		"<button type='button' class='delete' data-revnum='" + this.revnum + "'>삭제</button>"
					+ 	"</div>";
			}
			
			str += "<li data-revnum='" + this.revnum + "'>"
				+ "<div class='userInfo'>"
					+ "<span class='userName'>" + this.userid + "</span>"
					+ "<span class='date'>" + revdate + "</span>"
				+ "</div>"
				+ str2
				+ "<div class='replyContent'>"
				+	"<a " + star1 + ">★</a>"
				+	"<a " + star2 + ">★</a>"
				+	"<a " + star3 + ">★</a>"
				+	"<a " + star4 + ">★</a>"
				+	"<a " + star5 + ">★</a>"
				+ 	"<div class='reviewContent'>" + this.revcon + "</div>"
				+ "</div>"
				+ "</li>";           
		});
		
		$("section.replyList ol").html(str);
	});
}
</script>
</head>
<body>
	<div id="top"></div>
	<c:set var="cpath" value="${pageContext.request.contextPath }"
		scope="session" />
	<header id="header">
		<div id="header_box" align="center">
			<div id="title" align="center">
				<h1 class="title">
					<c:if test="${admin != 'admin' }">
						<a href="${cpath }">LJMall</a>
					</c:if>
				</h1>
			</div>
			<div id="topmenu" align="center">
				<ul id="view">
					<li class="mainmenu"><b>MAN</b>
						<ul class="subgroup">
							<li class="submenu"><a class="text-dark"
								href="${cpath }/view?category=man&category2=top">TOP</a></li>
							<li class="submenu"><a class="text-dark"
								href="${cpath }/view?category=man&category2=bottom">BOTTOM</a>
							</li>
						</ul>
					</li>
				</ul>
				<ul id="view">
					<li><b>WOMAN</b>
						<ul>
							<li><a class="text-dark" href="${cpath }/view?category=woman&category2=top">TOP</a>
							</li>
							<li><a class="text-dark"
								href="${cpath }/view?category=woman&category2=bottom">BOTTOM</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<nav id="nav">
			<div id="nav_box">
				<c:if test="${empty loginuser }">
					<form action="terms" method="get" class="text-dark">
						<input type="hidden" name="memberJoin" value="1">
						<input type="submit" value="회원가입" class="memberJoin">
						|<a href="${cpath }/login" class="text-dark">로그인</a>
					</form>
				</c:if>
				<c:if test="${not empty loginuser }">
					<div class="dropmenu">
						<ul id="view">
							<li class="inline">
								<img
									src="${pageContext.request.contextPath }/images/mypage.png"
									style="height: 50px; width: auto;">
								<ul class="list-group">
									<li id="dropmenu" class="list-group-item list-group-item-secondary"><a href="${cpath }/myPage" class="text-dark">마이페이지</a></li>
									<li id="dropmenu" class="list-group-item list-group-item-secondary"><a href="${cpath }/orderList" class="text-dark">주문조회</a></li>
									<li id="dropmenu" class="list-group-item list-group-item-secondary"><a onclick="location.replace('/LJmall/logout')" class="text-dark" id="logout">로그아웃</a></li>
								</ul>
								<script>
									$(".dropmenu ul li").hover(function(){
										$(this).find("ul").stop().fadeToggle(300);
									});
								</script>
							</li>
						</ul>
					</div>
					<c:if test="${loginuser.withdrawal != 2 }">
						<ul id="view">
							<li id="basket"><a href="${cpath }/basketList"> <img
									src="${pageContext.request.contextPath }/images/basket.jpg"
									style="height: 50px; width: auto;">
							</a></li>
							<li id="basketcnt"><b>${basketcnt }</b></li>
						</ul>
					</c:if>
					<c:if test="${loginuser.withdrawal == 2 }">
						<ul>
							<li style="margin-top: 0"><a class="text-dark" id="Aaside" href="${cpath}/admin/main">관리자 메인</a></li>
							<li style="margin-top: 0"><a onclick="location.replace('/LJmall/logout')" class="text-dark" id="logout">로그아웃</a></li>
						</ul>
					</c:if>
				</c:if>
			</div>
		</nav>
	</header>
	
	<div id="moveBtn">
		<button class="upBtn" id="upBtn" type="button" onclick="tbMove('top')">▲</button>	
		<button class="downBtn" id="downBtn" type="button" onclick="tbMove('bottom')">▼</button>
		
		<script>
			function tbMove(seq){
	    	    var offset = $("#" + seq).offset();
	    		$('html, body').animate({scrollTop : offset.top}, 400);
	    	}
	    </script>		
	</div>