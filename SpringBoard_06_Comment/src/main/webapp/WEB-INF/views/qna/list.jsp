<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../00_header.jsp"></jsp:include>
<jsp:include page="../10_nav.jsp"></jsp:include>

<h2 class="float-left">QnA 리스트 <a href="/qna/write" class="btn btn-outline-primary"> QnA등록</a></h2>
<div class="float-right form-group">
<form class="form-inline" action="/product/list">
<select class="form-control" name="type">
	<option value="TCW">검색범위</option>
	<option value="T">제목</option>
	<option value="W">작성자</option>
	<option value="C">내용</option>
	<option value="TW">제목or작성자</option>
	<option value="TC">제목or내용</option>
	<option value="CW">작성자or내용</option>
</select>
  <input type="text" class="form-control" placeholder="Search" name="keyword">
  <input type="hidden" name="pageNum" value="1">
  <input type="hidden" name="amount" value="<c:out value='${qgvo.cri.amount }' />">
  <div class="input-group-append">
    <button class="btn btn-success" type="submit">검색</button>
  </div>
  </form>
</div>

<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>문의내용</th>
			<th>등록자</th>
			<th>조회수</th>
			<th>등록날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${list ne null && list.size() != 0 }">
				<c:forEach items="${list }" var="qvo">
				<tr>
					<td>${qvo.qno }</td>
					<td><a href="/qna/detail?qno=${qvo.qno }&pageNum=${qgvo.cri.pageNum }&amount=${qgvo.cri.amount }&type=${qgvo.cri.type }&keyword=${qgvo.cri.keyword }">${qvo.title }</a></td>
					<td>${qvo.writer }</td>
					<td>${qvo.readcount }</td>
					<td>${qvo.modd8 }</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr><td colspan="5"><h3>등록된 게시글이 없습니다.</h3></td></tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
 <ul class="pagination">
 <c:if test="${qgvo.prev }">
  <li class="page-item"><a class="page-link"
   href="/qna/list?pageNum=${qgvo.startPage-1 }&amount=${qgvo.cri.amount}&type=${qgvo.cri.type }&keyword=${qgvo.cri.keyword }">Prev</a></li>
  </c:if>
  <c:forEach var="i" begin="${qgvo.startPage }" end="${qgvo.endPage }">
  <li class="page-item ${qgvo.cri.pageNum == i ? 'active' : '' }"><a class="page-link"
   href="/qna/list?pageNum=${i }&amount=${qgvo.cri.amount}&type=${qgvo.cri.type }&keyword=${qgvo.cri.keyword }">${i }</a></li>
  </c:forEach>
 <c:if test="${qgvo.next }"> 
  <li class="page-item"><a class="page-link"
   href="/qna/list?pageNum=${qgvo.endPage+1 }&amount=${qgvo.cri.amount}&type=${qgvo.cri.type }&keyword=${qgvo.cri.keyword }">Next</a></li>
  </c:if>
</ul>
<script>
$(function(){
	let sform = $(".form-inline");
	$(".form-inline button").on("click",function(e){
		console.log("check1");
		e.preventDefault();
		console.log("check2 : "+ sform.find("input[name='keyword']").val());
		if(!sform.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;
		}
		sform.submit();
	});
});
</script>
<script>
	let result = '<c:out value="${result}" />';
	if (result == 'write_ok') {
		alert("문의사항 등록이 완료되었습니다.");
	}else if (result == 'remove_ok') {
		alert("등록하신 글이 삭제되었습니다.");
	} 
	result = "";
</script>
<jsp:include page="../90_footer.jsp"></jsp:include>
