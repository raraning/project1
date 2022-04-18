<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%> 

<br>
<div style="width:1890px;">
	<div class="indexmain imempty"></div>
	<div class="indexmain"  style="border-bottom:1px solid black;">
		<%
		if(session_id != null && session_id != ""){%>
			
		<div class="indexbbs">
			<div style="height:15px"> </div>
			<div style="background-color:black;color:white"><b>CSS지식공유 게시판 미리보기</b></div>
			<div style="height:15px"> </div>
			<%
			//일반,비밀
			String sql = "select * from noticecss where gongji != '1' order by fid desc, thread asc limit 6";
			
			Connection conn=DriverManager.getConnection(url, user, password);
			Statement stmt=conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			String nickname = "";
			String subject = "";
			
			while(rs.next()){
				int uid = rs.getInt("uid");
				subject = rs.getString("subject");
				nickname = rs.getString("nickname");
				
				int len_subject = subject.length();
				if(len_subject > 20){
					subject = subject.substring(0,20) + "......";
				}else{
					subject = subject;
				}
				
				String thread = rs.getString("thread");
				int len_thread = thread.length();
				
			
			%>
			<div><a href="bbs/view.jsp?code=noticecss&uid=<%=uid%>&page_now=1&field=&search=">&nbsp;<%=nickname%> |<b>&nbsp;&nbsp;<%=subject%>&nbsp;</b></a></div>
			
			<%}
			rs.close();
			stmt.close();
			conn.close();%>
			<div style="height:15px"> </div>
		</div>
		<div style="height:2px;"></div>
		<div class="indexbbs">
			<div style="height:15px"> </div>
			<div style="background-color:black;color:white"><b>MYSQL지식공유 게시판 미리보기</b></div>
			<div style="height:15px"> </div>
			<%
			//일반,비밀
			String sql2 = "select * from noticesql where gongji != '1' order by fid desc, thread asc limit 6";
			
			Connection conn2=DriverManager.getConnection(url, user, password);
			Statement stmt2=conn2.createStatement();
			ResultSet rs2 = stmt2.executeQuery(sql2);
			
			String nickname2 = "";
			String subject2 = "";
			
			while(rs2.next()){
				int uid = rs2.getInt("uid");
				subject2 = rs2.getString("subject");
				nickname2 = rs2.getString("nickname");
				
				int len_subject = subject2.length();
				if(len_subject > 20){
					subject2 = subject2.substring(0,20) + "......";
				}else{
					subject2 = subject2;
				}
				
				String thread = rs2.getString("thread");
				int len_thread = thread.length();
			
			%>
			<div><a href="bbs/view.jsp?code=noticesql&uid=<%=uid%>&page_now=1&field=&search=">&nbsp;<%=nickname2%> |<b>&nbsp;&nbsp;<%=subject2%>&nbsp;</b></a></div>
			<%}
			rs2.close();
			stmt2.close();
			conn2.close();%>
			<div style="height:15px"> </div>
		</div>
		<div style="height:2px;"></div>
		<div class="indexbbs" style="border-bottom:1px solid black;">
			<div style="height:15px"> </div>
			<div style="background-color:black;color:white"><b>잡담게시판 미리보기</b></div>
			<div style="height:15px"> </div>
			<%
			//일반,비밀
			String sql3 = "select * from notice where gongji != '1' and gongji !='3' order by uid desc limit 6";
			
			Connection conn3=DriverManager.getConnection(url, user, password);
			Statement stmt3=conn3.createStatement();
			ResultSet rs3 = stmt3.executeQuery(sql3);
			
			String nickname3 = "";
			String subject3 = "";
			
			while(rs3.next()){
				int uid = rs3.getInt("uid");
				subject3 = rs3.getString("subject");
				nickname3 = rs3.getString("nickname");
				
				int len_subject = subject3.length();
				if(len_subject > 20){
					subject3 = subject3.substring(0,20) + "......";
				}else{
					subject3 = subject3;
				}
				
				String thread = rs3.getString("thread");
				int len_thread = thread.length();
			
			%>
			<div><a href="bbs_freetalk/ft_view.jsp?uid=<%=uid%>&page_now=1&field=&search=">&nbsp;<%=nickname3%> |<b>&nbsp;&nbsp;<%=subject3%>&nbsp;</b></a></div>
			<%}
			rs3.close();
			stmt3.close();
			conn3.close();%>
			<div style="height:15px;"> </div>
		</div>
	</div>
	<div class="indexmain" style="width:2px;"></div>
	<div class="indexmain">
		<div class="indexbbs">
			<div style="height:15px"> </div>
			<div style="background-color:black;color:white"><b>CSS질문&답변 게시판 미리보기</b></div>
			<div style="height:15px"> </div>
			<%
			//일반,비밀
			String sql4 = "select * from qnacss where gongji != '1' order by fid desc, thread asc limit 6";
			
			Connection conn4=DriverManager.getConnection(url, user, password);
			Statement stmt4=conn4.createStatement();
			ResultSet rs4 = stmt4.executeQuery(sql4);
			
			String nickname4 = "";
			String subject4 = "";
			
			while(rs4.next()){
				int uid = rs4.getInt("uid");
				subject4 = rs4.getString("subject");
				nickname4 = rs4.getString("nickname");
				
				int len_subject = subject4.length();
				if(len_subject > 20){
					subject4 = subject4.substring(0,20) + "......";
				}else{
					subject4 = subject4;
				}
				
				String thread = rs4.getString("thread");
				int len_thread = thread.length();
			
			%>
			<div><a href="bbs/view.jsp?code=qnacss&uid=<%=uid%>&page_now=1&field=&search=">&nbsp;<%=nickname4%> |<b>&nbsp;&nbsp;<%=subject4%>&nbsp;</b></a></div>
			<%}
			rs4.close();
			stmt4.close();
			conn4.close();%>
			<div style="height:15px"> </div>
		</div>
		<div style="height:2px;"></div>
		<div class="indexbbs">
			<div style="height:15px"> </div>
			<div style="background-color:black;color:white"><b>MYSQL질문&답변 게시판 미리보기</b></div>
			<div style="height:15px"> </div>
			<%
			//일반,비밀
			String sql5 = "select * from qnasql where gongji != '1' order by fid desc, thread asc limit 6";
			
			Connection conn5=DriverManager.getConnection(url, user, password);
			Statement stmt5=conn5.createStatement();
			ResultSet rs5 = stmt5.executeQuery(sql5);
			
			String nickname5 = "";
			String subject5 = "";
			
			while(rs5.next()){
				int uid = rs5.getInt("uid");
				subject5 = rs5.getString("subject");
				nickname5 = rs5.getString("nickname");
				
				int len_subject = subject5.length();
				if(len_subject > 20){
					subject5 = subject5.substring(0,20) + "......";
				}else{
					subject5 = subject5;
				}
				
				String thread = rs5.getString("thread");
				int len_thread = thread.length();
			
			%>
			<div><a href="bbs/view.jsp?code=qnasql&uid=<%=uid%>&page_now=1&field=&search=">&nbsp;<%=nickname5%> |<b>&nbsp;&nbsp;<%=subject5%>&nbsp;</b></a></div>
			<%}
			rs5.close();
			stmt5.close();
			conn5.close();%>
			<div style="height:15px"> </div>
		</div>
		<div style="height:2px;"></div>
		<div class="indexbbs">
			<div style="height:15px"> </div>
			<div style="background-color:black;color:white"><b>갤러리게시판 미리보기</b></div>
			<div style="height:22px"> </div>
			<div style="width:35px;display:inline-block"> </div>
			<%
			//일반,비밀
			String sql6 = "select * from gallery where gongji != '1' order by fid desc, thread asc limit 3";
			
			Connection conn6=DriverManager.getConnection(url, user, password);
			Statement stmt6=conn6.createStatement();
			ResultSet rs6 = stmt6.executeQuery(sql6);
			
			String nickname6 = "";
			String subject6 = "";
			
			while(rs6.next()){
				int uid = rs6.getInt("uid");
				subject6 = rs6.getString("subject");
				nickname6 = rs6.getString("nickname");
				
				int len_subject = subject6.length();
				if(len_subject > 5){
					subject6 = subject6.substring(0,5) + "......";
				}else{
					subject6 = subject6;
				}
				
				String thread = rs6.getString("thread");
				int len_thread = thread.length();
				String file1_s = rs6.getString("file1_s");
			
			%>
			<div style="display:inline-block">
				<a href="bbs_img/view.jsp?code=gallery&uid=<%=uid%>&page_now=1&field=&search=">
				<img src="/upload/<%=file1_s%>" width=100 height=70>
				</a>
				<div style="text-align:center"><b><%=subject6%></b></div>
				<div style="text-align:center"><%=nickname6%></div>
			</div>
			<div style="width:15px;display:inline-block"> </div>
			<%}
			rs6.close();
			stmt6.close();
			conn6.close();%>
			<div style="height:17px;border-bottom:1px solid black"> </div>
		</div>
	</div>
	<%}else{%>
	<div style="display:inline-block;"><img src="img/mainimg.jpg" width=845 height=606 title="로그인하시면 게시판미리보기가 보입니다"></div>
	<%} %>
	<div class="indexmain" style="width:50px;"></div>
