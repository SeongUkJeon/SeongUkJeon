<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<div id="container_box">
	<%@ include file="/WEB-INF/views/include/aside.jsp"%>
	<section id="content">
		<div class="orderInfoAdmin" style="width: 96%;">
			<c:forEach items="${orderView}" var="orderView" varStatus="status">
				<c:if test="${status.first}">

					<p>
						<span>수령인</span>${orderView.orderrec}</p>
					<p>
						<span>주소</span>(${orderView.useraddr1}) ${orderView.useraddr2}
						${orderView.useraddr3}
					</p>
					<p>
						<span>총 가격</span>
						<fmt:formatNumber pattern="###,###,###"
							value="${orderView.amount}" />
						원
					</p>
				</c:if>
			</c:forEach>
		</div>

		<ul class="orderView">
			<c:forEach items="${orderView}" var="orderView">
				<li style="width: 96%">
					<div class="thumb" style="margin-left: 20%;">
						<img
							src="${cpath }/images/${orderView.product_detail1 }/${orderView.product_detail2 }/${orderView.product_image1 }" />
					</div>
					<div class="gdsInfo" style="margin-right: 20%;">
						<p>
							<span>상품명</span>${orderView.product_name}<br /> <span>개당
								가격</span>
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