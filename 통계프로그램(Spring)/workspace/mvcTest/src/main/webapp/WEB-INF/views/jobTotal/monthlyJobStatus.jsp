<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/jobTotalNav.jsp"%>
<section>
	<div align="center" class="sectionform">
		<h3>작업 현황(月)</h3>
		<br>
		<form method="post" id="searchOption">
			<div id="yymmdd" style="width: auto;">
				<div class="input-group mb-3" id="dateinput">
						<input type="text" class="form-control" name="txtYear" id="txtYear" value="${date[0] }">
						<div class="input-group-append">
							<span class="input-group-text">년</span>
						</div>
		
						<input type="text" class="form-control" name="txtMonth" id="txtMonth" value="${date[1] }">
						<div class="input-group-append">
							<span class="input-group-text">월</span>
						</div>
	
						<input type="hidden" class="form-control" name="txtDay" id="txtDay" value="01">
				</div>
			</div>

			<button type="submit" id="searchBtn" class="searchBtn" formaction="${cpath }/monthlyJobStatus">검색</button>
		</form>
	</div>
	<br>
	<div align="center">
		<table class="table table-hover" id="resultTbl3">
			<thead>
				<tr>
					<th scope="col" style="width: 70px;">구분</th>
					<th scope="col">작업 일자</th>
					<th scope="col">VAN</th>
					<th scope="col">TEU</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${data != null }">
					<c:forEach var="item" items="${data}">   
						<tr>
					      <th scope="row">${item.gubun }</th>
					      <td>${item.wkdate}</td>					      
					      <td>${item.van}</td>
					      <td>${item.teu}</td>
					    </tr>
					</c:forEach>
				</c:if>
				<c:if test="${flag eq 'fail' }">
					<th colspan="4" scope="row" style="text-align: center;">날짜 형식이 잘 못 되었습니다.</th>
				</c:if>
				<c:if test="${data == null && flag != 'fail'}">
					<th colspan="4" scope="row" style="text-align: center;">조회 할 년월을 입력하세요.</th>
				</c:if>
			</tbody>
		</table>
	</div>
</section>
</body>
</html>