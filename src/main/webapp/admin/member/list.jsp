<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/admin/include/header.jsp"%>
<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");
%>
<%
//검색
String field = "";
String search = "";
if(request.getParameter("field") != null){
	field = request.getParameter("field");
	search = request.getParameter("search");
}

//게시물 수
String sql_c = "select count(*) as total_notice from "+code;
if(request.getParameter("field") != null && request.getParameter("field") != ""){
	sql_c = "select count(*) as total_notice from "+code+" where "+field+" like '%"+search+"%'";
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
int num_per_page = 10;
int page_per_block = 3;
int total_page = 0;
total_page = (int)Math.ceil(total_record / (double)num_per_page);

int first = num_per_page * (page_now -1);


%>

<div style="height:15px;"> </div>
<div class="ft_top">   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 관리 </div>
<div class="ft_total">Total&nbsp;<b><%=total_record%></b>건&nbsp;&nbsp;|&nbsp;&nbsp;<b><%=page_now%>&nbsp;page</b></div>
<div style="height:15px;"> </div>
<div class="ft_list" style="width:970px;">
	<div class="ftlist ft1" style="width:100px">가입일</div>
	<div class="ftlist ft2" style="width:80px">아이디</div>
	<div class="ftlist ft3" style="width:130px">이름(닉네임)</div>
	<div class="ftlist ft5" style="width:80px">비밀번호</div>
	<div class="ftlist ft6" style="width:100px">생년월일</div>
	<div class="ftlist ft7" style="width:80px">등급</div>
	<div class="ftlist ft8" style="width:80px">관심분야</div>
	<div class="ftlist ft9" style="width:140px">이메일</div>
	<div class="ftlist ft9" style="width:70px">관리</div>
	<div class="ftlist ft9" style="width:70px">탈퇴</div>
</div>
<script>
	function memdel(mem_id){
		var result = confirm("아이디:"+mem_id+"\n삭제하시겠습니까?");
		if(result){
			location.href="/admin/member/member_delete.jsp?code=<%=code%>&memberid="+mem_id;
			return true;
		}
	}
</script>
<%
	//회원리스트
	String sql = "select * from "+code+" where (1) order by joindate desc limit "+first+","+num_per_page;
	if(request.getParameter("field") != null && request.getParameter("field") != ""){
		sql = "select * from "+code+" where (1) and "+field+" like '%"+search+"%' order by joindate desc limit "+first+","+num_per_page;
	}
	
	Connection conn=DriverManager.getConnection(url, user, password);
	Statement stmt=conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	int bbs_number = total_record - ((page_now -1) * num_per_page);
	
	String nickname = "";
	
	while(rs.next()){
		nickname = rs.getString("nickname");
		String name = rs.getString("name");
		String joindate = rs.getString("joindate").substring(0,10);
		String password1 = rs.getString("password");
		String id = rs.getString("memberid");
		String birth = rs.getString("birth");
		String level = rs.getString("level");
		String interest = rs.getString("interest");
		String email = rs.getString("email");
%>
<div class="ft_list2" style="width:970px;">
	<div class="ftlist2 ft1" style="width:100px;font-size:13px"><%=joindate%></div>
	<div class="ftlist2 ft2" style="width:80px;font-size:13px"><%=id%></div>
	<div class="ftlist2 ft3" style="width:130px;font-size:13px"><%=name%>(<%=nickname%>)</div>
	<div class="ftlist2 ft5" style="width:80px;font-size:13px"><%=password1%></div>
	<div class="ftlist2 ft6" style="width:100px;font-size:13px"><%=birth%></div>
	<div class="ftlist2 ft7" style="width:80px;font-size:13px"><%=level%></div>
	<div class="ftlist2 ft8" style="width:80px;font-size:13px">
		<%if(interest.equals("1")){
			out.print("JSP");
		}else if(interest.equals("2")){
			out.print("CSS");
		}else if(interest.equals("3")){
			out.print("MYSQL");
		}else{
			out.print("기타");
		}%>
	</div>
	<div class="ftlist2 ft9" style="width:140px;font-size:13px"><%=email%></div>
	<div class="ftlist2 ft9" style="width:70px;font-size:13px"><a href="/admin/member/join_up.jsp?code=<%=code%>&memberid=<%=id%>"><button style="cursor:pointer">관리</button></a></div>
	<div class="ftlist2 ft9" style="width:70px;font-size:13px">
			<button style="cursor:pointer" onclick="memdel('<%=id%>')">탈퇴</button>
	</div>
</div>

<%
bbs_number--;
}
if(total_record ==0){%>
	<div class="ftempty"  style="width:970px;"><br><br><br>가입된 회원이 없습니다</div>
	<div class="ftline bt"  style="width:970px;"> </div>
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
		%><a href="/admin/member/list.jsp?code=<%=code%>&page_now=<%=my_page%>"><img src="img/arrowsl.png" width=10 height=10>이전&nbsp;</a>
		<%}%>
	</div>
	<div class="ftbp p2">
		<%
		for(direct_page = first_page +1; direct_page <= last_page; direct_page++){
			if(page_now == direct_page){%>
				&nbsp;&nbsp;<font color=red><b><%=direct_page%></b></font>&nbsp;&nbsp;|
			<%}else{%>
				&nbsp;&nbsp;<a href="/admin/member/list.jsp?code=<%=code%>&page_now=<%=direct_page%>"><%=direct_page%></a>&nbsp;&nbsp;|
				<%}
			}%>
	</div>
	<div class="ftbp p3">
		<%
		if(block < total_block){
			my_page = last_page + 1;
		%><a href="/admin/member/list.jsp?code=<%=code%>&page_now=<%=my_page%>">&nbsp;다음<img src="img/arrowsr.png" width=10 height=10></a>
		<%}else{
		%>
		<%}%>
	</div>
</div>
<!-- 페이징 끝 -->
<div style="width:970px;height:50px;margin-left:500px;margin-right:600px;">
	<div class="ftbt fb_button fb1"><a href="/admin/member/list.jsp?code=<%=code%>">새로고침</a></div>
	<div class="ftbt fb2">
		<form action="/admin/member/list.jsp?code=<%=code%>" method="post">
			<select id="field" name="field">
				<option value="memberid" <%if(field.equals("memberid")){%>selected<%} %>>아이디</option>		
				<option value="name" <%if(field.equals("name")){%>selected<%} %>>이름</option>
				<option value="nickname" <%if(field.equals("nickname")){%>selected<%} %>>닉네임</option>
			</select>
			<input id="search" name="search" value="<%=search%>">
			<button class="s_button">검색</button>
		</form>
	</div>
	<div class="ftbt fb_button fb3" style="width:140px">
		<a href="/admin/member/join.jsp">회원가입(관리자권한)</a>
	</div>
</div>
<div style="height:15px;"> </div>

<%@include file="/admin/include/footer.jsp"%>