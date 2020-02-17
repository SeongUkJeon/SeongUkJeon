<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

<div id="container_box">
	<%@ include file="/WEB-INF/views/admin/include/aside.jsp"%>
	<section id="content">
		
				<ul class="orderList">
					<c:forEach items="${orderList}" var="orderList">
				<li style="width: 100%;">
					<div align="center">
						<div id="join" style="text-align: left; width: 40%;">
							<div>
								<p>
									<span>주문번호</span><a
										href="${cpath }/admin/orderView?n=${orderList.orderid}"
										class="text-dark"><b>${orderList.orderid}</b></a>
								</p>
								<p>
									<span>주문자</span><a
										href="${cpath }/admin/orderView?n=${orderList.userid}"
										class="text-dark"><b>${orderList.userid}</b></a>
								</p>
								<p>
									<span>수령인</span>${orderList.orderrec}</p>
								<p>
									<span>주소</span>(${orderList.useraddr1}) ${orderList.useraddr2}
									${orderList.useraddr3}
								</p>
								<p>
									<span>가격</span>
									<fmt:formatNumber pattern="###,###,###"
										value="${orderList.amount}" />
									￦
								</p>
								<p>
									<span>상태</span>${orderList.delivery}</p>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
				</ul>
			
	</section>
</div>
</section>
<script>
	var regExp = /[^0-9]/gi;

	$("#product_price").keyup(function() {
		numCheck($(this));
	});
	$("#product_quantity").keyup(function() {
		numCheck($(this));
	});

	function numCheck(selector) {
		var tempVal = selector.val();
		selector.val(tempVal.replace(regExp, ""));
	}
</script>
<%@ include file="/common/footer.jsp"%>