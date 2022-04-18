<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String c_uid = request.getParameter("c_uid");
String uid = request.getParameter("uid");
String field = request.getParameter("field");
String search = request.getParameter("search");
String tb_uid = request.getParameter("tb_uid");

String sql = "delete from comment where tb_table='notice' and uid="+c_uid+" and tb_uid='"+tb_uid+"'";
Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
stmt.executeUpdate(sql);
%>

<script>
	alert("삭제되었습니다");
	location.href="ft_view.jsp?uid=<%=tb_uid%>&field=<%=field%>&search=<%=search%>";
</script>