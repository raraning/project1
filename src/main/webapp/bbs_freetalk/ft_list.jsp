<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");

//검색
String field = "";
String search = "";
if(request.getParameter("field") != null){
	field = request.getParameter("field");
	search = request.getParameter("search");
}

//게시물 수
String sql_c = "select count(*) as total_notice from notice where gongji != '1'";
if(request.getParameter("field") != null && request.getParameter("field") != ""){
	sql_c = "select count(*) as total_notice from notice where gongji != '1' and "+field+" like '%"+search+"%'";
}

Connection conn_c=DriverManager.getConnection(url, user, password);
Statement stmt_c=conn_c.createStatement();
ResultSet rs_c = stmt_c.executeQuery(sql_c);

int total_record = 0;
if(rs_c.next()){
	total_record = rs_c.getInt("total_notice");
}
int page_now = 1;
if(request.getParameter("page_now") != null){
	page_now = Integer.parseInt(request.getParameter("page_now"));
}
int num_per_page = 5;
int page_per_block = 3;
int total_page = 0;
total_page = (int)Math.ceil(total_record / (double)num_per_page);

int first = num_per_page * (page_now -1);


%>

<div style="height:15px;"> </div>
<div class="ft_top"> 잡담게시판 </div>
<div class="ft_total">Total&nbsp;<b><%=total_record%></b>건&nbsp;&nbsp;|&nbsp;&nbsp;<b><%=page_now%>&nbsp;page</b></div>
<div style="height:15px;"> </div>
<div class="ft_list">
	<div class="ftlist ft1">번호</div>
	<div class="ftlist ft2">제목</div>
	<div class="ftlist ft3">글쓴이</div>
	<div class="ftlist ft4">작성일</div>
	<div class="ftlist ft5">조회수</div>
