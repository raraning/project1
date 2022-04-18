<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<%
request.setCharacterEncoding("utf-8");

String uploadPath="C:\\jsp\\project01_aran\\src\\main\\webapp\\upload";

int size=10*1024*1024; //용량10mb

String file1=""; //form으로 넘어온 이름
String file1_name=""; //원본 이름
String file1_rename=""; //재설정한 이름
String thum_img = ""; //썸네일 이름

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());

String code = multi.getParameter("code");
String gongji = multi.getParameter("gongji");
String subject = multi.getParameter("subject");
String comment = multi.getParameter("comment");

Enumeration files = multi.getFileNames();

file1=(String)files.nextElement();
file1_name=multi.getOriginalFileName(file1);
file1_rename=multi.getFilesystemName(file1);

if(file1_name != null){ //썸네일 생성 공간
	   
	String filePath = uploadPath; //저장 공간 경로 설정
    String orgImg = filePath+"\\"+file1_rename; //리네임처리된 첨부파일
    
    //확장자 찾기
	int pos = orgImg.lastIndexOf( "." );
 	String fileExt = orgImg.substring( pos + 1 );
 	
 	
  	if(fileExt.equals("gif") || fileExt.equals("jpg") || fileExt.equals("png")){
  		thum_img = "thum_"+file1_rename; //썸네일 파일 이름
  	    String thumbImg = filePath+"\\"+thum_img;//썸네일파일
  	    int thumbWidth = 100 ;//썸네일 가로
  	    int thumbHeight = 40 ;//썸네일 세로

 	    Image thumbnail = JimiUtils.getThumbnail(orgImg, thumbWidth, thumbHeight, Jimi.IN_MEMORY);// 썸네일 설정
  	    Jimi.putImage(thumbnail, thumbImg);// 썸네일 생성	
  	}
}else{
	file1_name = "";
	file1_rename = "";
}


//현재 시간
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String today = sf.format(nowTime);
	
	//답변 fid 값 설정
	String sql_fid = "select max(fid) as fid_max from "+code+" ";

	Connection conn_count=DriverManager.getConnection(url, user, password);
	Statement stmt_count=conn_count.createStatement();
	ResultSet rs_count=stmt_count.executeQuery(sql_fid);

	int fid = 1; //default = 1 처리
	if(rs_count.next()){
		if(rs_count.getInt("fid_max") > 0){ //작성된 글이 있는 경우
			fid = rs_count.getInt("fid_max") + 1;
		}else{ //작성된 글이 없다면
			fid = 1;
		}
	}

String sql = "insert into "+code+" (id,name,nickname,level,gongji,subject,comment,signdate,file1,file1_o,file1_s,fid,thread) values('"+session_id+"','"+session_name+"','"+session_nickname+"','"+session_level+"','"+gongji+"','"+subject+"','"+comment+"','"+today+"','"+file1_rename+"','"+file1_name+"','"+thum_img+"',"+fid+",'A')";

Connection conn=DriverManager.getConnection(url, user, password);
Statement stmt=conn.createStatement();
stmt.executeUpdate(sql);
%>

<script>
	alert("글작성이 완료되었습니다");
	location.href="list.jsp?code=<%=code%>";
</script>