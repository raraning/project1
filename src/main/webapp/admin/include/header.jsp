<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/dbconnection.jsp" %>
<%@ page import="java.sql.*" %><%--java의 import처리--%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@page import="java.awt.Image"%>
<%@page import="com.sun.jimi.core.Jimi"%>
<%@page import="com.sun.jimi.core.JimiException"%>
<%@page import="com.sun.jimi.core.JimiUtils"%>

<%
String session_level = (String)session.getAttribute("level");

if(!session_level.equals("관리개발자")){%>
	<script>
		alert("관리자만 이용가능한 페이지입니다.");
		location.href="/";
	</script>
<%}%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Study Room</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="/include/basic.css" rel="stylesheet" type="text/css">
<script src="/include/jquery-3.6.0.js"></script>

</head>
<body>
<%
String session_id = (String)session.getAttribute("id");
String session_pass = (String)session.getAttribute("password");
String session_name = (String)session.getAttribute("name");
String session_birth = (String)session.getAttribute("birth");
String session_email = (String)session.getAttribute("email");
String session_interest = (String)session.getAttribute("interest");
String session_nickname = (String)session.getAttribute("nickname");
String session_joindate = (String)session.getAttribute("joindate");
%>
<div class="header">
	<div class="head logo"><a href="/"><img src="/img/logo4.png" width=200 height=100></a></div>
	<%
		if(session_id != null && session_id != ""){%>
			<div class="head joinmember"><%=session_level%><br><%=session_name%>(<%=session_id%>)님<br>환영합니다!!</div>
		<%}else{%>
			<div class="head joinmember"><br>JOIN US<br>▼</div>
		<%}
	%>
</div>
<div id="main_top">
	<nav id="top_menu">
		<ul class="mymenu">
			<li class="menu2" style="width:130px"><a href="/admin/bbs/list.jsp?code=noticecss">CSS게시판관리</a></li>
			<li class="menu4" style="width:130px"><a href="/admin/bbs/list.jsp?code=noticesql">MYSQL게시판관리</a></li>
			<li class="menu3" style="width:130px"><a href="/admin/bbs_freetalk/ft_list.jsp">자유게시판관리</a></li>
			<li style="width:100px;"><a href="/admin/member/list.jsp?code=member">회원관리</a></li>
			<%
				if(session_id != null && session_id != ""){%>
					<li style="float:right"><a href="/member/logout.jsp">로그아웃</a></li>
					<%if("관리개발자".equals(session_level)){%>
						<li style="float:right"><a href="/admin/">관리자페이지</a></li>
					<%}else{ %>
						<li style="float:right"><a href="/member/mypage.jsp">마이페이지</a></li>
						<li style="float:right">1:1문의</li>
					<%} %>
				<%}else{%>
					<li id="modal_open2" style="float:right">로그인</li>
					<li style="float:right"><a href="/member/join.jsp?">회원가입</a></li>
				<%}
			%>
		</ul>
	</nav>
</div>
<!-- 로그인,마이페이지 클릭 시 모달레이어 -->
<script>
	function login(){
		if(!memberid.value){
			out.print("아이디를 입력하세요");
			return;
		}
		document.submit();
	}
</script>
<div id="modal">
	<div id="modal_content">
		<form action="/member/login_ok.jsp" method="post" onsubmit="return login()">
			<div align=center>아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="memberid" name="memberid" value=""></div>
			<div align=center style="padding-top:10px;">비밀번호&nbsp;<input type="password" id="password" name="password" value=""></div>
			<div align=center style="padding-top:10px;"><button id="modal_login" style="cursor: pointer">로그인</button></div>
		</form>
		<div id="modal_bottom">
			<span>아이디찾기</span>
			<span>&nbsp;|&nbsp;</span>
			<span>비밀번호찾기</span>
			<span>&nbsp;|&nbsp;</span>
			<span>회원가입</span>
		</div>
		<div align=right style="padding-top:10px;">
			<button id="modal_close">창닫기</button>
		</div>
	</div>
</div>
<!-- 모달레이어 js -->
<script>
	modal_open2.onclick = function(){
		modal.style.display = "block";
	}
	modal_close.onclick = function(){
		modal.style.display = "none";
	}
	
</script>
<!-- 모달레이어 끝 -->
