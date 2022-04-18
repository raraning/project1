<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<%
String id = request.getParameter("memberid");
String pass = request.getParameter("password");

//회원이 존재하는지 여부
String login_id_ex = "select * from member where memberid = '"+id+"'";

//아이디, 비밀번호가 같은 경우
String login_id_pass_ok = "select * from member where memberid = '"+id+"' and password = '"+pass+"'";

//밑 3줄은 select 구문을 쓸때 사용
Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(login_id_pass_ok);

//▽ 전역변수 선언
String mem_id = "";
String mem_pass = "";
String mem_name = "";
String mem_email = "";
String mem_level = "";
String mem_interest = "";
String mem_joindate = "";
String mem_nickname = "";
String mem_birth = "";


if(rs.next()){ //1이하 일 경우, 1이상일 경우 while문 사용 (if사용하더라도 조건문이 아닌 반복문임)
	mem_id = rs.getString("memberid");
	mem_pass = rs.getString("password");
	mem_name = rs.getString("name");
	mem_email = rs.getString("email");
	mem_level = rs.getString("level");
	mem_interest = rs.getString("interest");
	mem_joindate = rs.getString("joindate");
	mem_nickname = rs.getString("nickname");
	mem_birth = rs.getString("birth");
	mem_joindate = rs.getString("joindate");
}

if(id.equals(mem_id) && pass.equals(mem_pass)){
	session.setAttribute("id", id);
	session.setAttribute("name", mem_name);
	session.setAttribute("birth",mem_birth);
	session.setAttribute("level",mem_level);
	session.setAttribute("email",mem_email);
	session.setAttribute("interest",mem_interest);
	session.setAttribute("nickname",mem_nickname);
	session.setAttribute("password",mem_pass);
	session.setAttribute("joindate",mem_joindate);
%>
	<script>
		location.href="/"; //첫페이지로 보낸다.
	</script>
<%
}else{
	%>
	<script>
	alert("아이디 또는 비밀번호가 맞지 않거나 존재하지 않습니다.");
	history.back(); //전 페이지로 돌아가라
	</script>
	<%	
}

%>