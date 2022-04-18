<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

//게시물 수
String sql_c = "select count(*) as comment_count from comment where tb_table='"+code+"' and tb_uid = "+uid;

Connection conn_c=DriverManager.getConnection(url, user, password);
Statement stmt_c=conn_c.createStatement();
ResultSet rs_c = stmt_c.executeQuery(sql_c);

int total_record = 0;
if(rs_c.next()){
	total_record = rs_c.getInt("comment_count");
}

//조회수+1
String sql_ref = "update "+code+" set ref=ref+1 where uid="+uid+"";
Connection conn_ref=DriverManager.getConnection(url, user, password);
Statement stmt_ref=conn_ref.createStatement();
stmt_ref.executeUpdate(sql_ref);

//상세내용
String sql = "select * from "+code+" where uid = "+uid;

Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String gj = "";
	
if(rs.next()){
	gj = rs.getString("gongji");
	String subject = rs.getString("subject");
	String comment = rs.getString("comment");
	String file1 = rs.getString("file1");

%>
<div style="height:15px;"> </div>
<div class="ft_top"> <%=code_title%> </div>
<div class="ftline"> </div>
<input type="hidden" id="uid" name="uid">
	<div class="ftw f1">
		<div class="ftwr rr rr1">옵션</div>
		<div class="ftwr l1">
			<%
			if(gj.equals("1")){
				out.print("공지글");
			}else if(gj.equals("2")){
				out.print("일반글");
			}else if(gj.equals("3")){
				out.print("비밀글");
			}else{
				out.print("오류");
			}
			%>
		</div>
	</div>
	<div class="ftw f2">
		<div class="ftwr rr rr2">글쓴이</div>
		<div class="ftwr l2"><%=rs.getString("nickname")%>(<%=rs.getString("id")%>)</div>
	</div>
	<div class="ftw f5">
		<div class="ftwr rr rr5">첨부</div>
		<div class="ftwr l5">
		<%if(!file1.equals("")){ %>
			<a href="/upload/<%=file1%>" download><%=file1%></a>
		<%}else{ %>
			<span style="color:#ccc">첨부된 파일이 없습니다.</span>
		<%} %>
		</div>
	</div>
	<div class="ftw f3">
		<div class="ftwr rr rr3">제목</div>
		<div class="ftwr l3"><%=rs.getString("subject")%></div>
	</div>
	<%
	//comment 개행처리
	pageContext.setAttribute("cmt2", comment);
	pageContext.setAttribute("LF", "\n");
	%>
	${fn:replace(cmt, LF, '<br>')}
	<div class="ftw f4">
		<div class="ftwr rr" style="vertical-align: top;">내용</div>
		<div class="ftwr l4" >
			<span style="width:810px;height:180px;color:black">
				<%if(file1 != null && file1 != ""){%>
					<img src="/upload/<%=file1%>" style="max-width:700px; height:auto"><br>
				<%} %>
				<%
				//comment 개행처리
				pageContext.setAttribute("cmt", comment);
				pageContext.setAttribute("LF", "\n");
				%>
				${fn:replace(cmt, LF, '<br>')}
			</span>
		</div>
	</div>
	<!-- 댓글시작 -->
	<div class="viewfid">
		<%
		String sql_comment = "select * from comment where tb_table='"+code+"' and tb_uid="+uid;
		
		Connection conn_comment=DriverManager.getConnection(url, user, password);
		Statement stmt_comment=conn_comment.createStatement();
		ResultSet rs_comment = stmt_comment.executeQuery(sql_comment);
		
		
		String c_comment = "";
		String tb_uid = "";
		String c_uid = "";
		
		while(rs_comment.next()){
			String c_nickname = rs_comment.getString("tb_nickname");
			c_comment = rs_comment.getString("tb_comment");
			String c_date = rs_comment.getString("tb_date").substring(0,10);
			tb_uid = rs_comment.getString("tb_uid");
			c_uid = rs_comment.getString("uid");
	
		%>
		<div class="fid1">
			<div class="fidv v1"><%=c_nickname%></div>
			<div class="fidv v2"><%=c_comment%></div>
			<div class="fidv v3"><%=c_date%></div>
			<div class="fidv v4">
			<%
			if(session_nickname != null && session_nickname != "" && session_nickname.equals(c_nickname)){%>
				<a href="view_modify.jsp?code=<%=code%>&uid=<%=uid%>&tb_uid=<%=tb_uid%>&c_uid=<%=c_uid%>">
				<img src="img/edit.png" width=17 height=17 title="수정하기"></a>
			<%}else{%>
				<a href="javascript:alert('댓글의 작성자 혹은 관리자만 수정이 가능합니다');">
				<img src="img/edit.png" width=17 height=17 title="수정하기"></a>
			<%}%>
				</div>&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="fidv v5">
			<%
			if(session_nickname != null && session_nickname != "" && session_nickname.equals(c_nickname)){%>
				<script>
					function ftfid_del(){
						var delok = confirm("삭제하시겠습니까?");
						if(delok == true){
							location.href="comment_delete.jsp?code=<%=code%>&uid=<%=uid%>&tb_uid=<%=tb_uid%>&c_uid=<%=c_uid%>";
						}else{
							return;
						}
					}
				</script>
				<a href="javascript:ftfid_del();">
					<img src="img/cancel.png" width=17 height=17 title="삭제하기">
				</a>
			<%}else{%>
				<a href="javascript:alert('댓글의 작성자 혹은 관리자만 삭제가 가능합니다');">
					<img src="img/cancel.png" width=17 height=17 title="삭제하기">
				</a>
			<%}%>
			</div>
		</div>
		<%}%>
		<%
		if(total_record < 1){%>
			<div class="ftfempty"><br>작성된 댓글이 없습니다</div>
			<div class="ftfline bt"> </div>
		<%}%>
		<!-- 댓글 페이징 시작 -->
		
		<!-- 댓글 페이징 끝 -->
		<div style="height:15px;"> </div>
		<%if(session_level == null || session_level == ""){%>
			<script>
				function bbb(){
					alert("로그인 후 작성하실 수 있습니다");
				}
			</script>
			<div class="fid2">
			<div class="fidw"><input id="comment" name="comment" style="width:700px;"><button class="fb_button" onclick="bbb();">댓글쓰기</button></div>
			</div>
		<%}else{%>
		<form action="comment_insert.jsp?code=<%=code%>" method="post">
		<input type="hidden" name="code" value="<%=code%>">
		<input type="hidden" name="uid" value="<%=uid%>">
		<input type="hidden" name="page_now" value="<%=page_now%>">
		<input type="hidden" name="field" value="<%=field%>">
		<input type="hidden" name="search" value="<%=search%>">
		<div class="fid2">
			<div class="fidw"><input id="comment" name="comment" style="width:700px;"><button class="fb_button">댓글쓰기</button></div>
		</div>
		</form>
		<%}%>
	</div>
	<!-- 댓글끝 -->
	<div class="ftwb">
		<div class="ftwbb b1 fb_button">
			<%
			if(rs.getString("id").equals(session_id) || "관리개발자".equals(session_level)){%>
				<script>
					function ft_del(){
						var delok = confirm("삭제하시겠습니까?");
						if(delok == true){
							location.href="delete.jsp?code=<%=code%>&uid=<%=uid%>&field=<%=field%>&search=<%=search%>";
						}else{
							return;
						}
						
					}
				</script>
				<a href="javascript:ft_del();">삭제</a>
			<%}else{%>
				<a href="javascript:alert('글의 작성자 혹은 관리자만 삭제가 가능합니다');">삭제</a>
			<%}%>
		</div>
		<div class="ftwbb" style="width:10px;"></div>
		<div class="ftwbb b2 fb_button">
			<%
			if(rs.getString("id").equals(session_id)){%>
				<a href="modify.jsp?code=<%=code%>&uid=<%=uid%>&page_now=<%=page_now%>&field=<%=field%>&search=<%=search%>">수정하기</a>
			<%}else{%>
				<a href="javascript:alert('글의 작성자 혹은 관리자만 수정이 가능합니다');">수정하기</a>
			<%}%>
		</div>
		<div class="ftwbb" style="width:10px;"></div>
		<div class="ftwbb b3 fb_button"><a href="list.jsp?code=<%=code%>&page_now=<%=page_now%>&field=<%=field%>&search=<%=search%>">글목록</a></div>
	</div>
<div style="height:15px;"> </div>

<%}%>
<%@include file="/include/footer.jsp"%>