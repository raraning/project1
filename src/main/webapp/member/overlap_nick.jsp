<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("joinid");
String name = request.getParameter("membername");
String email = request.getParameter("email");
String interest = request.getParameter("interest");
String nickname = request.getParameter("nickname");
String birth = request.getParameter("birth");


//닉네임 존재 여부
String exist = "select * from member where nickname = '"+nickname+"'";
Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
ResultSet rs = stmt.executeQuery(exist);

String exist_nickname = "";

if(rs.next()){ 
	exist_nickname = rs.getString("nickname");
}

if(exist_nickname != ""){ //존재하는 닉네임
%>
<script>
	alert("존재하는 닉네임입니다.");
	location.href="join.jsp?joinid=<%=id%>&id_ok=Y&nickname=<%=nickname%>&nick_ok=N&membername=<%=name%>&birth=<%=birth%>&email=<%=email%>";
</script>
<%
}else{ 
	%>
	<script>
		alert("사용가능한 닉네임입니다.");
		location.href="join.jsp?joinid=<%=id%>&id_ok=Y&nickname=<%=nickname%>&nick_ok=Y&membername=<%=name%>&birth=<%=birth%>&email=<%=email%>";
	</script>
	<%
}%>