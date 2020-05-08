<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<div id="privacy" align="center" style="background-color: white">
	<div id="join">

		<form method="POST"
			action="${pageContext.request.contextPath }/myPage">

			<div class="input_area">
				<label for="userid">아이디</label> <input id="userid" name="userid"
					readonly value="${vo.userid }" />
			</div>

			<div class="input_area">
				<label for="userpw">비밀번호</label> <input type="password" id="userpw"
					name="userpw" required="required" />
			</div>

			<div class="input_area">
				<label for="userpwb">비밀번호 확인</label> <input type="password"
					id="userpw" name="userpwb" required="required" />
			</div>

			<div class="input_area">
				<label for="userpwb">이름</label> <input id="username" name="username"
					value="${vo.username }" readonly="readonly" />
			</div>

			<div class="input_area">
				<label for="phone">연락처</label> <input id="phone" name="phone"
					value="${vo.phone }" required />
			</div>

			<div class="input_area">
				<label for="address">주소</label> <input id="address" name="address"
					value="${vo.address }" required />
			</div>

			<button type="button"
				onclick="location.href='${pageContext.request.contextPath }/myPage/delete'"
				style="float: right; margin-top: 10px; margin-bottom: 10px;">회원탈퇴</button>
			<div style="margin-top: 70px;">
				<button type="submit" id="signup_btn" name="signup_btn">정보수정완료</button>
				<button type="button" onclick="location.href='${cpath }/myPage'">취소</button>
			</div>
		</form>


		<script type="text/javascript">
			var msg = "";
			msg = '${msg}';
			if (!msg == "") {
				alert(msg);
			}
		</script>
	</div>
</div>
<%@ include file="/common/footer.jsp"%>

