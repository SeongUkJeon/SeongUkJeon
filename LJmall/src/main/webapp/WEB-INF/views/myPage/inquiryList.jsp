<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.inq{
		margin: 3% 3% 3% 3%;
		width: 750px;
		height: 250px;
		border: 1px solid black;
		align-content: center;
		line-height:200px
	}

	.in{
		float: left;
		width: 20%;
		margin: 3% 3% 0 3%;
	}


</style>



<body>
	<%@ include file="/common/header.jsp"%>

	<div id="container_box">
		<%@ include file="/WEB-INF/views/myPage/aside.jsp"%>
		<section id="content">
			<h1>내가 문의한 내역</h1>
			<hr>
			<c:if test="${empty productList }">
				<h3>문의 내역이 없습니다.</h3>
			</c:if>
		
			<c:if test="${not empty productList }">
				<c:forEach items="${productList }" var="product">
					<div class="inq">
						<div class="in">
							<a href="${cpath }/detail?n=${product.product_code}">
							<img src="${cpath }/images/${product.product_detail1 }/${product.product_detail2 }/${product.product_image1 }"
										style="width: 200px; height: 200px;"></a>
						</div>
						<div style="float: left; width: 40%; line-height:200px; text-align: center;">
							<span style="font-size: 25px;">${product.product_name }</span> 
							
						</div>
						<div style="float: right; width: 25%; height: 125px; text-align: center; line-height: 200px;">
							<span style="font-size: 30px;">문의 갯수</span> 
						</div>
						<div style="float: right; width: 25%; height: 125px; text-align: center; line-height: 80px;">
							<c:set var="code" value="${product.product_code }" />
							<a href="${cpath }/myPage/inquiry?n=${code}">
							<span style="font-size: 45px;">${num[code] }개</span></a>
							 
						</div>
						
					</div>
				</c:forEach>			
			
			</c:if>
		</section>
	</div>
</body>
</html>