<!-- 메인페이지 오른쪽 시작 -->
	<div class="indexmain imright">
		<div style="height:15px"> </div>
		<div class="mrtop">Today's Code</div>
		<div style="height:15px"> </div>
		<div class="mainright mrcontent1">Study Type = "CSS"</div>
		<div style="height:15px"> </div>
		<div style="width:606px;">
			<div class="mainright mrcontent2">
				<div class="mrcontentin">HTML</div>
				<div style="text-align:left;font-size:11px">
					&lt;div class="blink"><br>
					&nbsp;&nbsp;&nbsp;☆★☆★☆★☆★☆★☆★&lt;br><br>
					&nbsp;&nbsp;&nbsp;글자가 깜빡이는 효과&lt;br><br>
					&nbsp;&nbsp;&nbsp;깜빡깜빡&lt;br><br>
					&nbsp;&nbsp;&nbsp;☆★☆★☆★☆★☆★☆★<br>
					&lt;/div>
				</div>
			</div>
			<div class="mainright mrcontent21">
				<div class="mrcontentin">CSS</div>
				<div style="text-align:left;font-size:11px">
					&lt;style><br>
					&nbsp;&nbsp;&nbsp;@keyframes blink-effect { <br>
					&nbsp;&nbsp;&nbsp;50% { <br>
								&nbsp;&nbsp;&nbsp;opacity: 0; <br>
							&nbsp;&nbsp;&nbsp;} <br>
					&nbsp;&nbsp;&nbsp;	} <br>
						&nbsp;&nbsp;&nbsp;.blink { <br>
						&nbsp;&nbsp;&nbsp;	animation: blink-effect 1s step-end infinite;<br>
					&nbsp;&nbsp;&nbsp;		font-weight:bold;<br>
						&nbsp;&nbsp;&nbsp;	font-size:25px;<br>
					&nbsp;&nbsp;&nbsp;		color:#ffb0ae;<br>
					&nbsp;&nbsp;&nbsp;		padding-top:60px;<br>
					&nbsp;&nbsp;&nbsp;	}<br>
					&lt;/style>
				</div>
			</div>
		</div>
		<div style="height:15px"> </div>
		<div class="mainright mrcontent3">
			<div class="mrcontentin">Result</div>
			<style>
				@keyframes blink-effect { 
					50% { 
						opacity: 0; 
					} 
				} 
				.blink { 
					animation: blink-effect 1s step-end infinite;
					font-weight:bold;
					font-size:25px;
					color:#ffb0ae;
					padding-top:60px;
				}
			</style>
			<div class="blink">
				☆★☆★☆★☆★☆★☆★<br>
				글자가 깜빡이는 효과<br>
				깜빡깜빡<br>
				☆★☆★☆★☆★☆★☆★
			</div>
		</div>
	</div>
	<div class="indexmain imempty"></div>
</div>
<br>
<%@include file="/include/footer.jsp"%>
