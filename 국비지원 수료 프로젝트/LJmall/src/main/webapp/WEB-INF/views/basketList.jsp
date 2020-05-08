<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
	<div id="container_box">
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
		<section id="content">
			<div id="basketList" align="center">
				<c:if test="${empty basketList }">
					<h3>장바구니가 비어있습니다.</h3>
				</c:if>
				<c:if test="${not empty basketList}">
					<ul>
						<c:if test="${flag eq 0 }">
							<li class="allCheck">
								<div class="allCheck">
									<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
									<script>
										$("#allCheck").click(function(){
											var chk = $("#allCheck").prop("checked");
											if(chk) {
												$(".chBox").prop("checked", true);
											} else {
												$(".chBox").prop("checked", false);
											}
										});
									</script> 
								</div>
								
								<div class="delBtn">
									<button type="button" class="selectDelete_btn">선택 삭제</button> 
									
									<script>
										$(".selectDelete_btn").click(function(){
											var confirm_val = confirm("정말 삭제하시겠습니까?");
											  
											if(confirm_val) {
												var checkArr = new Array();
												   
												$("input[class='chBox']:checked").each(function(){
													checkArr.push($(this).attr("data-basketnum"));
												});
											    
												$.ajax({
													url : "/LJmall/deleteBasket",
													type : "post",
													data : { chbox : checkArr },
													success : function(result) {
														if(result == 1) {          
															location.href = "/LJmall/basketList?flag=0";
														} else {
															alert("삭제 실패");
														}
													}
												});
											} 
										});
									</script>
								</div>
							</li>
						
							<c:set var="sum" value="0" />
						
							<c:forEach items="${basketList}" var="basketList">
								<%@ include file="/WEB-INF/views/include/basketList.jsp"%>
							</c:forEach>
						</c:if>
						<c:if test="${flag eq 1 }">
							<c:set var="sum" value="0" />
							<%@ include file="/WEB-INF/views/include/basketList.jsp"%>
						</c:if>
					</ul>
					<div class="listResult">
						<div class="sum">
							총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" /> ￦
						</div>
						<div class="orderOpne">
							<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
							
							<script>
								$(".orderOpne_bnt").click(function(){
									$(".orderInfo").slideDown();
									$(".orderOpne_bnt").slideUp();
								});      
							</script>
						</div>
					</div>
					
					<div class="orderInfo">
						<form method="post" role="form" autocomplete="off"">
							<input type="hidden" name="amount" value="${sum}" />
							
							<div class="inputArea">
								<label for="">수령인</label>
								<input type="text" name="orderrec" id="orderrec" required="required" />
							</div>
							  
							<div class="inputArea">
								<label for="orderphone">수령인 연락처</label>
							 	<input type="text" name="orderphone" id="orderphone" required="required" />
							</div>
							
							<div class="inputArea">
								<input type="text" name="useraddr1" id="useraddr1" placeholder="우편번호" required="required"/>
								<button type="button" onclick="searchAddr()">우편번호 찾기</button>
							</div>
							  
							<div class="inputArea" id="addr">
								<input type="text" name="useraddr2" id="useraddr2" placeholder="도로명주소" required="required"/>
							</div>
							  
							<div class="inputArea" id="addr">
								<input type="text" name="useraddr3" id="useraddr3" placeholder="상세주소" required="required"/>
							</div>

							<div class="inputArea" id="addr">
								<input type="text" name="jibunAddress" id="jibunAddress" placeholder="지번주소"/>
							</div>
											
							<span id="guide" style="color: #999; display: none"></span>
						
							<script
								src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
								//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
								function searchAddr() {
									new daum.Postcode({
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
											// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var roadAddr = data.roadAddress; // 도로명 주소 변수
											var extraRoadAddr = ''; // 참고 항목 변수
				
											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if (data.bname !== ''
													&& /[동|로|가]$/g.test(data.bname)) {
												extraRoadAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if (data.buildingName !== ''
													&& data.apartment === 'Y') {
												extraRoadAddr += (extraRoadAddr !== '' ? ', '
														+ data.buildingName : data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if (extraRoadAddr !== '') {
												extraRoadAddr = ' (' + extraRoadAddr + ')';
											}
				
											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document.getElementById('useraddr1').value = data.zonecode;
											document.getElementById("useraddr2").value = roadAddr;
											document.getElementById("jibunAddress").value = data.jibunAddress;
				
											// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
											if (roadAddr !== '') {
												document.getElementById("extraAddress").value = extraRoadAddr;
											} else {
												document.getElementById("extraAddress").value = '';
											}
				
											var guideTextBox = document.getElementById("guide");
											// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
											if (data.autoRoadAddress) {
												var expRoadAddr = data.autoRoadAddress
														+ extraRoadAddr;
												guideTextBox.innerHTML = '(예상 도로명 주소 : '
														+ expRoadAddr + ')';
												guideTextBox.style.display = 'block';
				
											} else if (data.autoJibunAddress) {
												var expJibunAddr = data.autoJibunAddress;
												guideTextBox.innerHTML = '(예상 지번 주소 : '
														+ expJibunAddr + ')';
												guideTextBox.style.display = 'block';
											} else {
												guideTextBox.innerHTML = '';
												guideTextBox.style.display = 'none';
											}
										}
									}).open();
								}
							</script>
							
							<div class="inputArea">
								<label for="" style="width: 500px;">결제 수단 선택 및 결제 정보 입력(결제 API, 미구현)</label><br>
								<button type="button">카드</button>
								<button type="button">계좌이체</button>
								<button type="button">무통장입금</button>
							</div>
							
							<div class="inputArea" align="right">
								<c:if test="${flag eq 0 }">
									<input type="hidden" name="flag" value="0">
									<button type="submit" class="order_btn">전체 상품 주문</button>
									<button type="button" class="select_order_btn">선택 상품 주문(미구현)</button>
								</c:if>
								<c:if test="${flag eq 1 }">
									<input type="hidden" name="flag" value="1">
									<input type="hidden" name="basketstock" value="${basketList.basketstock}">
									<input type="hidden" name="product_code" value="${basketList.product_code }">
									<button type="submit" class="order_btn" formaction="basketList">주문</button>
								</c:if>
								<button type="button" class="cancel_btn">취소</button>
								<script>
									$(".cancel_btn").click(function(){
										$(".orderInfo").slideUp();
										$(".orderOpne_bnt").slideDown();
									});      
								</script>
							</div>
						</form>
					</div>
				</c:if>
			</div>
		</section>
	</div>
</section>
<%@ include file="/common/footer.jsp"%>