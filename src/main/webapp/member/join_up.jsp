<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<%
String id_ok = request.getParameter("id_ok");
String joinid2 = request.getParameter("joinid");
String nick_ok = request.getParameter("nick_ok");
String nickname2 = request.getParameter("nickname");
String name2 = request.getParameter("membername");
String birth2 = request.getParameter("birth");
String email2 = request.getParameter("email");
String interest2 = request.getParameter("interest");

%>
<script>
	function join_up(){
		
		//비밀번호 유효성 검사
		var passcheck = document.getElementById("passcheck");
		if(!password1.value){
			passcheck.innerText = "비밀번호를 입력하세요";
			password1.focus();
			return false;
		}else{
			passcheck.innerText = " ";
		}
		if(password1.value.length < 4){
			passcheck.innerText = "비밀번호를 4자리 이상 입력하세요";
			password1.focus();
			return false;
		}
		var passcheck2 = document.getElementById("passcheck2");
		if(password1.value != password2.value){
			passcheck2.innerText = "입력하신 비밀번호가 일치하지 않습니다";
			password1.focus();
			return false;
		}
		
		//닉네임 유효성 검사
		var nicknamecheck = document.getElementById("nicknamecheck");
		if(!nickname.value){
			nicknamecheck.innerText = "닉네임을 입력하세요";
			nickname.focus();
			return false;
		}
		if(nickname.value.length < 2){
			nicknamecheck.innerText = "닉네임을 2자리 이상 입력하세요";
			nickname.focus();
			return false;
		}
		
		//email 유효성 검사
		var mailcheck = document.getElementById("mailcheck");
		
		if(email.value.length < 10){
			mailcheck.innerText = "email을 10자리 이상 입력하세요";
			email.focus();
			return false;
		}
		if(!email.value.includes("@") || !email.value.includes(".")){
			mailcheck.innerText = "email형식에 맞지않습니다";
			email.focus();
			return false;
		}
		
		
		document.submit();
		
	}
	
	//닉네임 중복확인
	function overlapnick(){
		var olid = document.getElementById("joinid");
		var olnick = document.getElementById("nickname");
		var name = document.getElementById("membername");
		var birth = document.getElementById("birth");
		var email = document.getElementById("email");
		if(!nickname.value){
			alert("닉네임입력 후 눌러주세요");
		}else{
			location.href="overlap_nickup.jsp?&nickname="+olnick.value;
		}
		
	}
</script>

<div height=20>&nbsp;</div>
<div width=100%>
	<form action="join_update.jsp" method="post" onsubmit="return join_up()">
	<input type="hidden" id="level" name="level" value="신입개발자">
		<div class="join_top">회원정보수정</div>
		<div style="height:15px;"> </div>
		<div class="join_main">
			<div><div class="join_menu2">아이디<font color="gray">(수정불가)</font></div>
				<div><input id="memberid" name="memberid" value="<%=session_id%>" readonly></div>
			</div>
			<div id="idcheck" style="height:15px;color:red"></div>
			<div class="join_defualt"><div class="join_menu2">닉네임</div>
				<div><input id="nickname" name="nickname" value="<%if(nick_ok != null && nick_ok != "" && nick_ok.equals("Y")){%><%=nickname2%><%}else{%><%=session_nickname%><%}%>">
				&nbsp;<span class="join_id_button" onclick="overlapnick()">닉네임 중복확인</span></div>
			</div>
			<div id="nicknamecheck" style="height:15px;color:red"></div>
			<div class="join_defualt"><div class="join_menu2">비밀번호 입력</div>
				<div><input type="password" id="password1" name="password1" value=""></div>
			</div>
			<div id="passcheck" style="height:15px;color:red"></div>
			<div class="join_defualt"><div class="join_menu2">비밀번호 재입력</div>
				<div><input type="password" id="password2" name="password2" value="<%=session_pass%>"><font color="gray">&nbsp;비밀번호 수정 시 입력</font></div>
			</div>
			
			<div id="passcheck2" style="height:15px;color:red"></div>
			<div class="join_defualt"><div class="join_menu2">이름<font color="gray">(수정불가)</font></div>
				<div><input id="membername" name="membername" value="<%=session_name%>" readonly></div>
			</div>
			<div id="namecheck" style="height:15px;color:red"></div>
			<div class="join_defualt"><div class="join_menu2">생년월일<font color="gray">(수정불가)</font></div>
				<div><input style="width:172px" type="date" id="birth" name="birth" value="<%=session_birth%>" readonly></div>
			</div>
			<div id="birthcheck" style="height:15px;color:red"></div>
			<div class="join_defualt"><div class="join_menu2">email</div>
				<div><input id="email" name="email" value="<%=session_email%>"></div>
			</div>
			<div id="mailcheck" style="height:15px;color:red"></div>
			<div class="join_defualt"><div class="join_menu2">관심분야</div>
				<div>
					<%
					if(session_interest.equals("2")){%>
						<input type="radio" id="interest" name="interest" value="2" checked>CSS
						<input type="radio" id="interest" name="interest" value="3">MYSQL
						<input type="radio" id="interest" name="interest" value="4">기타
					<%}else if(session_interest.equals("3")){%>	
						<input type="radio" id="interest" name="interest" value="2">CSS
						<input type="radio" id="interest" name="interest" value="3" checked>MYSQL
						<input type="radio" id="interest" name="interest" value="4">기타
					<%}else{%>
						<input type="radio" id="interest" name="interest" value="2">CSS
						<input type="radio" id="interest" name="interest" value="3">MYSQL
						<input type="radio" id="interest" name="interest" value="4" checked>기타
					<%}%>
				</div>
			</div>
			<div id="intcheck" style="height:15px;color:red"></div>
			<div style="padding-top:10px;"><button class="join_button1">수정하기</button></div>
		</div>
	</form>
</div>
<div height=20>&nbsp;</div>

<%@include file="/include/footer.jsp"%>