<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
	<div id="container_box">
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
		<section id="content">
			<c:if test="${not empty list}">
				<ul>
					<c:forEach var="vo" items="${list }" varStatus="st">
						<li class="inline">
							<div class="goodsName">
								<c:if test="${vo.product_quantity > 0 }">
									<a href="detail?n=${vo.product_code }" style="color: #000;">
										<img src="${cpath }/images/${vo.product_detail1 }/${vo.product_detail2 }/${vo.product_image1 }">
										<br>
										<b>${vo.product_name }</b><br>
										<fmt:formatNumber pattern="###,###,###" value="${vo.product_price }" /> ￦
										<br>
									</a>
								</c:if>
								<c:if test="${vo.product_quantity <= 0 }">
									<img src="${cpath }/images/${vo.product_detail1 }/${vo.product_detail2 }/${vo.product_image1 }" style="width: 100%">
									<br>
									<b>${vo.product_name }</b><br>
									<span style="color: red">매진</span>
									<br>
								</c:if>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</section>
	</div>
</section>
<%@ include file="/common/footer.jsp"%>