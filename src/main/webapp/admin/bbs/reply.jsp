<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");
%>
<%@include file="title.jsp"%>
<%
String uid = request.getParameter("uid");
String page_now = request.getParameter("page_now");
String field = request.getParameter("field");
String search = request.getParameter("search");

//상세내용
String sql = "select * from "+code+" where uid = "+uid;

Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String subject = "";
String comment = "";
String file1 = "";
String fid = "";
String thread = "";

if(rs.next()){
	subject = rs.getString("subject");
	comment = rs.getString("comment");
	file1 = rs.getString("file1");
	fid = rs.getString("fid");
	thread = rs.getString("thread");
}
%>
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
<form action="reply_insert.jsp" method="post" enctype="multipart/form-data" onsubmit="return ft_write()">
	<input type="hidden" name="code" value="<%=code%>">
	<input type="hidden" name="uid" value="<%=uid%>">
	<input type="hidden" name="page_now" value="<%=page_now%>">
	<input type="hidden" name="field" value="<%=field%>">
	<input type="hidden" name="search" value="<%=search%>">
	<input type="hidden" name="fid" value="<%=fid%>">
	<input type="hidden" name="thread" value="<%=thread%>">
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
		<div class="ftwr l5">
			<input type="file" name="file">
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
		<div class="ftwbb b2 fb_button"><button class="fb_button" style="font-size:15px">답변쓰기</button></div>
		<div class="ftwbb" style="width:10px;"></div>
		<div class="ftwbb b3 fb_button">글목록</div>
	</div>
</form>
<div style="height:15px;"> </div>

<%@include file="/include/footer.jsp"%>