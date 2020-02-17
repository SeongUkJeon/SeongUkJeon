<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
	<div id="container_box">
		<%@ include file="/WEB-INF/views/admin/include/aside.jsp"%>
		<section id="content">
			<h2>상품 등록</h2>
	
			<form method="post" enctype="multipart/form-data" role="form">
				<input type="hidden" name="n" value="${product.product_code}" />
	
				<div class="inputArea">
					<label for="product_name">상품 명</label> <span>${product.product_name}</span>
				</div>
	
				<div class="inputArea">
					<label for="product_price">상품 가격</label> <span><fmt:formatNumber
							value="${product.product_price}" pattern="###,###,###" /></span>
				</div>
	
				<div class="inputArea">
					<label for="product_quantity">상품 수량</label> <span>${product.product_quantity}</span>
				</div>
	
				<div class="inputArea">
					<label for="product_desc">상품 소개</label> <span>${product.product_desc}</span>
				</div>
	
				<div class="inputArea">
					<label>구분1</label> <span class="category">${product.product_detail1}</span>
				</div>
	
				<div class="inputArea">
					<label>구분2</label> <span class="category2">${product.product_detail2}</span>
				</div>
	
				<div class="inputArea">
					<label for="product_image1">대표 이미지</label> <span><img
						height="150px"
						src="${cpath }/images/${product.product_detail1 }/${product.product_detail2 }/${product.product_image1 }"></span>
				</div>
	
				<div class="inputArea">
					<c:if
						test="${not empty product.product_image5 || not empty product.product_image4
				|| not empty product.product_image3 || not empty product.product_image2}">
						<label for="product_detailimage">상세 이미지</label>
					</c:if>
					<c:if test="${not empty product.product_image2}">
						<span><img height="150px"
							src="${cpath }/images/${product.product_detail1 }/${product.product_detail2 }/${product.product_image2 }"></span>
					</c:if>
					<c:if test="${not empty product.product_image3}">
						<span><img height="150px"
							src="${cpath }/images/${product.product_detail1 }/${product.product_detail2 }/${product.product_image3 }"></span>
					</c:if>
					<c:if test="${not empty product.product_image4}">
						<span><img height="150px"
							src="${cpath }/images/${product.product_detail1 }/${product.product_detail2 }/${product.product_image4 }"></span>
					</c:if>
					<c:if test="${not empty product.product_image5}">
						<span><img height="150px"
							src="${cpath }/images/${product.product_detail1 }/${product.product_detail2 }/${product.product_image5 }"></span>
					</c:if>
				</div>
	
				<div class="inputArea">
					<button type="button" id="modify_Btn" class="btn btn-light">수정</button>
					<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
	
					<script>
						var formObj = $("form[role='form']");
	
						$("#modify_Btn").click(function() {
							formObj.attr("action", "modify");
							formObj.attr("method", "get")
							formObj.submit();
						});
	
						$("#delete_Btn").click(function() {
							var con = confirm("정말로 삭제하시겠습니까?");
	
							if (con) {
								formObj.attr("action", "delete");
								formObj.submit();
							}
						});
					</script>
				</div>
			</form>
		</section>
	</div>
</section>
<%@ include file="/common/footer.jsp"%>