</div>
<%
//공지
if(page_now == 1){
	String sql_gj = "select * from notice where gongji = '1' order by uid desc limit "+first+","+num_per_page;
	if(request.getParameter("field") != null && request.getParameter("field") != ""){
		sql_gj = "select * from notice where gongji = '1' and "+field+" like '%"+search+"%' order by uid desc";
	}
	
	Connection conn_gj=DriverManager.getConnection(url, user, password);
	Statement stmt_gj=conn_gj.createStatement();
	ResultSet rs_gj = stmt_gj.executeQuery(sql_gj);
	
	int bbs_number = total_record - ((page_now -1) * num_per_page);
	
	while(rs_gj.next()){
		int uid = rs_gj.getInt("uid");
		String subject = rs_gj.getString("subject");
		String signdate = rs_gj.getString("signdate").substring(0,10);
	
	%>
<div class="ft_list2" style="background-color:#ffd6d5;font-weight:bold;">
	<div class="ftlist2 ft1"><img src="img/notice.png" width=15 height=15></div>
	<a href="ft_view.jsp?page_now=<%=page_now%>&uid=<%=uid%>&field=<%=field%>&search=<%=search%>"><div class="ftlist2 ft22"><%=subject%></div></a>
	<div class="ftlist2 ft3"><%=rs_gj.getString("nickname")%></div>
	<div class="ftlist2 ft4"><%=signdate%></div>
	<div class="ftlist2 ft5"><%=rs_gj.getString("ref")%></div>
</div>
	<%
	}
}
	//일반,비밀
	String sql = "select * from notice where gongji != '1' order by uid desc limit "+first+","+num_per_page;
	if(request.getParameter("field") != null && request.getParameter("field") != ""){
		sql = "select * from notice where gongji != '1' and "+field+" like '%"+search+"%' order by uid desc";
	}
	
	Connection conn=DriverManager.getConnection(url, user, password);
	Statement stmt=conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	int bbs_number = total_record - ((page_now -1) * num_per_page);
	
	String file1 = "";
	String gongji = "";
	String nickname = "";
	
	while(rs.next()){
		int uid = rs.getInt("uid");
		String signdate = rs.getString("signdate").substring(0,10);
		String subject = rs.getString("subject");
		file1 = rs.getString("file1");
		gongji = rs.getString("gongji");
		nickname = rs.getString("nickname");
		
		int len_subject = subject.length();
		if(len_subject > 30){
			subject = subject.substring(0,30) + "......";
		}else{
			subject = subject;
		}
	
	
%>
<div class="ft_list2">
	<div class="ftlist2 ft1"><%=bbs_number%></div>
	<%
	//제목에 댓글 개수 붙이기
	String sql_c2 = "select count(*) as comment_count from comment where tb_table='notice' and tb_uid = "+uid;
	
	Connection conn_c2=DriverManager.getConnection(url, user, password);
	Statement stmt_c2=conn_c2.createStatement();
	ResultSet rs_c2 = stmt_c2.executeQuery(sql_c2);
	
	int tb_comment_c = 0;
	while(rs_c2.next()){
		tb_comment_c = rs_c2.getInt("comment_count");
	}
	%>
	<%
	if(gongji.equals("3")){
		if((session_nickname != null && session_nickname != "" && session_nickname.equals(nickname)) || (session_level != null && session_level != "" && session_level.equals("관리개발자"))){%>
			<a href="ft_view.jsp?page_now=<%=page_now%>&uid=<%=uid%>&field=<%=field%>&search=<%=search%>">
			<div class="ftlist2 ft22">
				<%=subject%>&nbsp;<b><%if(tb_comment_c > 0){%>[<%=tb_comment_c%>]<%} %>
				<%if(gongji.equals("3")){%>&nbsp;<img src="img/secret.png" width=13 height=13><%}%>
				<%if(!file1.equals("")){%>&nbsp;<img src="img/folder.png" width=13 height=13><%}%></b>
			</div>
			</a>
		<%}else{%>
			<a href="javascript:alert('비밀글 입니다.');">
			<div class="ftlist2 ft22">
				<%=subject%>&nbsp;<b><%if(tb_comment_c > 0){%>[<%=tb_comment_c%>]<%} %>
				<%if(gongji.equals("3")){%>&nbsp;<img src="img/secret.png" width=13 height=13><%}%>
				<%if(!file1.equals("")){%>&nbsp;<img src="img/folder.png" width=13 height=13><%}%></b>
			</div>
			</a>
		<%}
	}else{%>
		<a href="ft_view.jsp?page_now=<%=page_now%>&uid=<%=uid%>&field=<%=field%>&search=<%=search%>">
		<div class="ftlist2 ft22">
			<%=subject%>&nbsp;<b><%if(tb_comment_c > 0){%>[<%=tb_comment_c%>]<%} %>
			<%if(gongji.equals("3")){%>&nbsp;<img src="img/secret.png" width=13 height=13><%}%>
			<%if(!file1.equals("")){%>&nbsp;<img src="img/folder.png" width=13 height=13><%}%></b>
		</div>
		</a>
	<%}%>
	<div class="ftlist2 ft3"><%=nickname%></div>
	<div class="ftlist2 ft4"><%=signdate%></div>
	<div class="ftlist2 ft5"><%=rs.getString("ref")%></div>
</div>
<%
bbs_number--;
}
if(total_record ==0){%>
	<div class="ftempty"><br><br><br>작성된 게시물이 없습니다</div>
	<div class="ftline bt"> </div>
<%}%>
<!-- 페이징 시작 -->
<div class="ft_bottom" style="text-align:center">
	<div class="ftbp p1">
		<%
		int total_block = 0; // 총 페이지 블록 개수
		int block = 0; //현재 페이지의 블록
		int first_page = 0; 
		int last_page = 0;
		int direct_page = 0;
		int my_page = 0;
		
		total_block = (int)Math.ceil(total_page / (double)page_per_block);
		block = (int)Math.ceil(page_now / (double)page_per_block);
		first_page = (block -1) * page_per_block;
		last_page = block * page_per_block;
		
		if(total_block <= block){
			last_page = total_page;
		}
		
		if(block == 1){%>
		
		<%}else{
			my_page = first_page;
		%><a href="ft_list.jsp?page_now=<%=my_page%>"><img src="img/arrowsl.png" width=10 height=10>이전&nbsp;</a>
		<%}%>
	</div>
	<div class="ftbp p2">
		<%
		for(direct_page = first_page +1; direct_page <= last_page; direct_page++){
			if(page_now == direct_page){%>
				&nbsp;&nbsp;<font color=red><b><%=direct_page%></b></font>&nbsp;&nbsp;|
			<%}else{%>
				&nbsp;&nbsp;<a href="ft_list.jsp?page_now=<%=direct_page%>"><%=direct_page%></a>&nbsp;&nbsp;|
				<%}
			}%>
	</div>
	<div class="ftbp p3">
		<%
		if(block < total_block){
			my_page = last_page + 1;
		%><a href="ft_list.jsp?page_now=<%=my_page%>">&nbsp;다음<img src="img/arrowsr.png" width=10 height=10></a>
		<%}else{
		%>
		<%}%>
	</div>
</div>
<!-- 페이징 끝 -->
<div class="ft_bottom">
	<div class="ftbt fb_button fb1"><a href="ft_list.jsp">새로고침</a></div>
	<div class="ftbt fb2">
		<form action="ft_list.jsp" method="post">
			<select id="field" name="field">
				<option value="subject" <%if(field.equals("subject")){%>selected<%} %>>제목</option>		
				<option value="comment" <%if(field.equals("comment")){%>selected<%} %>>내용</option>
				<option value="nickname" <%if(field.equals("nickname")){%>selected<%} %>>글쓴이</option>
			</select>
			<input id="search" name="search" value="<%=search%>">
			<button class="s_button">검색</button>
		</form>
	</div>
	<div class="ftbt fb_button fb3">
	<%
	if(session_id != null && session_id != ""){%>
		<a href="ft_write.jsp">글쓰기</a>
	<%}else{%>
		<a href="javascript:alert('로그인 후 이용하실 수 있습니다');">글쓰기</a>
	<%}%>
	</div>
</div>
<div style="height:15px;"> </div>

<%@include file="/include/footer.jsp"%>