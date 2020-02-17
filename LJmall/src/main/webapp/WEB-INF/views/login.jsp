<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<div id="privacy" align="center" style="background-color: white;">
	<div id="join">
		<fieldset style="width: 250px; text-align: left">
			<form method="post">
				<label style="width: 100%;"> I D <input name="userid"
					required value="${cookie['saveid'].value }" style="width: 100%;">
				</label> <br> <label style="width: 100%;"> P W <input
					type="password" name="userpw" required style="width: 100%;">
				</label> <br> <input id="loginCheckBox" type="checkbox"
					name="autologin" value="autologin">자동 로그인
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input id="loginCheckBox"
					type="checkbox" name="saveid" value="saveid"
					${cookie['saveid'].value != null ? "CHECKED" : ""}>ID 저장 <br>
				<button type="submit">로그인</button>
			</form>
		</fieldset>

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