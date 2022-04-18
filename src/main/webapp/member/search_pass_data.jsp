<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String nickname = request.getParameter("nickname");
String birth = request.getParameter("birth");

String pass_id = "";
String pass_nick = "";
String pass_name = "";
String pass_birth = "";

//아이디조회 rs
String login_id_ex4 = "select * from member where memberid = '"+id+"'";

Connection conn4=DriverManager.getConnection(url, user, password);
Statement stmt4=conn4.createStatement();
ResultSet rs4=stmt4.executeQuery(login_id_ex4);

while(rs4.next()){
	pass_id = rs4.getString("password");
}

//닉네임조회 rs
String login_id_ex = "select * from member where nickname = '"+nickname+"'";

Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(login_id_ex);

while(rs.next()){
	pass_nick = rs.getString("password");
}

//이름조회 rs
String login_id_ex2 = "select * from member where name = '"+name+"'";

Connection conn2=DriverManager.getConnection(url, user, password);
Statement stmt2=conn2.createStatement();
ResultSet rs2=stmt2.executeQuery(login_id_ex2);

while(rs2.next()){
	pass_name = rs2.getString("password");
}

//생년월일조회 rs
String login_id_ex3 = "select * from member where birth = '"+birth+"'";

Connection conn3=DriverManager.getConnection(url, user, password);
Statement stmt3=conn3.createStatement();
ResultSet rs3=stmt3.executeQuery(login_id_ex3);

while(rs3.next()){
	pass_birth = rs3.getString("password");
}

//출력구문
if(pass_nick.equals(pass_name) && pass_birth.equals(pass_name) && pass_nick.equals(pass_birth) && pass_id.equals(pass_name)){
%>
	<script>
	alert("<%=id%>(<%=name%>)님의 비밀번호는 <%=pass_nick%>입니다.");
	history.back();
	</script>
<%	
}else{
	%>
	<script>
	alert("일치하는 정보가 없습니다.");
	history.back();
	</script>
<%	
}
%>