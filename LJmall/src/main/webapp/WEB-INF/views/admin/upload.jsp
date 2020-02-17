<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

	<div id="container_box">
		<%@ include file="/WEB-INF/views/admin/include/aside.jsp"%>
		<section id="content">
			<div align="center">
			<div id="join" style="text-align: left; width:37%;">
			<h2>상품 등록</h2>
	
			<form method="post" enctype="multipart/form-data">
				<div class="inputArea">
					<label for="product_name" style="width: 21%;">상품 명</label> <input type="text"
						name="product_name" id="product_name" required="required" style="width: 78%;">
				</div>
				<div class="inputArea">
					<label for="product_price" style="width: 21%;">가격</label> <input type="text"
						name="product_price" id="product_price" required="required" style="width: 78%;">
				</div>
				<div class="inputArea">
					<label for="product_quantity" style="width: 21%;">상품 수량</label> <input type="text"
						name="product_quantity" id="product_quantity" required="required" style="width: 78%;">
				</div>
				<div class="inputArea">
					<label for="product_desc" style="width: 21%;">상품 소개</label>
					<textarea rows="7" cols="100" name="product_desc" id="product_desc" style="width: 100%;"></textarea>
				</div>
				<div class="inputArea">
					<label for="product_detail1" style="width: 21%;">구분1</label> 
					<select name="product_detail1"
						required="required">
						<option value="man">남성
						<option value="woman">여성
					</select>
				</div>
				<div class="inputArea">
					<label for="product_detail2" style="width: 21%;">구분2</label>
					<select name="product_detail2"
						required="required" >
						<option value="top">상의
						<option value="bottom">하의
					</select>
				</div>
				<div class="inputArea">
					<label for="product_image1" style="width: 21%;">대표 이미지</label> <input type="file"
						id="product_image1" name="product_image1" required="required" style="width: 78%;">
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
					<label for="product_image2" style="width: 21%;">상세 이미지1</label> <input type="file"
						id="product_image2" name="product_image2" style="width: 78%;">
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
					<label for="product_image3" style="width: 21%;">상세 이미지2</label> <input type="file"
						id="product_image3" name="product_image3" style="width: 78%;">
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
					<label for="product_image4" style="width: 21%;">상세 이미지3</label> <input type="file"
						id="product_image4" name="product_image4" style="width: 78%;">
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
					<label for="product_image5" style="width: 21%;">상세 이미지4</label> <input type="file"
						id="product_image5" name="product_image5" style="width: 78%;">
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
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
			</div>
			</div>
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

