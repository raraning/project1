<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("joinid");
String name = request.getParameter("membername");
String email = request.getParameter("email");
String interest = request.getParameter("interest");
String nickname = request.getParameter("nickname");
String birth = request.getParameter("birth");

//회원 존재 여부
String exist = "select * from member where memberid = '"+id+"'";
Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
ResultSet rs = stmt.executeQuery(exist);

String exist_id = "";

if(rs.next()){ 
	exist_id = rs.getString("memberid");
}

if(exist_id != ""){ //존재하는 아이디
%>
<script>
	alert("존재하는 아이디입니다.");
	location.href="/admin/member/join.jsp?joinid=<%=id%>&id_ok=N&nickname=<%=nickname%>&membername=<%=name%>&birth=<%=birth%>&email=<%=email%>";
</script>
<%
}else{ 
	%>
	<script>
		alert("사용가능한 아이디입니다.");
		location.href="/admin/member/join.jsp?joinid=<%=id%>&id_ok=Y&nickname=<%=nickname%>&membername=<%=name%>&birth=<%=birth%>&email=<%=email%>";
	</script>
	<%
}%>