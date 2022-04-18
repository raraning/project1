<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
 
<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");
String uid = request.getParameter("uid");
String page_now = request.getParameter("page_now");
String field = request.getParameter("field");
String search = request.getParameter("search");
String comment = request.getParameter("comment");

//현재 시간
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
String today = sf.format(nowTime);


String sql = "insert into comment (tb_table,tb_uid,tb_id,tb_name,tb_nickname,tb_level,tb_comment,tb_date) values('"+code+"',"+uid+",'"+session_id+"','"+session_name+"','"+session_nickname+"','"+session_level+"','"+comment+"','"+today+"')";

//밑 3줄은 select를 제외한 나머지(insert,update,delete)에서 사용, 규칙
Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
stmt.executeUpdate(sql);

%>
<script>
	location.href="view.jsp?code=<%=code%>&uid=<%=uid%>&page_now=<%=page_now%>&field=<%=field%>&search=<%=search%>";
</script>