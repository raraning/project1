<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/admin/include/header.jsp"%>

<%
request.setCharacterEncoding("utf-8");

String id_ok = request.getParameter("id_ok");
String nick_ok = request.getParameter("nick_ok");
String id = request.getParameter("joinid");
String pass = request.getParameter("password1");
String name = request.getParameter("membername");
String email = request.getParameter("email");
String level = request.getParameter("level");
String interest = request.getParameter("interest");

//회원가입 날짜
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
String joindate = sf.format(nowTime);

String nickname = request.getParameter("nickname");
String birth = request.getParameter("birth");

if(id_ok != null && id_ok != "" && id_ok.equals("Y")){
	if(nick_ok != null && nick_ok != "" && nick_ok.equals("Y")){
		
	
	String join_insert = "insert into member values('"+id+"','"+pass+"','"+name+"','"+email+"','"+level+"','"+interest+"','"+joindate+"','"+nickname+"','"+birth+"')";
	
	//밑 3줄은 select를 제외한 나머지(insert,update,delete)에서 사용
	Connection conn2=DriverManager.getConnection(url, user, password);
	Statement stmt2=conn2.createStatement();
	stmt2.executeUpdate(join_insert);
	
	%>
	<script>
		alert("회원가입이 완료되었습니다");
		location.href="/admin/member/list.jsp?code=member";
	</script>
	<%
	}
}else{%>
	<script>
	alert("아이디 혹은 닉네임 중복확인 후 눌러주세요");
	history.back();
	</script>
	
<%}%>