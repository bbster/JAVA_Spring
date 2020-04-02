<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<jsp:include page="../00_header.jsp"></jsp:include>
<jsp:include page="../10_nav.jsp"></jsp:include>

<h2>상품 상세 정보</h2>
<form action="/qna/modify" method="post" enctype="multipart/form-data">
<input type="hidden" name="pageNum" value="${cri.pageNum }">
<input type="hidden" name="amount" value="${cri.amount }">
<input type="hidden" name="type" value="<c:out value='${cri.type }' />">
<input type="hidden" name="keyword" value="<c:out value='${cri.keyword }' />">
  <table class="table table-bordered">    
      <tr>
        <th>등록번호</th>
        <td><input type="text" name="qno" value="${qvo.qno }" readonly class="form-control"></td>        
      </tr>
      <tr>
        <th>문의내용</th>
        <td><input type="text" name="title" value="${qvo.title }" class="form-control"></td>        
      </tr>
      <tr>
        <th>등록자</th>
        <td>${qvo.writer }</td>        
      </tr>     
      <tr>
        <th>최종수정일</th>
        <td>${qvo.modd8 }</td>        
      </tr>
      <tr>
        <th>문의내용</th>
        <td><textarea rows="5" name="content" class="form-control">${qvo.content }</textarea></td>        
      </tr>
      <tr>
      	<td colspan="2">
      		<button type="submit" class="btn btn-primary">수정완료</button>
      	</td>
      </tr>
  </table>
</form>

<jsp:include page="../90_footer.jsp"></jsp:include>