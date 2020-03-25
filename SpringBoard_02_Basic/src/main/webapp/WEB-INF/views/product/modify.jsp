<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../00_header.jsp"></jsp:include>
<jsp:include page="../10_nav.jsp"></jsp:include>

<form action="/product/modify" method="post">
	<table class="table table-bordered">
		<tr>
			<th>등록 번호</th>
			<td><input type="text" name="pno" value="${pvo.pno }" readonly
				class="form-control"></td>
		</tr>
		<tr>
			<th>상품이름</th>
			<td><input type="text" name="title" value="${pvo.title }"
				class="form-control"></td>
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
			<td><textarea rows="5" name="content" class="form-control">${pvo.content}</textarea></td>
		</tr>
		<tr>
			<th>상품 이미지</th>
			<td><input type="text" name="imgfile" value="${pvo.imgfile }"
				class="form-control"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" class="btn btn-primary">수정완료</button>
				
			</td>

		</tr>
	</table>
</form>

<jsp:include page="../90_footer.jsp"></jsp:include>