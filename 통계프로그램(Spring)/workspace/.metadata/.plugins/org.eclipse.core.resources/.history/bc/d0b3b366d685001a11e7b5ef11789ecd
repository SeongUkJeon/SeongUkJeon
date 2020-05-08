<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<div id="container_box">
	<%@ include file="/WEB-INF/views/admin/include/aside.jsp"%>
	<section id="content">
		<h2>회원 목록</h2>

		<table class="table table-hover" style="width:96%;">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">아이디</th>
					<th scope="col">이름</th>
					<th scope="col">생년월일</th>
					<th scope="col">성별</th>
					<th scope="col">주소</th>
					<th scope="col">연락처</th>
					<th scope="col">탈퇴여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${memberList }" varStatus="st">
					<tr>
						<th scope="row">${st.count }</th>
						<td>${member.userid }</td>
						<td>${member.username }</td>
						<td>${member.birth }</td>
						<td>${member.gender == 'male' ? '남' : '여'}</td>
						<td>${member.address }</td>
						<td>${member.phone }</td>
						<td>${member.withdrawal == 1 ? '○' : ''}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="/WEB-INF/views/admin/include/paging.jsp"%>
	</section>
</div>
</section>
<%@ include file="/common/footer.jsp"%>



