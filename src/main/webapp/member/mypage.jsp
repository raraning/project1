<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<script>
	function memdel(mem_id){
		var result = confirm("정말 탈퇴 하시겠습니까?");
		if(result){
			location.href="member_delete.jsp?memberid="+mem_id;
		}
	}
</script>
<div class="mypagebody">
	<div class="mypage" style="width:555px"> </div>
	<div class="mypage mright">
		<div class="mpline li2"> </div>
		<div class="r1" align=center><img src="/img/man-user.png" width=70 height=70></div>
		<div class="r2"><%=session_level%><br><%=session_name%>(<%=session_id%>)님, 환영합니다.</div>
		<div style="height:20px;"></div>
		<a href="join_up.jsp">
			<div class="mpmenu l1" align=center style="margin-left:270px;">&nbsp;&nbsp;&nbsp;<img src="/img/man-user.png" class="mimg 1">&nbsp;&nbsp;&nbsp;회원정보수정</div>
		</a>
		<div style="height:10px;"></div>
		<a href="mywrite.jsp">
			<div class="mpmenu l2" align=center style="margin-left:270px;">&nbsp;&nbsp;&nbsp;<img src="/img/writing.png" class="mimg 2">&nbsp;&nbsp;&nbsp;내가 쓴 글</div>
		</a>
		<div style="height:10px;"></div>
		<div class="l4" style="margin-left:270px;">
			<a href="javascript:void(0);" onclick="javascript:memdel('<%=session_id%>');">&nbsp;&nbsp;&nbsp;- 회원탈퇴</a>
		</div>
	</div>
</div>
<div style="height:12px"> </div>

<%@include file="/include/footer.jsp"%>