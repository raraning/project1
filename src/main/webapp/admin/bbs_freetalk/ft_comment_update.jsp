<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
 
<%
request.setCharacterEncoding("utf-8");


String uid = request.getParameter("uid");
String page_now = request.getParameter("page_now");
String field = request.getParameter("field");
String search = request.getParameter("search");
String comment = request.getParameter("comment");
String c_uid = request.getParameter("c_uid");
String c_uid2 = request.getParameter("c_uid2");
String tb_uid = request.getParameter("tb_uid");

//현재 시간
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
String today = sf.format(nowTime);


String sql = "update comment set tb_comment='"+comment+"',tb_date='"+today+"' where uid="+c_uid2;

//밑 3줄은 select를 제외한 나머지(insert,update,delete)에서 사용, 규칙
Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
stmt.executeUpdate(sql);

%>
<script>
	location.href="ft_view.jsp?uid=<%=uid%>&page_now=<%=page_now%>&field=<%=field%>&search=<%=search%>";
</script>