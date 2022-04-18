<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="/include/basic.css" rel="stylesheet" type="text/css">
<title>Web Study Room-아이디찾기</title>
<style>
	.sidtop{
		text-align:center;
		font-weight:bold;
		font-size:17px;
	}
	.sidmenu{
		display:inline-block;
	}
	.sibutton{
		width:235px;
		font-size:15px;
		font-weight:bold;
		background-color: #eee;
		cursor:pointer;
	}
	.sibutton:hover{
		width:235px;
		font-size:15px;
		font-weight:bold;
		background-color: #888;
		color:#fff;
		cursor:pointer;
	}
</style>

<script>
	function searchid(){
		if(!name2.value){
			alert("이름을 입력해주세요");
			return false;
		}
		if(!nickname.value){
			alert("닉네임을 입력해주세요");
			return false;
		}
		if(!birth.value){
			alert("생년월일을 입력해주세요");
			return false;
		}
		document.submit();
	}
</script>

<div style="height:17px;"> </div>
<div class="sidtop"> 아이디찾기 </div>
<div style="height:15px;"> </div>
<div style="text-align:center">
<form action="/member/search_id_data.jsp" method="post" onsubmit="return searchid();">
	<div>
		<div class="sidmenu sm1">이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		<div class="sidmenu"><input id="name2" name="name" value=""></div>
	</div>
	<div style="height:10px;"> </div>
	<div>
		<div class="sidmenu sm2">닉네임<font color="white">..</font>&nbsp;&nbsp;</div>
		<div class="sidmenu"><input id="nickname" name="nickname" value=""></div>
	</div>
	<div style="height:10px;"> </div>
	<div>
		<div class="sidmenu sm3">생년월일</div>
		<div class="sidmenu"><input style="width:180px;" type="date" id="birth" name="birth" value=""></div>
	</div>
	<div style="height:15px;"> </div>
	<div><button class="sibutton">아이디찾기</button></div>
</form>
</div>
