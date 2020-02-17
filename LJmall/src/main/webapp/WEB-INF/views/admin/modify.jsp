<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
	<div id="container_box">
		<%@ include file="/WEB-INF/views/admin/include/aside.jsp"%>
		<section id="content">
			<h2>상품 수정</h2>
	
			<form method="post" enctype="multipart/form-data">
				<input type="hidden" name="product_code"
					value="${product.product_code}" />
				<div class="inputArea">
					<label for="product_name">상품 명</label> <input type="text"
						name="product_name" id="product_name" required="required"
						value="${product.product_name}">
				</div>
				<div class="inputArea">
					<label for="product_price">가격</label> <input type="text"
						name="product_price" id="product_price" required="required"
						value="${product.product_price }">
				</div>
				<div class="inputArea">
					<label for="product_quantity">상품 수량</label> <input type="text"
						name="product_quantity" id="product_quantity" required="required"
						value="${product.product_quantity }">
				</div>
				<div class="inputArea">
					<label for="product_desc">상품 소개</label>
					<textarea rows="7" cols="100" name="product_desc" id="product_desc"
						required="required" style="resize: none;">
						${product.product_desc }
					</textarea>
				</div>
				<div class="inputArea">
					<label for="product_detail1">성별</label> <select name="product_detail1"
						required="required">
						<option value="man"
							${product.product_detail1 == 'man' ? 'selected' : '' }>남성
						
						<option value="woman"
							${product.product_detail1 == 'woman' ? 'selected' : '' }>여성
	
	
						
					</select>
				</div>
				<div class="inputArea">
					<label for="product_detail1">구분</label> <select name="product_detail2"
						required="required">
						<option value="top"
							${product.product_detail2 == 'top' ? 'selected' : '' }>상의
						
						<option value="bottom"
							${product.product_detail2 == 'bottom' ? 'selected' : '' }>하의
	
	
						
					</select>
				</div>
				<div class="inputArea">
					<label for="product_image1">대표 이미지</label> <input type="file"
						id="product_image1" name="product_image1" required="required">
					<div class="select_img1">
						<img src="" />
					</div>
					<script>
						$("#product_image1").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img1 img").attr("src",
													data.target.result).width(500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
				</div>
				<div class="inputArea">
					<label for="product_image2">상세 이미지1</label> <input type="file"
						id="product_image2" name="product_image2">
					<div class="select_img2">
						<img src="" />
					</div>
					<script>
						$("#product_image2").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img2 img").attr("src",
													data.target.result).width(500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
				</div>
				<div class="inputArea">
					<label for="product_image3">상세 이미지2</label> <input type="file"
						id="product_image3" name="product_image3">
					<div class="select_img3">
						<img src="" />
					</div>
					<script>
						$("#product_image3").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img3 img").attr("src",
													data.target.result).width(500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
				</div>
				<div class="inputArea">
					<label for="product_image4">상세 이미지3</label> <input type="file"
						id="product_image4" name="product_image4">
					<div class="select_img4">
						<img src="" />
					</div>
					<script>
						$("#product_image4").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img4 img").attr("src",
													data.target.result).width(500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
				</div>
				<div class="inputArea">
					<label for="product_image5">상세 이미지4</label> <input type="file"
						id="product_image5" name="product_image5">
					<div class="select_img5">
						<img src="" />
					</div>
					<script>
						$("#product_image5").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img5 img").attr("src",
													data.target.result).width(500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
				</div>
				<div class="inputArea">
					<button type="submit" id="update_Btn" class="btn btn-light">완료</button>
					<button type="submit" id="back_Btn" class="btn btn-warning">취소</button>
	
					<script>
						$("#back_Btn").click(function() {
							history.back();
						});
					</script>
				</div>
			</form>
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