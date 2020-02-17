<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
	<div id="container_box">
		<%@ include file="/WEB-INF/views/admin/include/aside.jsp"%>
		<section id="content">
			<div>
				<select name="answerType" id="answerType">
					<option>==선택==</option>
					<option value="전체">전체</option>
					<option value="답변대기">답변대기</option>
				</select>
				<input type="hidden" value="${category }" id="category">
				<script>
					$("#answerType").change( function() {
						var value = $("#answerType option:selected").val();
						var category = $("#category").val();
						
						location.href = "${cpath}/admin/inquiryList?category=" + category + "&type=" + value;
					});
				</script>
			</div>
			<ul>
				<c:if test="${not empty inquiryList }">
				<c:forEach items="${inquiryList}" var="inquiry">
					<li style="width:49%; display: inline-block; padding: 15px; float: left;">
						<div class="replyInfo">
							<p>
								<span>${inquiry.inquirynum }.</span>
							</p>
							<p> 
								<span>작성자</span>${inquiry.userid}
						    </p>
							<p> 
								<span>작성날짜</span>${inquiry.cdate }
						    </p>
						    <p>
						    	<span>작성된 상품</span> <a href="/LJmall/detail?n=${inquiry.product_code}">바로가기</a>
						    </p>
						    <p>
						    	<span>구분</span> ${inquiry.category }문의
						    </p>
						   	<a href="inquiry?product_code=${inquiry.product_code }&question=${inquiry.question}">
								<button type="button" id="inquiryListBtn">답변</button>
							</a>
							<form role="form" method="post" id="inquiryDelBtn" style="float: right;">
  								<input type="hidden" name="inquirynum" value="${inquiry.inquirynum}" />
					   			<button type="submit" class="delete_${inquiry.inquirynum }_btn">삭제</button>
					   		</form>
					   		<script>
						   		$(".delete_${inquiry.inquirynum }_btn").click(function(){
									var confirm_val = confirm("정말 삭제하시겠습니까?");
									  
									if(confirm_val) {
										run();
									}	
								});
						   		
						   		function run(){
									$("#inquiryDelBtn").submit();
								}
							</script>
					   	</div>
					   	<div class="replyContent">
					    	<textarea class="form-control" aria-label="With textarea" style="resize: none; height: 400px; width: 100%;" readonly="readonly">${inquiry.question }</textarea>
					    	<c:if test="${not empty inquiry.answer }">
								<div style="background-color: #d3d3d3">
									→ 답변: ${inquiry.answer }
								</div>
							</c:if>
					   	</div>
				  	</li>     
			  	</c:forEach>
			  	</c:if>
			 </ul>
		</section>
	</div>
</section>
<%@ include file="/common/footer.jsp"%>