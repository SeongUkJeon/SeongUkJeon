<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<div id="container_box">
	<%@ include file="/WEB-INF/views/admin/include/aside.jsp"%>
	<section id="content">
		<div id="adminLeft" style="width: 40%; float: left; height: 500px;">
			<b style="font-size: 30px;">주문관리</b>
			<hr>
			<ul>
				<li style="width: 100%;">
					<div class="menuRight">
						<a href="${cpath}/admin/orderList?type=배송준비" class="text-dark"> <span class="boxtitle">배송준비</span>
							<span class="boxsub">${readyShipCnt }</span> 건
						</a>
					</div>
				</li>
				<li style="width: 100%;">
					<div class="menuRight">
						<a href="${cpath}/admin/orderList?type=배송중" class="text-dark"> <span class="boxtitle">배송중</span>
							<span class="boxsub">${shippingCnt }</span> 건
						</a>
					</div>
				</li>

				<li style="width: 100%;">
					<div class="menuRight">
						<a href="${cpath}/admin/orderList?type=배송완료" class="text-dark"> <span class="boxtitle">배송완료</span>
							<span class="boxsub">${deliComplCnt }</span> 건
						</a>
					</div>
				</li>

				<li style="width: 100%;">
					<div class="menuRight">
						<a href="#" class="text-dark"> <span class="boxtitle">결제완료(미구현)</span>
							<span class="boxsub">0</span> 건
						</a>
					</div>
				</li>

				<li style="width: 100%;">
					<div class="menuRight">
						<a href="#" class="text-dark"> <span class="boxtitle">교환/환불
								접수(미구현)</span> <span class="boxsub">0</span> 건
						</a>
					</div>
				</li>
			</ul>
		</div>

		<div id="adminRight"
			style="width: 40%; float: right; height: 500px; margin-right: 58px;">
			<b style="font-size: 30px;">미답변 문의</b>
			<hr>
			<ul>
				<li style="width: 100%;">
					<div class="menuRight">
						<a href="${cpath}/admin/inquiryList?category=상품&type=답변대기"
							class="text-dark"> <span>상품 문의</span> <span class="boxsub">${productCnt }</span>
							건
						</a>
					</div>
				</li>

				<li style="width: 100%;">
					<div class="menuRight">
						<a href="${cpath}/admin/inquiryList?category=교환&type=답변대기"
							class="text-dark"> <span>교환 문의</span> <span class="boxsub">${exchangeCnt }</span>
							건
						</a>
					</div>
				</li>

				<li style="width: 100%;">
					<div class="menuRight">
						<a href="${cpath}/admin/inquiryList?category=환불&type=답변대기"
							class="text-dark"> <span>환불 문의</span> <span class="boxsub">${refundCnt }</span>
							건
						</a>
					</div>
				</li>

				<li style="width: 100%;">
					<div class="menuRight">
						<a href="${cpath}/admin/inquiryList?category=반품&type=답변대기"
							class="text-dark"> <span>반품 문의</span> <span class="boxsub">${returnCnt }</span>
							건
						</a>
					</div>
				</li>
			</ul>
		</div>
	</section>
</div>
</section>
<%@ include file="/common/footer.jsp"%>