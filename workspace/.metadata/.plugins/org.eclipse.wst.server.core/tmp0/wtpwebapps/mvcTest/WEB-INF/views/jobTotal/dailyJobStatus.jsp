<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/jobTotalNav.jsp"%>
<section>
	<div align="center" class="sectionform">
		<h3>작업 현황(日)</h3>
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
	
						<input type="text" class="form-control" name="txtDay" id="txtDay" value="${date[2] }">
						<div class="input-group-append">
							<span class="input-group-text">일</span>
						</div>
				</div>
			</div>
			<div id="operCd">
				<div class="input-group mb-3" id="opercdinput">
					<div class="input-group-append">
						<span class="input-group-text">선사</span>
					</div>
					<select name="operCd" id="slctOperCd" class="form-control">
						<option id="operCd" value="all">*</option>
						<c:forEach var="item" items="${list}">
							<option id="operCd" value="${item.opercd }">${item.opercd }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<button type="submit" id="searchBtn" class="searchBtn" formaction="${cpath }/dailyJobStatus">검색</button>
		</form>
	</div>
	<br>
	<div align="center">
		<table class="table table-hover" id="resultTbl">
			<thead>
				<tr>
					<th></th>
					<th colspan="3">FULL</th>
					<th colspan="3">EMPTY</th>
					<th colspan="3">NG</th>
					<th colspan="2">냉동</th>
					<th colspan="2">위험물</th>
					<th colspan="2">SP</th>
					<th colspan="2">보세</th>
					<th colspan="2"></th>
				</tr>
				<tr>
					<th scope="col" style="width: 70px;">순서</th>
					<th scope="col">20'</th>
					<th scope="col">40'</th>
					<th scope="col">45'</th>
					<th scope="col">20'</th>
					<th scope="col">40'</th>
					<th scope="col">45'</th>
					<th scope="col">20'</th>
					<th scope="col">40'</th>
					<th scope="col">45'</th>
					<th scope="col">20'</th>
					<th scope="col">40'</th>
					<th scope="col">20'</th>
					<th scope="col">40'</th>
					<th scope="col">20'</th>
					<th scope="col">40'</th>
					<th scope="col">20'</th>
					<th scope="col">40'</th>
					<th scope="col">VAN</th>
					<th scope="col">TEU</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${data != null }">
					<c:forEach var="item" items="${data}">   
						<tr>
					      <th scope="row">
						      <c:choose>
						         <c:when test = "${item.num == 1}">
						         	양하
						         </c:when>
						         <c:when test = "${item.num == 2}">
						         	적하
						         </c:when>
						         <c:when test = "${item.num == 3}">
						         	반입
						         </c:when>
						         <c:when test = "${item.num == 4}">
						         	반출
						         </c:when>
						         <c:when test = "${item.num == 5}">
						         	반송
						         </c:when>
						         <c:when test = "${item.num == 6}">
						         	구내<br>이적
						         </c:when>
						         <c:when test = "${item.num == 7}">
						         	T/S<br>(수입)
						         </c:when>
						         <c:when test = "${item.num == 8}">
						         	T/S<br>(수출)
						         </c:when>
						         <c:when test = "${item.num == 9}">
						         	SHIFT1
						         </c:when>
						         <c:when test = "${item.num == 10}">
						         	SHIFT2
						         </c:when>
						      </c:choose>
      					  </th>
					      <td>${item.f20}</td>
					      <td>${item.f40}</td>
					      <td>${item.f45}</td>
					      <td>${item.m20}</td>
					      <td>${item.m40}</td>
					      <td>${item.m45}</td>
					      <td>${item.ng20}</td>
					      <td>${item.ng40}</td>
					      <td>${item.ng45}</td>
					      <td>${item.rf20}</td>
					      <td>${item.rf40}</td>
					      <td>${item.dg20}</td>
					      <td>${item.dg40}</td>
					      <td>${item.sp20}</td>
					      <td>${item.sp40}</td>
					      <td>${item.bo20}</td>
					      <td>${item.bo40}</td>
					      <td>${item.van}</td>
					      <td>${item.teu}</td>
					    </tr>
					</c:forEach>
				</c:if>
				<c:if test="${flag eq 'fail' }">
					<th colspan="20" scope="row" style="text-align: center;">날짜 형식이 잘 못 되었습니다.</th>
				</c:if>
				<c:if test="${data == null && flag != 'fail'}">
					<th colspan="20" scope="row" style="text-align: center;">조회 할 날짜와 선사를 입력하세요.</th>
				</c:if>
			</tbody>
		</table>

	</div>
</section>
</body>
</html>