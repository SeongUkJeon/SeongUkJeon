<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
	<div id="container_box">
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
		<section id="content">

				<c:if test="${empty orderList }">
					<h3>주문 내역이 없습니다.</h3>
				</c:if>
				<c:if test="${not empty orderList}">
					<ul class="orderList">
						<c:forEach items="${orderList}" var="orderList">
							<li style="width: 90%">
								<div id="orderList">
									<div id="listInner">
										<p>
											<span>주문번호</span><a class="text-dark" href="/LJmall/orderView?n=${orderList.orderid }"><b>${orderList.orderid}</b></a>
										</p>
										<p>
											<span>수령인</span>${orderList.orderrec}</p>
										<p>
											<span>주소</span>(${orderList.useraddr1}) ${orderList.useraddr2}
											${orderList.useraddr3}
										</p>
										<p>
											<span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount }"/> ￦
										</p>
										<p><span>상태</span>${orderList.delivery}</p>
										<c:if test="${orderList.delivery == '배송중'}">
											<p>
												<span>송장번호</span>${orderList.invoicenum}
												<button href="">배송조회(API 미구현)</button>
											</p>
										</c:if>
										<c:if test="${orderList.delivery == '배송준비'}">
											<p>									
												<div class="delete">
													<button type="button" class="delete_${orderList.orderid}_btn"
														data-orderid="${orderList.orderid}">주문취소</button>
										
													<script>
														$(".delete_${orderList.orderid}_btn").click(function() {
															var confirm_val = confirm("정말 취소하시겠습니까?");
										
															if (confirm_val) {
																var orderid = $(this).attr("data-orderid");
										
																$.ajax({
																	url : "/LJmall/deleteOrder",
																	type : "post",
																	data : {
																		orderid : orderid
																	},
																	success : function(result) {
																		if (result == 1) {
																			location.href = "/LJmall/orderList";
																		} else {
																			alert("삭제 실패");
																		}
																	}
																});
															}
														});
													</script>
												</div>
											</p>
										</c:if>
										<c:if test="${orderList.delivery == '배송완료'}">
											<p>
												<button href="">반품신청(미구현)</button>
												<button href="">교환신청(미구현)</button>
											</p>
										</c:if>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</c:if>	
		</section>
	</div>
</section>
<%@ include file="/common/footer.jsp"%>