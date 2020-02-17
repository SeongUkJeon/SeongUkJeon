<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

<div id="container_box">
	<%@ include file="/WEB-INF/views/admin/include/aside.jsp"%>
	<section id="content">
		<div align="center">
			<div id="join" style="text-align: left; width: 37%;">
				<h2>문의 답변 작성</h2>
				<form method="post">
					<c:if test="${not empty inquiry }">
						<label for="product_name" style="width: 21%;">상품 번호</label>${inquiry.product_code}<br>

						<label for="product_name" style="width: 21%;">문의 일자</label>${inquiry.cdate } <br>

						<label for="product_name" style="width: 21%;">구분</label>${inquiry.category } <br>

						<label for="product_name" style="width: 21%;">문의</label>${inquiry.userid } <br>


						<div>
							<span> 문의 내용 </span>
							<textarea id="question" readonly style="resize: none; width: 100%; height: 500px;">${inquiry.question }</textarea>
						</div>

						<div>
							<span> 답변 </span>
							<textarea name="answer" style="resize: none; width: 100%; height: 500px;"></textarea>
						</div>

						<div>
							<input type="hidden" name="product_code"
								value="${inquiry.product_code }">
							<button type="submit">작성</button>
						</div>

					</c:if>

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