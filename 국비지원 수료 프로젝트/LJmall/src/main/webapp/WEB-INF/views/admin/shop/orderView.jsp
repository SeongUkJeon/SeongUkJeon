<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
	<div id="container_box">
		<%@ include file="/WEB-INF/views/admin/include/aside.jsp"%>
		<section id="content">
			<div class="orderInfoAdmin" style="width:96%;">
				<c:forEach items="${orderView }" var="orderView" varStatus="status">
	
					<c:if test="${status.first}">
						<p>
							<span>주문자</span>${orderView.userid}</p>
						<p>
							<span>수령인</span>${orderView.orderrec}</p>
						<p>
							<span>주소</span>(${orderView.useraddr1}) ${orderView.useraddr2}
							${orderView.useraddr3}
						</p>
						<p>
							<span>가격</span>
							<fmt:formatNumber pattern="###,###,###"
								value="${orderView.amount}" /> ￦
						</p>
						<p><span>상태</span>${orderView.delivery}</p>
						<c:if test="${id != 'userid' }">
							<div class="deliveryChange">
								<form role="form" method="post" class="deliveryForm">
									<input type="hidden" name="orderid" value="${orderView.orderid}" />
									<input type="hidden" name="delivery" class="delivery" value="" />
									
									<button type="button" class="delivery1_btn">배송중</button>
									<button type="button" class="delivery2_btn">배송완료</button>
									<div class="setInvoiceNum">
										<div class="inputArea">
												<label for="invoicenum">송장번호</label>
											 	<input name="invoicenum" id="invoicenum"/>
										</div>
										<div class="inputArea" align="right">
											<button type="button" class="delivery3_btn">입력</button>
											<button type="button" class="cancel_btn">취소</button>
										</div>
									</div>
									
									<script>
										$(".cancel_btn").click(function(){
											$(".setInvoiceNum").slideUp();
											$("[name=invoicenum]").attr("required" , false);
										});
									
										$(".delivery1_btn").click(function(){
											$(".setInvoiceNum").slideDown();
											$("[name=invoicenum]").attr("required" , true);
										});     
									
										$(".delivery3_btn").click(function(){
											$(".delivery").val("배송중");
											run();
										});
										
										$(".delivery2_btn").click(function(){
											$("#invoicenum").val("0");
											$(".delivery").val("배송완료");
											run();
										});
										
										function run(){
											$(".deliveryForm").submit();
										}
									</script>
								</form>
							</div>
						</c:if>
					</c:if>
				</c:forEach>
			</div>
	
			<ul class="orderView">
				<c:forEach items="${orderView}" var="orderView">
					<li style="width: 96%">
						<div class="thumb" style="margin-left: 20%;">
							<img src="${cpath }/images/${orderView.product_detail1 }/${orderView.product_detail2 }/${orderView.product_image1 }"/>
						</div>
						<div class="gdsInfo" style="width: 45%;">
							<p>
								<span>상품명</span>${orderView.product_name}<br /> <span>개당 가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderView.product_price}" />
								원<br /> <span>구입 수량</span>${orderView.basketstock} 개<br /> <span>최종
									가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderView.product_price * orderView.basketstock}" />
								원
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</section>
	</div>
</section>
<%@ include file="/common/footer.jsp"%>