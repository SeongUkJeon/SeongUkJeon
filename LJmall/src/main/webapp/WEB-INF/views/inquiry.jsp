<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/style.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

</head>
<!-- productController에서 제어 -->
<script type="text/javascript">
	function getParentText() {
		document.getElementById("product_code").value = opener.document
				.getElementById("product_code").value;
		document.getElementById("product_name").value = opener.document
				.getElementById("product_name").value;
		document.getElementById("userid").value = opener.document
				.getElementById("userid").value;
	}
	function reLoad() {
		opener.document.location.reload();
		self.close();
	}
</script>
</head>
<body onload="getParentText()">
	<div id="privacy">
		<div id="agreeInner">
			<h3>상품 문의</h3>
			<form method="post">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>상품명</th>
							<th scope="col"><input type="text" id="product_name"
								readonly style="border: none; text-align: center; width: 100%;"> <input
								type="hidden" id="product_code" name="product_code"> <input
								type="hidden" id="userid" name="userid"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">구분</th>
							<th><select name="category">
									<option value="상품">상품문의</option>
									<option value="교환">교환문의</option>
									<option value="반품">반품문의</option>
									<option value="환불">환불문의</option>
							</select></th>
						</tr>

						<tr>
							<th scope="row">문의내용</th>
							<td>
								<div class="input-group">
									<textarea name="question" class="form-control" aria-label="With textarea" style="resize: none; height: 117px;"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button style="width: 100px;" type="submit" onclick="reLoad()">문의</button>
								<button style="width: 100px;" type="button" onclick="window.close()">취소</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>