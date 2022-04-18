<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/admin/include/header.jsp"%>

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
	function join_ok(){
		//아이디 유효성 검사
		var idcheck = document.getElementById("idcheck");
		if(!joinid.value){
			idcheck.innerText = "아이디를 입력하세요";
			idcheck.style.color = "red";
			joinid.focus();
			return false;
		}
		
		if(joinid.value.length < 4){
			idcheck.innerText = "아이디를 4자리 이상 입력하세요";
			idcheck.style.color = "red";
			joinid.focus();
			return false;
		}
		
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
		}else{
			passcheck.innerText = " ";
		}
		
		var passcheck2 = document.getElementById("passcheck2");
		if(password1.value != password2.value){
			passcheck2.innerText = "입력하신 비밀번호가 일치하지 않습니다";
			password1.focus();
			return false;
		}else{
			passcheck.innerText = " ";
		}
		
		
		//닉네임 유효성 검사
		var nicknamecheck = document.getElementById("nicknamecheck");
		if(!nickname.value){
			nicknamecheck.innerText = "닉네임을 입력하세요";
			nickname.focus();
			return false;
		}else{
			nicknamecheck.innerText = " ";
		}
		
		if(nickname.value.length < 2){
			nicknamecheck.innerText = "닉네임을 2자리 이상 입력하세요";
			nickname.focus();
			return false;
		}else{
			nicknamecheck.innerText = " ";
		}
		
		//이름 유효성 검사
		var namecheck = document.getElementById("namecheck");
		if(!membername.value){
			namecheck.innerText = "이름을 입력하세요";
			membername.focus();
			return false;
		}else{
			namecheck.innerText = " ";
		}
		
		if(membername.value.length < 2){
			namecheck.innerText = "이름을 2자리 이상 입력하세요";
			membername.focus();
			return false;
		}else{
			namecheck.innerText = " ";
		}
		
		//생년월일 유효성 검사
		var birthcheck = document.getElementById("birthcheck");
		if(!birth.value){
			birthcheck.innerText = "생년월일을 입력하세요";
			birth.focus();
			return false;
		}else{
			birthcheck.innerText = " ";
		}
		
		//email 유효성 검사
		var mailcheck = document.getElementById("mailcheck");
		if(!email.value){
			mailcheck.innerText = "email을 입력하세요";
			email.focus();
			return false;
		}else{
			mailcheck.innerText = " ";
		}
		
		if(email.value.length < 10){
			mailcheck.innerText = "email을 10자리 이상 입력하세요";
			email.focus();
			return false;
		}else{
			mailcheck.innerText = " ";
		}
		
		if(!email.value.includes("@") || !email.value.includes(".")){
			mailcheck.innerText = "email형식에 맞지않습니다";
			email.focus();
			return false;
		}else{
			mailcheck.innerText = " ";
		}
		
		//개인정보동의 유효성 검사
		var infocheck = document.getElementById("infocheck");
		var info2 = document.getElementById('info').checked;
		if(info2==false){
			infocheck.innerText = "개인정보 수집 및 이용에 동의하여주십시오";
			return false;
		}else{
			infocheck.innerText = " ";
		}
		
		document.submit();
	}
	
	//아이디 중복확인
	function overlapid(){
		var olid = document.getElementById("joinid");
		var olnick = document.getElementById("nickname");
		var name = document.getElementById("membername");
		var birth = document.getElementById("birth");
		var email = document.getElementById("email");
		var idcheck = document.getElementById("idcheck");
		if(!joinid.value){
			alert("아이디입력 후 눌러주세요");
		}else{
			location.href="/admin/member/overlap_id.jsp?joinid="+olid.value+"&nickname="+olnick.value+"&membername="+name.value+"&birth="+birth.value+"&email="+email.value;
		}
		
	}
	
	//닉네임 중복확인
	function overlapnick(){
		var olid = document.getElementById("joinid");
		var olnick = document.getElementById("nickname");
		var name = document.getElementById("membername");
		var birth = document.getElementById("birth");
		var email = document.getElementById("email");
		var idcheck = document.getElementById("idcheck");
		if(!joinid.value){
			alert("아이디 중복확인 후 눌러주세요");
		}else if(!nickname.value){
			alert("닉네임입력 후 눌러주세요");
		}else{
			location.href="/admin/member/overlap_nick.jsp?joinid="+olid.value+"&nickname="+olnick.value+"&membername="+name.value+"&birth="+birth.value+"&email="+email.value;
		}
		
	}

</script>

