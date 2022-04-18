<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<div class="mypagebody">
	<div class="mypage" style="width:385px"> </div>
	<div class="mypage mleft">
		<div class="mpline li1"> </div>
		<a href="join_up.jsp">
			<div class="mpmenu l1">&nbsp;&nbsp;&nbsp;<img src="/img/man-user.png" class="mimg 1">&nbsp;&nbsp;&nbsp;회원정보수정</div>
		</a>
		<div class="mpmenu l2">&nbsp;&nbsp;&nbsp;<img src="/img/writing.png" class="mimg 2">&nbsp;&nbsp;&nbsp;내가 쓴 글</div>
		<div class="mpmenu l3">&nbsp;&nbsp;&nbsp;<img src="/img/like.png" class="mimg 3">&nbsp;&nbsp;&nbsp;내가 쓴 댓글</div>
		<div class="l4">&nbsp;&nbsp;&nbsp;- 회원탈퇴</div>
	</div>
	<div class="mypage mright">
		<div class="mpline li2"> </div>
		<div class="r1" align=center><img src="/img/man-user.png" width=70 height=70></div>
		<div class="r2"><%=session_level%><br><%=session_name%>(<%=session_id%>)님, 환영합니다.</div>
		<div class="r3">내가 쓴 글 preview</div>
		<div class="r4">내가 쓴 댓글 preview</div>
	</div>
</div>
<div style="height:12px"> </div>

<%@include file="/include/footer.jsp"%>