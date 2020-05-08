<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var msg = "";
	msg = '${msg}';
	var url = '${url}';
	if (!msg == "") {
		alert(msg);
	}
	if(!url == ""){
		url = '${pageContext.request.contextPath}${url}';
		document.location.href = url;	
	}
	
	
	
</script>
<style>
.invisible {
	clear: none;
	border: 0px none;
	float: none;
	background-color: #ffffff;
}
</style>
<body>

	<h1>회원 탈퇴</h1>
	<hr>

	<div>
		회원님 LJmall 서비스를 이용하시는데 불편함이 있으셨나요?<br> 1) 이용 불편 및 각종 문의 사항은 고객센터로
		문의 주시면 성심 성의껏 답변 드리겠습니다.<br> - 자주 묻는 질문 / 1:1 온라인 문의 / 전화 문의:
		9999-9999
	</div>
	<br>
	<form id="deleteForm" method="post">
		<fieldset style="width: 700px; margin-left: 50px;">
			<h3>1. 회원탈퇴 전, 유의사항을 확인해 주시기 바랍니다.</h3>
			<ul>
				<li>회원탈퇴 시 회원전용 웹 서비스이용이 불가합니다.</li>
				<li>거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한
					기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다.</li>
				<li>회원탈퇴 후 쿠팡 서비스에 입력하신 상품문의 및 후기, 댓글은 삭제되지 않으며, 회원정보 삭제로 인해
					작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능 합니다.</li>
				<li>상품문의 및 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기
					바랍니다.</li>
				<li>이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.</li>
			</ul>
			<hr>
			<input type="checkbox" name="check" id="check"
				style="margin-left: 20px;"> 상기 LJmall 회원탈퇴 시 처리사항 안내를 확인하였음에
			동의합니다
		</fieldset>
		<br>

		<div style="margin-left: 20px;">
			보안을 위해 회원님의 이름과 계정 이메일 및 비밀번호를 확인 합니다.<br>
			이름:<input name="username" value="${vo.username }" class="invisible"> 아이디:<input
				name="userid" value="${vo.userid }"  class="invisible"> 비밀번호:<input
				type="password" name="userpw" id="userpw"> <input
				type="button" onclick="agree()" value="삭제">
		</div>

	</form>

	<script type="text/javascript">
		function agree() {
			var chkbox = document.getElementById('check');
			var pwd = document.getElementById('userpw');
			var chk = false;
			if (chkbox.checked) {
				chk = true;
			} else {
				chk = false;
			}

			if (chk == false
					|| (pwd.value == null || pwd.value == undefined || pwd.value == "")) {
				if (chk == false) {
					chkbox.focus();
					alert("약관에 동의해 주세요.");
					return false;
				}

				if (pwd.value == null || pwd.value == undefined
						|| pwd.value == "") {
					alert('비밀번호가 입력되지 않음 !!');
					pwd.focus();
					return false;
				}
			} else {
				document.getElementById('deleteForm').submit();
			}

		}
	</script>

</body>
</html>