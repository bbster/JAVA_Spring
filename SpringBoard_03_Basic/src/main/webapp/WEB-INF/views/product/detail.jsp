<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../00_header.jsp"></jsp:include>
<jsp:include page="../10_nav.jsp"></jsp:include>

<h2>상품 상세 정보</h2>
<table class="table table-bordered">
	<tr>
		<th>등록 번호</th>
		<td>${pvo.pno }</td>
	</tr>
	<tr>
		<th>상품이름</th>
		<td>${pvo.title }</td>
	</tr>
	<tr>
		<th>등록자</th>
		<td>${pvo.writer }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${pvo.readcount }</td>
	</tr>
	<tr>
		<th>상품 등록일</th>
		<td>${pvo.regd8 }</td>
	</tr>
	<tr>
		<th>최종 수정일</th>
		<td>${pvo.modd8 }</td>
	</tr>
	<tr>
		<th>상세 설명</th>
		<td>${pvo.content }</td>
	</tr>
	<tr>
		<th>상품 이미지</th>
		<td>${pvo.imgfile }</td>
	</tr>
	<tr>
		<td colspan="2"><a href="/product/modify?pno=${pvo.pno }"
			class="btn btn-outline-warning">수정</a>
			<button type="button" class="btn btn-outline-danger" id="rmBtn">삭제</button>
		</td>

	</tr>
</table>

<form action="/product/remove" method="post" id="rmForm">
	<input type="hidden" name="pno" value="${pvo.pno}">
</form>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
	
<script>
	$(document).ready(function(){
		/* $("#rmBtn").click(function(){
			$("#rmForm").submit();
		}); */
		$(document).on("click", "#rmBtn",function(){
			$("#rmForm").submit();
		})
	});
	$(function(){
		
	});
</script>

<script>
	let result = '<c:out value="${result}" />';
	if (result === 'modify_okay') {
		alert("상품 수정이 완료 되었습니다.")
	}
	result = "";
</script>


<jsp:include page="../90_footer.jsp"></jsp:include>