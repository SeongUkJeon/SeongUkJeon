<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
	<div id="container_box">
		<%@ include file="/WEB-INF/views/admin/include/aside.jsp"%>
		<section id="content">
			<h2>상품 목록</h2>
	
			<table class="table table-hover" style="width:96%;">
				<thead>
					<tr>
						<th scope="col" style="width:4%">번호</th>
						<th scope="col" style="width:4%">상품 번호</th>
						<th scope="col" style="width:10%">상품 명</th>
						<th scope="col" style="width:5%">구분1</th>
						<th scope="col" style="width:5%">구분2</th>
						<th scope="col" style="width:6%">가격</th>
						<th scope="col" style="width:4%">수량</th>
						<th scope="col" style="width:500px;">상품 설명</th>
						<th scope="col">대표 이미지</th>
						<th scope="col">등록 날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${productList }" varStatus="st">
						<tr>
							<th>${st.count }</th>
							<td>${vo.product_code}</td>
							<td><a href="${cpath}/admin/view?n=${vo.product_code }">${vo.product_name }</a></td>
							<td>${vo.product_detail1 == 'man' ? '남' : '여'}</td>
							<td>${vo.product_detail2 }</td>
							<td><fmt:formatNumber pattern="###,###,###"
									value="${vo.product_price }" />원</td>
							<td>${vo.product_quantity }</td>
							<td style="width:500px;">${vo.product_desc }</td>
							<td><a href="${cpath}/admin/view?n=${vo.product_code }">
									<img height="150px"
									src="${cpath }/images/${vo.product_detail1 }/${vo.product_detail2 }/${vo.product_image1 }">
							</a></td>
							<td><fmt:formatDate pattern="yyyy년 MM월 dd일 hh시 mm분"
									value="${vo.product_date }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<%@ include file="/WEB-INF/views/admin/include/paging.jsp"%>
		</section>
	</div>
</section>
<%@ include file="/common/footer.jsp"%>