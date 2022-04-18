<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<%
request.setCharacterEncoding("utf-8");

String id_ok = request.getParameter("id_ok");
String nick_ok = request.getParameter("nick_ok");
String id = request.getParameter("memberid");
String pass = request.getParameter("password1");
String name = request.getParameter("membername");
String email = request.getParameter("email");
String level = request.getParameter("level");
String interest = request.getParameter("interest");
String nickname = request.getParameter("nickname");
String birth = request.getParameter("birth");

String sql = "update member set password = '"+pass+"',email = '"+email+"',nickname = '"+nickname+"',interest = '"+interest+"' where memberid = '"+id+"'";


//밑 3줄은 select를 제외한 나머지(insert,update,delete)에서 사용
Connection conn2=DriverManager.getConnection(url, user, password);
Statement stmt2=conn2.createStatement();
stmt2.executeUpdate(sql);

%>
<script>
	alert("수정이 완료되었습니다");
	location.href="mypage.jsp";
</script>