<div height=20>&nbsp;</div>
<div width=100%>
	<form action="/admin/member/join_insert.jsp?id_ok=<%=id_ok%>&nick_ok=<%=nick_ok%>" method="post" onsubmit="return join_ok()">
	<input type="hidden" id="level" name="level" value="신입개발자">
		<div class="join_top"> 회원가입 </div>
		<div style="height:15px;"> </div>
		<div class="join_main">
			<div><div class="join_menu2">아이디</div>
				<div>
					<input id="joinid" name="joinid" value="<%if(joinid2 != null && joinid2 != ""){%><%=joinid2%><%}else{%><%}%>">&nbsp;
					<span class="join_id_button" onclick="overlapid()">아이디 중복확인</span>
				</div>
			</div>
			<div id="idcheck" style="height:15px;">
			<%
			if(id_ok != null && id_ok != "" && id_ok.equals("Y")){
				out.print("<font color='green'>사용가능한 아이디입니다</font>");
			}else if(id_ok != null && id_ok != "" && id_ok.equals("N")){
				out.print("<font color='red'>존재하는 아이디입니다</font>");
			}else{
				out.print(" ");
			}
			%>
			</div>
			<div class="join_defualt"><div class="join_menu2">닉네임</div>
				<div>
					<input id="nickname" name="nickname" value="<%if(nickname2 != null && nickname2 != ""){%><%=nickname2%><%}else{%><%}%>">&nbsp;
					<span class="join_id_button" onclick="overlapnick()">닉네임 중복확인</span>
				</div>
			</div>
			<div id="nicknamecheck" style="height:15px;">
			<%
			if(nick_ok != null && nick_ok != "" && nick_ok.equals("Y")){
				out.print("<font color='green'>사용가능한 닉네임입니다</font>");
			}else if(nick_ok != null && nick_ok != "" && nick_ok.equals("N")){
				out.print("<font color='red'>존재하는 닉네임입니다</font>");
			}else{
				out.print(" ");
			}
			%>
			</div>
			<div class="join_defualt"><div class="join_menu2">비밀번호</div>
				<div><input type="password" id="password1" name="password1" value=""></div>
			</div>
			<div id="passcheck" style="height:15px;color:red"></div>
			<div class="join_defualt"><div class="join_menu2">비밀번호 재입력</div>
				<div><input type="password" id="password2" name="password2" value=""></div>
			</div>
			<div id="passcheck2" style="height:15px;color:red"></div>
			
			<div class="join_defualt"><div class="join_menu2">이름</div>
				<div><input id="membername" name="membername" value="<%if(name2 != null && name2 != ""){%><%=name2%><%}else{%><%}%>"></div>
			</div>
			<div id="namecheck" style="height:15px;color:red"></div>
			<div class="join_defualt"><div class="join_menu2">생년월일</div>
				<div><input style="width:172px" type="date" id="birth" name="birth" value="<%if(birth2 != null && birth2 != ""){%><%=birth2%><%}else{%><%}%>"></div>
			</div>
			<div id="birthcheck" style="height:15px;color:red"></div>
			<div class="join_defualt"><div class="join_menu2">email</div>
				<div><input id="email" name="email" value="<%if(email2 != null && email2 != ""){%><%=email2%><%}else{%><%}%>"></div>
			</div>
			<div id="mailcheck" style="height:15px;color:red"></div>
			<div class="join_defualt"><div class="join_menu2">관심분야</div>
				<div>
					<input type="radio" id="interest" name="interest" value="1" checked>JSP
					<input type="radio" id="interest" name="interest" value="2">CSS
					<input type="radio" id="interest" name="interest" value="3">MYSQL
					<input type="radio" id="interest" name="interest" value="4">기타
				</div>
			</div>
			<div id="intcheck" style="height:15px;color:red"></div>
			<div class="join_defualt">
				<div class="join_info if1">
					<input type="checkbox" id="info" name="info" value="">
				</div>
				<div class="join_info if2">
					&nbsp;&nbsp;개인정보 수집 및 이용에 동의합니다.
				<script>
					function infopopup(){
						var popup = "join_info.jsp";
						var name = "개인정보 수집 및 이용";
						var popOption = "toolbar=no, menubar=no, scrollbars = yes, resizable = yes, top=10, left=10, width=500, height=600";
						window.open(popup,name,popOption);
					}	
				</script>
					<a href="javascript:void(0);" onclick="infopopup();"><font color="gray">[자세히보기]</font></a>
				</div>
			</div>
			<div id="infocheck" style="height:25px;color:red;float:left;"></div>
			<div style="height:40px;color:red"> </div>
			<div style="padding-top:10px;"><button class="join_button1">회원가입</button></div>
		</div>
	</form>
</div>
<div height=20>&nbsp;</div>

<%@include file="/admin/include/footer.jsp"%>