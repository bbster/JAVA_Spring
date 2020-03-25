<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../00_header.jsp"></jsp:include>
<jsp:include page="../10_nav.jsp"></jsp:include>

<h2>상품 목록</h2>
<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>등록 번호</th>
			<th>상품명</th>
			<th>등록자</th>
			<th>조회수</th>
			<th>등록날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${list ne null }">
				<c:forEach items="${list }" var="pvo">
					<tr>
						<td>${pvo.pno }</a></td>
						<td><a href="/product/detail?pno=${pvo.pno }">${pvo.title }</a></td>
						<td>${pvo.writer }</td>
						<td>${pvo.readcount }</td>
						<td>${pvo.modd8 }</td>
					</tr>
				</c:forEach>
			</c:when>

			<c:otherwise>
				<tr>
					<td><h3>현재 등록된 상품이 없습니다.</h3></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<p class="align-right">
	<a href="/product/write" class="btn btn-outline-primary">상품등록 </a>
</p>

<script>
	let result = '<c:out value="${result}" />';
	if (result === 'write_okay') {
		alert("상품 등록이 완료 되었습니다.")
	} else if (result === 'remove_okay') {
		alert("상품 삭제가 완료 되었습니다.")
	}
	result = "";
</script>


<jsp:include page="../90_footer.jsp"></jsp:include>