<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");
String uid = request.getParameter("uid");
String page_now = request.getParameter("page_now");
String field = request.getParameter("field");
String search = request.getParameter("search");

String sql = "select * from "+code+" where uid = "+uid;

Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String gj = "";
String file1 = "";

if(rs.next()){
	gj = rs.getString("gongji");
	String subject = rs.getString("subject");
	String comment = rs.getString("comment");
	String id = rs.getString("id");
	String nickname = rs.getString("nickname");
	file1 = rs.getString("file1");
}
%>
<script>

function ft_modify(){
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
<div class="ft_top"> 잡담게시판 </div>
<div class="ftline"> </div>
<form action="modify_update.jsp?code=<%=code%>" method="post" enctype="multipart/form-data" onsubmit="return ft_modify()">
<input type="hidden" name="uid" value="<%=uid%>">
<input type="hidden" name="page_now" value="<%=page_now%>">
<input type="hidden" name="field" value="<%=field%>">
<input type="hidden" name="search" value="<%=search%>">
<div class="ftw f1">
	<div class="ftwr rr rr1">옵션</div>
	<div class="ftwr l1">
		<input type="radio" id="gongji" name="gongji" value="1"<%if(gj.equals("1")){%>checked<%}%>>공지글
		<input type="radio" id="gongji" name="gongji" value="2"<%if(gj.equals("2")){%>checked<%}%>>일반글
		<input type="radio" id="gongji" name="gongji" value="3"<%if(gj.equals("3")){%>checked<%}%>>비밀글
	</div>
</div>
<div class="ftw f2">
	<div class="ftwr rr rr2">글쓴이</div>
	<div class="ftwr l2"><%=rs.getString("nickname")%>(<%=rs.getString("id")%>)</div>
</div>
<div class="ftw f3">
	<div class="ftwr rr rr3">제목</div>
	<div class="ftwr l3"><input id="subject" name="subject" value="<%=rs.getString("subject")%>" style="width:810px;"></div>
</div>
<div class="ftw f4">
	<div class="ftwr rr rr4">내용</div>
	<div class="ftwr l4"><textarea id="comment" name="comment" style="width:810px;height:180px"><%=rs.getString("comment")%></textarea></div>
</div>
<div class="ftw f5">
	<div class="ftwr rr rr5">첨부</div>
	<div class="ftwr l5">
		<input type="file" name="file1">
			<%
			if(file1.equals("")){
				out.print("첨부파일이 없습니다");
			}else{
				out.print("파일명:"+file1);
			}
			%>
	</div>
</div>
<div class="ftwb">
	<div class="ftwbb b1 fb_button"><a href="delete.jsp?code=<%=code%>&uid=<%=uid%>&page_now=<%=page_now%>&field=<%=field%>&search=<%=search%>">삭제</a></div>
	<div class="ftwbb" style="width:10px;"></div>
	<div class="ftwbb b2 fb_button"><button class="fb_button" style="font-size:15px;">글수정</button></div>
	<div class="ftwbb" style="width:10px;"></div>
	<div class="ftwbb b3 fb_button"><a href="list.jsp?code=<%=code%>&page_now=<%=page_now%>&field=<%=field%>&search=<%=search%>">글목록</a></div>
</div>
</form>
<div style="height:15px;"> </div>

<%@include file="/include/footer.jsp"%>