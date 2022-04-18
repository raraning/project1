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
String session_level = (String)session.getAttribute("level");
String session_email = (String)session.getAttribute("email");
String session_interest = (String)session.getAttribute("interest");
String session_nickname = (String)session.getAttribute("nickname");
String session_joindate = (String)session.getAttribute("joindate");
%>
<div class="header">
	<div class="head logo"><a href="/"><img src="/img/logo4.png" width=200 height=100></a></div>
	<%
		if(session_id != null && session_id != ""){%>
			<div class="head joinmember"><%=session_level%><br><%=session_nickname%>(<%=session_id%>)님<br>환영합니다!!</div>
		<%}else{%>
			<div class="head joinmember"><br>JOIN US<br>▼</div>
		<%}
	%>
</div>
<div id="main_top">
	<nav id="top_menu">
		<ul class="mymenu">
			<li class="menu2">CSS
				<ul class="menu2_submenu">
					<li><a href="/bbs/csspage.jsp">CSS기본정보</a></li>
					<li><a href="/bbs/list.jsp?code=noticecss">CSS지식공유</a></li>
					<li><a href="/bbs/list.jsp?code=qnacss">CSS질문&답변</a></li>
				</ul>
			</li>
			<li class="menu4">MYSQL
				<ul class="menu4_submenu">
					<li><a href="/bbs/mysqlpage.jsp">MYSQL기본정보</a></li>
					<li><a href="/bbs/list.jsp?code=noticesql">MYSQL지식공유</a></li>
					<li><a href="/bbs/list.jsp?code=qnasql">MYSQL질문&답변</a></li>
				</ul>
			</li>
			<li class="menu3">자유게시판
				<ul class="menu3_submenu">
					<li><a href="/bbs_freetalk/ft_list.jsp">잡담게시판</a></li>
					<li><a href="/bbs_img/list.jsp?code=gallery">갤러리게시판</a></li>
				</ul>
			</li>
			<li style="width:120px;">코딩해보기</li>
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
					<li style="float:right"><a href="/member/join.jsp">회원가입</a></li>
				<%}
			%>
		</ul>
	</nav>
</div>
<!-- 로그인,마이페이지 클릭 시 모달레이어 -->
<script>
	function login(){
		if(!memberid.value){
			alert("아이디를 입력하세요");
			return false;
		}
		if(!password.value){
			alert("비밀번호를 입력하세요");
			return false;
		}
		document.submit();
	}
	function idpopup(){
		var popup = "/member/search_id.jsp";
		var name = "개인정보 수집 및 이용";
		var popOption = "toolbar=no, menubar=no, scrollbars = yes, resizable = yes, top=10, left=10, width=500, height=230";
		window.open(popup,name,popOption);
	}
	function passpopup(){
		var popup = "/member/search_pass.jsp";
		var name = "개인정보 수집 및 이용";
		var popOption = "toolbar=no, menubar=no, scrollbars = yes, resizable = yes, top=10, left=10, width=500, height=260";
		window.open(popup,name,popOption);
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
			<span onclick="idpopup();" style="cursor:pointer;">아이디찾기</span>
			<span>&nbsp;|&nbsp;</span>
			<span onclick="passpopup();" style="cursor:pointer;">비밀번호찾기</span>
			<span>&nbsp;|&nbsp;</span>
			<span><a href="/member/join.jsp"><font color="#777">회원가입</font></a></span>
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
