<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");
%>
<%@include file="title.jsp"%>
<%
if(session_level == null || session_level == ""){%>
	<script>
		alert("로그인 후 이용가능한 페이지입니다.");
		location.href="/";
	</script>
<%}%>
<script>
	function ft_write(){
		if(!subject.value){
			alert("제목을 입력하세요");
			subject.focus();
			return false;
		}
		if(!comment.value){
			alert("내용을 입력하세요");
			comment.focus();
			return false;
		}
		document.submit();
	}
</script>

<div style="height:15px;"> </div>
<div class="ft_top"> <%=code_title%> </div>
<div class="ftline"> </div>
<form action="write_insert.jsp?code=<%=code%>" method="post" enctype="multipart/form-data" onsubmit="return ft_write()">
	<div class="ftw f1">
		<div class="ftwr rr rr1">옵션</div>
		<div class="ftwr l1">
			<input type="radio" id="gongji" name="gongji" value="1">공지글
			<input type="radio" id="gongji" name="gongji" value="2" checked>일반글
			<input type="radio" id="gongji" name="gongji" value="3">비밀글
		</div>
	</div>
	<div class="ftw f2">
		<div class="ftwr rr rr2">글쓴이</div>
		<div class="ftwr l2"><%=session_nickname%>(<%=session_id%>)</div>
	</div>
	<div class="ftw f3">
		<div class="ftwr rr rr3">제목</div>
		<div class="ftwr l3"><input id="subject" name="subject" value="" style="width:810px;" maxlength="100"></div>
	</div>
	<div class="ftw f4">
		<div class="ftwr rr rr4">내용</div>
		<div class="ftwr l4"><textarea id="comment" name="comment" style="width:810px;height:180px;resize:none;"></textarea></div>
	</div>
	<div class="ftw f5">
		<div class="ftwr rr rr5">첨부</div>
		<div class="ftwr l5"><input type="file" name="file"></div>
	</div>
	<div class="ftwb">
		<div class="ftwbb b2 fb_button"><button class="fb_button" style="font-size:15px">글쓰기</button></div>
		<div class="ftwbb" style="width:10px;"></div>
		<div class="ftwbb b3 fb_button">글목록</div>
	</div>
</form>
<div style="height:15px;"> </div>

<%@include file="/include/footer.jsp"%>