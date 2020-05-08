<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/jobTotalNav.jsp"%>
<section>
	<div align="center" class="sectionform">
		<h3>YARD 장치 현황(日)</h3>
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
			<button type="submit" id="searchBtn" class="searchBtn" formaction="${cpath }/yardInstallStatus">검색</button>
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
					<th colspan="2">냉동</th>
					<th colspan="2">위험물</th>
					<th colspan="2">장척</th>
					<th colspan="2"></th>
				</tr>
				<tr>
					<th scope="col" style="width: 60px;">구분</th>
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
					<th scope="col">VAN</th>
					<th scope="col">TEU</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${flag != 'fail'}">
					<c:forEach var="item" items="${data}">   
						<c:if test="${item.ixcd == 'I' ||  item.ixcd == 'X' || item.ixcd == 'T' || item.ixcd == 'S' || item.ixcd == 'M' || item.ixcd == 'total'}">
							<tr>
						      <th scope="row">
						      	<c:choose>
							        <c:when test = "${item.ixcd == 'I'}">
							        	수입
							      	</c:when>
							      	<c:when test = "${item.ixcd == 'X'}">
							        	수출
							      	</c:when>
							      	<c:when test = "${item.ixcd == 'T'}">
							        	T/S
							      	</c:when>
							      	<c:when test = "${item.ixcd == 'S'}">
							        	선내이적
							      	</c:when>
							      	<c:when test = "${item.ixcd == 'M'}">
							        	온독
							      	</c:when>
							      	<c:when test = "${item.ixcd == 'total'}">
							        	<span style="color:red;">합계</span>
							      	</c:when>
						      	</c:choose>
						      </th>
						      <td>${item.f2}</td>
						      <td>${item.f4}</td>
						      <td>${item.f5}</td>
						      <td>${item.m2}</td>
						      <td>${item.m4}</td>
						      <td>${item.m5}</td>
						      <td>${item.rf2}</td>
						      <td>${item.rf4}</td>
						      <td>${item.im2}</td>
						      <td>${item.im4}</td>
						      <td>${item.ak2}</td>
						      <td>${item.ak4}</td>
						      <td>${item.van}</td>
						      <td>${item.teu}</td>
						    </tr>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${flag eq 'fail' }">
					<th colspan="15" scope="row" style="text-align: center;">날짜 형식이 잘 못 되었습니다.</th>
				</c:if>
				<c:if test="${data == null && flag != 'fail'}">
					<th colspan="15" scope="row" style="text-align: center;">조회 할 날짜와 선사를 입력하세요.</th>
				</c:if>
			</tbody>
		</table>

	</div>
</section>
</body>
</html>