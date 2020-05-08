<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<li style="width: 100%">
	<c:if test="${flag eq 0 }">
		<div class="checkBox">
			<input type="checkbox" name="chBox" class="chBox"
				data-basketnum="${basketList.basketnum}" />
	
			<script>
				$(".chBox").click(function() {
					$("#allCheck").prop("checked", false);
				});
			</script>
		</div>
	</c:if>
	
	<div class="thumb">
		<img
			src="${cpath }/images/${basketList.product_detail1 }/${basketList.product_detail2 }/${basketList.product_image1 }" />
	</div>
	<div class="gdsInfo">
		<p>
			<span>상품명 : </span>${basketList.product_name}<br> <span>개당
				가격 : </span>
			<fmt:formatNumber pattern="###,###,###"
				value="${basketList.product_price}" />
			￦<br> <span>구입 수량 : </span>${basketList.basketstock} 개<br>
			<span>최종 가격 : </span>
			<fmt:formatNumber pattern="###,###,###"
				value="${basketList.product_price * basketList.basketstock}" />
			￦
		</p>

		<div class="delete">
			<button type="button" class="delete_${basketList.basketnum}_btn"
				data-basketnum="${basketList.basketnum}">삭제</button>

			<script>
				$(".delete_${basketList.basketnum}_btn").click(function() {
					var confirm_val = confirm("정말 삭제하시겠습니까?");

					if (confirm_val) {
						var checkArr = new Array();

						checkArr.push($(this).attr(
								"data-basketnum"));

						$.ajax({
							url : "/LJmall/deleteBasket",
							type : "post",
							data : {
								chbox : checkArr
							},
							success : function(result) {
								if (result == 1) {
									location.href = "/LJmall/basketList?flag=0";
								} else {
									alert("삭제 실패");
								}
							}
						});
					}
				});
			</script>
		</div>
	</div>
</li>

<c:set var="sum"
	value="${sum + (basketList.product_price * basketList.basketstock)}" />