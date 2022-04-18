<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %><%--해당페이지에 header 페이지속성 전체 추가--%>

<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("memberid");
String code = request.getParameter("code");
String field = request.getParameter("field");
String search = request.getParameter("search");



String sql2 = "select * from member where memberid = '"+id+"'";
Connection conn2=DriverManager.getConnection(url, user, password);
Statement stmt2=conn2.createStatement();
ResultSet rs = stmt2.executeQuery(sql2);



if(rs.next()){
	id = rs.getString("memberid");

	String sql = "delete from member where memberid= '"+id+"'";
	
	Connection conn=DriverManager.getConnection(url, user, password);
	Statement stmt=conn.createStatement();
	stmt.executeUpdate(sql);
%>
<%
session.invalidate();
%>
		<script>
		alert("탈퇴되었습니다.");
		location.href="/";
		</script>
	<%
}
%>
