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
String uid = multi.getParameter("uid");
String page_now = multi.getParameter("page_now");
String field = multi.getParameter("field");
String search = multi.getParameter("search");

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
  	    int thumbWidth = 170 ;//썸네일 가로
  	    int thumbHeight = 136 ;//썸네일 세로

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

	String sql;

	if(file1_name != null && file1_name != ""){//첨부파일 존재
		sql = "update notice set file1='"+file1_rename+"', file1_o='"+file1_name+"', file1_s='"+thum_img+"', gongji='"+gongji+"',subject='"+subject+"',comment='"+comment+"' where uid="+uid+"";

	}else{
		sql = "update notice set gongji='"+gongji+"',subject='"+subject+"',comment='"+comment+"' where uid="+uid+"";
	}
	//out.print(sql);

	//밑 3줄은 select를 제외한 나머지(insert,update,delete)에서 사용, 규칙
	Connection conn=DriverManager.getConnection(url, user, password);
	Statement stmt=conn.createStatement();
	stmt.executeUpdate(sql);
%>

<script>
	alert("글수정이 완료되었습니다");
	location.href="ft_view.jsp?uid=<%=uid%>&page_now=<%=page_now%>&field=<%=field%>&search=<%=search%>";
</script>