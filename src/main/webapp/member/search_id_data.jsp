<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<%
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String nickname = request.getParameter("nickname");
String birth = request.getParameter("birth");

String id_nick = "";
String id_name = "";
String id_birth = "";

//닉네임조회 rs
String login_id_ex = "select * from member where nickname = '"+nickname+"'";

Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(login_id_ex);

while(rs.next()){
	id_nick = rs.getString("memberid");
}

//이름조회 rs
String login_id_ex2 = "select * from member where name = '"+name+"'";

Connection conn2=DriverManager.getConnection(url, user, password);
Statement stmt2=conn2.createStatement();
ResultSet rs2=stmt2.executeQuery(login_id_ex2);

while(rs2.next()){
	id_name = rs2.getString("memberid");
}

//생년월일조회 rs
String login_id_ex3 = "select * from member where birth = '"+birth+"'";

Connection conn3=DriverManager.getConnection(url, user, password);
Statement stmt3=conn3.createStatement();
ResultSet rs3=stmt3.executeQuery(login_id_ex3);

while(rs3.next()){
	id_birth = rs3.getString("memberid");
}

//출력구문
if(id_nick.equals(id_name) && id_birth.equals(id_name) && id_nick.equals(id_birth)){
%>
	<script>
	alert("<%=name%>(<%=nickname%>)님의 아이디는 <%=id_nick%>입니다.");
	history.back();
	</script>
<%	
}else{
	%>
	<script>
	alert("일치하는 아이디가 없습니다.");
	history.back();
	</script>
<%	
}
%>