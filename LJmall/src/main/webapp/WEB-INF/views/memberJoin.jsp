<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<div id="privacy" align="center" style="background-color: white">
	<div id="join">
		<form role="form" method="post" autocomplete="off"
			action="memberJoin2">
			<div class="input_area">
				<label for="userid">아이디</label> <input type="email" id="userid"
					name="userid" placeholder="example@email.com" required="required"/>
					<div class="check_font" id="id_check"></div>
					
					<script>
					// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
						$("#userid").blur(function() {
							var userid = $('#userid').val();
							$.ajax({
								url : '${cpath}/idCheck?userid='+ userid,
								type : 'get',
								success : function(data) {									
									if (data == 1) {
											// 1 : 아이디가 중복되는 문구
											$("#id_check").text("사용중인 아이디입니다.");
											$("#id_check").css("color", "red");
											$("#signup_btn").attr("disabled", true);
									} else {
										if(userid == ""){
											$('#id_check').text('아이디를 이메일 형식으로 입력해주세요.');
											$('#id_check').css('color', 'red');
											$("#signup_btn").attr("disabled", true);			
										} else {
											$('#id_check').text('');
											$("#signup_btn").attr("disabled", false);		
										}
									}
								}, error : function() {
									console.log("실패");
								}
							});
						});
					</script>
			</div>

			<div class="input_area">
				<label for="userpwb">비밀번호</label> <input type="password"
					id="userpwb" name="userpwb" required="required" />
			</div>

			<div class="input_area">
				<label for="userpw">비밀번호 확인</label> <input type="password"
					id="userpw" name="userpw" required="required" />
			</div>

			<div class="input_area">
				<label for="username">이름</label> <input type="text" id="username"
					name="username" placeholder="닉네임을 입력해주세요" required="required" />
			</div>

			<div class="input_area">
				<label for="phone">연락처</label> <input type="text" id="phone"
					name="phone" placeholder="연락처를 입력해주세요" required="required" />
					<button style="margin-left: 48px; margin-bottom: 8px;">휴대폰 인증(미구현)</button>
			</div>

			<div class="input_area">
				<label for="address">주소</label> <input type="text" id="address"
					name="address" placeholder="주소를 입력해주세요" required="required" />
			</div>

			<div class="input_area">
				<label for="birth">생년월일</label> <input type="text" id="birth"
					name="birth" placeholder="생년월일을 입력해주세요" required="required" />
			</div>

			<div class="input_area">
				<label for="gender">성별</label>
				<div style="margin-right: 53px; display: inline-block;">
					<input type="radio" id="gender" name="gender" value="male"
						required="required" />남 <input type="radio" id="gender"
						name="gender" value="female" required="required" />여
				</div>
			</div>


			<button type="submit" id="signup_btn" name="signup_btn">가입 신청</button>

		</form>
	</div>
</div>
<%@ include file="/common/footer.jsp"%>