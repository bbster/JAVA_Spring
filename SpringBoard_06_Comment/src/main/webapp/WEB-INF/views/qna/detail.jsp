<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../00_header.jsp"></jsp:include>
<jsp:include page="../10_nav.jsp"></jsp:include>

<h2>문의 상세 내용</h2>
<table class="table table-bordered">
	<tr>
		<th>등록번호</th>
		<td>${qvo.qno }</td>
	</tr>
	<tr>
		<th>문의내용</th>
		<td>${qvo.title }</td>
	</tr>
	<tr>
		<th>등록자</th>
		<td>${qvo.writer }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${qvo.readcount }</td>
	</tr>
	<tr>
		<th>문의등록일</th>
		<td>${qvo.regd8 }</td>
	</tr>
	<tr>
		<th>최종수정일</th>
		<td>${qvo.modd8 }</td>
	</tr>
	<tr>
		<th>상세설명</th>
		<td>${qvo.content }</td>
	</tr>
	<tr>
		<td colspan="2">
		<a href="/qna/list?pageNum=${cri.pageNum }&amount=${cri.amount }&type=${cri.type }&keyword=${cri.keyword }"
		 class="btn btn-outline-secondary">목록</a>
		<a href="/qna/modify?qno=${qvo.qno }&pageNum=${cri.pageNum }&amount=${cri.amount }&type=${cri.type }&keyword=${cri.keyword }"
			class="btn btn-outline-warning">수정</a>
			<button type="button" class="btn btn-outline-danger" id="rmBtn">삭제</button>
		</td>
	</tr>
</table>

<h2>댓글</h2>
<form>
  <div class="input-group mb-3 input-group-lg">
    <div class="input-group-prepend">
      <span class="input-group-text" id="cmtWriter">${qvo.writer }</span>
    </div>
    <input type="text" class="form-control" id="cmtText" placeholder="댓글을 입력해주세요.">
    
    <div class="input-group-append">
    <button class="btn btn-success" type="button" id="cmtSubmit">댓글달기</button>
  	</div>
  </div>
</form>

<ul class="list-group list-group-flush" id="cmtListULTag"></ul>
<ul class="pagination pagination-sm justify-content-center" id="cmtListPaging">
</ul>

<form action="/qna/remove" method="post" id="rmForm">
	<input type="hidden" name="qno" value="${qvo.qno }">
	<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }' />">
	<input type="hidden" name="amount" value="<c:out value='${cri.amount }' />">
	<input type="hidden" name="type" value="<c:out value='${cri.type }' />">
	<input type="hidden" name="keyword" value="<c:out value='${cri.keyword }' />">
</form>

<script src="/resources/js/comment.js">

</script>
<script>
	$(function() {
		$(document).on("click", "#rmBtn", function() {
			$("#rmForm").submit();
		});
		
		var qno = '<c:out value="${qvo.qno}" />';
		var writer = '<c:out value="${qvo.writer}" />';
		listComment(qno, 1);
		$(document).on("click", "#cmtSubmit", 
				{qno: qno, writer: writer}, addComment);
		$(document).on("click", "#cmtListPaging li a", function(e){
			e.preventDefault();
			let clickedPage = $(this).attr("href");
			listComment(qno, clickedPage);
		});
	});
		var thisCno = "";
		$(document).on("click", "#modCmtBtn", function(e){
			e.prevenDefault();
			let thisBtn = $(this).clone();
			let thisLI = $(this).closest("li"); // 소속된 라인
			thisCno = thisLI.data("cno");
			let thisCmtTextLoc = thisLI.find(".cmtText"); // 댓글 텍스트 위치
			let thisCmtContent = thisCmtTextLoc.text("");  // 댓글 텍스트
			
			thisCmtTextLoc.text("");
			
			let inTag = '<div class="input-group input-group-sm" id="modInput">';
			inTag += '<input type="text" class="form-control" ';
			inTag += 'id="cmtModText" value="'+thisCmtContent+'"> ';
			inTag += '<div class="input-group-append">';
		    inTag += '<button class="btn btn-success" ';
		    inTag += 'type="button" id="cmtModSubmit">전송</button></div></div>';
		    
			thisCmtTextLoc.html(inTag).trigger("create");
			$("#modCmtBtn").remove();
			});
		$(document).on("click", "#cmtModSubmit", function(e){
			e.preventDefault();
			modVal = $("#cmtModSubmit").val();
			modifyComment(modVal, thisCno);
		});
	
	
	let result = '<c:out value="${result}" />';
	if (result == 'modify_ok') {
		alert("문의사항 수정이 완료되었습니다~!");
	}
	result = "";
</script>
<jsp:include page="../90_footer.jsp"></jsp:include>
