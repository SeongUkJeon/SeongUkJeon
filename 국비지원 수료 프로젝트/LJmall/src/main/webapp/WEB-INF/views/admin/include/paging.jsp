<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 검색창 -->
<div style="float: left">
	<form method="post"
		action="${pageContext.request.contextPath}/admin/${list }">

		<select name="type">
			<c:if test="${list == 'memberList' }">
				<option value="userid">아이디</option>
				<option value="username">이름</option>
			</c:if>
			<c:if test="${list == 'productList' }">
				<option value="product_code">상품 이름</option>
			</c:if>
		</select> <input name="search">
		<button type="submit" >검색</button>
	</form>
</div>
<div style="float: left; margin-left: 200px;">

	<c:if test="${paging.curPage > 1 }">
		<a href="${cpath }/admin/${list }?nowPage=${paging.curPage - 1 }&type=${type}&search=${search}">pre</a>
	</c:if>

	<c:forEach var="i" begin="1" end="${paging.pageCount}">
		<a href="${cpath }/admin/${list }?nowPage=${i }&type=${type}&search=${search}" 
			style="color: ${i == paging.curPage ? 'chocolate' : 'burlywood'};
			font-size: ${i == paging.curPage ? '20pt' : '16pt' };">
			[${i }]
		</a>
	</c:forEach>

	<c:if test="${paging.curPage < paging.pageCount }">
		<a
			href="${cpath }/admin/${list }?nowPage=${paging.curPage + 1 }&type=${type}&search=${search}">next</a>
	</c:if>
</div>