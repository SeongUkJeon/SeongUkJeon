<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<div id="privacy" align="center" style="background-color: white;">
	<div id="join">
		<fieldset style="width: 100%; text-align: left;">
			<form method="post">
				<div align="center">
				<table style="width: 70%;">
					<tbody>
						<tr>
							<th scope="row"><label style="width: 100%;">ID</label></th>
							<td style="display: block;"> ${loginuser.userid }</td>
						<tr>
						<tr>
							<th scope="row">PW</th>
							<td><input type="password" required name="userpw" style="width:100%;"></td>
						</tr>
					</tbody>
				</table>
				</div>
				<div align="center" style="margin-top: 20px;">
					<button type="submit">확인</button>
					<button type="button"
						onclick="location.replace('${pageContext.request.contextPath}/myPage')">취소</button>
				</div>
			</form>
		</fieldset>

		<script type="text/javascript">
			var msg = "";
			msg = '${msg}';
			if (!msg == "" || !msg == undefined || !msg == null) {
				alert(msg);
			}
		</script>
	</div>
</div>
<%@ include file="/common/footer.jsp"%>