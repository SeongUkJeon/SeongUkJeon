<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>

<body>
	<%@ include file="/common/header.jsp"%>

	<div id="container_box">
		<%@ include file="/WEB-INF/views/myPage/aside.jsp"%>
		<section id="content">
			<h1>내가 문의한 내역</h1>
			<hr>
			<c:if test="${empty inquiryList }">
				<h3>문의 내역이 없습니다.</h3>
			</c:if>

			<c:if test="${not empty inquiryList }">
				<c:forEach items="${inquiryList }" var="inquiry">
					<div style="margin: 3% 3% 3% 3%">
						<div>
							<span> ${inquiry.category }에 관한 질문<br> <textarea
									id="question" rows="7" cols="50" readonly style="resize: none;">${inquiry.question }</textarea>
							</span>
						</div>

						<div>
							<span> 관리자의 답변<br> <textarea id="question" rows="7"
									cols="50" readonly style="resize: none;">
					
					<c:if test="${empty inquiry.answer }">
						답변 준비 중입니다
					</c:if>
					<c:if test="${not empty inquiry.answer }">
						${inquiry.answer }
					</c:if>
					
					</textarea>

							</span>
						</div>



					</div>
				</c:forEach>

				<div>
					<a href="javascript:history.go(-1)"><button>확인</button></a>
				</div>
			</c:if>
		</section>
	</div>
</body>
</html>