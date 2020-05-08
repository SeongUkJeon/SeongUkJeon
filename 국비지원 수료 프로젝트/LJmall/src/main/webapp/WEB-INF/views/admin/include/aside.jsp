<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="container">
	<aside>
		<ul>
			<li><a class="text-dark" id="Aaside" href="${cpath}/admin/main"><b>메인</b></a></li>
			<li><a class="text-dark" id="Aaside" href="${cpath}/admin/memberList"><b>회원 목록</b></a></li>
			<li><a class="text-dark" id="Aaside" href="${cpath}/admin/upload"><b>상품 등록</b></a></li>
			<li><a class="text-dark" id="Aaside" href="${cpath}/admin/productList"><b>상품 목록</b></a></li>
			<li><a class="text-dark" id="Aaside" href="${cpath}/admin/orderList"><b>주문 목록</b></a></li>
			<div class="dropmenu" style="float: left; margin-left: 41%;">
				<ul id="view">
					<li class="inline" style="width: 75px; margin-top: 10px;">
						<b>문의 목록</b>
						<ul class="list-group">
							<li id="dropmenu" class="list-group-item list-group-item-secondary"><a href="${cpath}/admin/inquiryList?category=전체&type=전체" class="text-dark">전체 문의 목록</a></li>
							<li id="dropmenu" class="list-group-item list-group-item-secondary"><a href="${cpath}/admin/inquiryList?category=반품&type=전체" class="text-dark">반품 문의 목록</a></li>
							<li id="dropmenu" class="list-group-item list-group-item-secondary"><a href="${cpath}/admin/inquiryList?category=교환&type=전체" class="text-dark">교환 문의 목록</a></li>
							<li id="dropmenu" class="list-group-item list-group-item-secondary"><a href="${cpath}/admin/inquiryList?category=상품&type=전체" class="text-dark">상품 문의 목록</a></li>
							<li id="dropmenu" class="list-group-item list-group-item-secondary"><a href="${cpath}/admin/inquiryList?category=환불&type=전체" class="text-dark">환불 문의 목록</a></li>
						</ul>
						<script>
							$(".dropmenu ul li").hover(function(){
								$(this).find("ul").stop().fadeToggle(300);
							});
						</script>
					</li>
				</ul>
			</div>
		</ul>
	</aside>