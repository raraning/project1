<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");
String uid = request.getParameter("uid");
String field = request.getParameter("field");
String search = request.getParameter("search");

String sql = "delete from "+code+" where uid="+uid;
Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
stmt.executeUpdate(sql);
%>

<script>
	alert("삭제되었습니다");
	location.href="/admin/bbs/list.jsp?code=<%=code%>";
</script>