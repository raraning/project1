<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String code_title = "게시판";
if(code.equals("noticejsp")){
	code_title = "Jsp지식공유";
}else if(code.equals("qnajsp")){
	code_title = "Jsp질문&답변";
}else if(code.equals("noticecss")){
	code_title = "CSS지식공유";
}else if(code.equals("qnacss")){
	code_title = "CSS질문&답변";
}else if(code.equals("noticesql")){
	code_title = "MYSQL지식공유";
}else if(code.equals("qnasql")){
	code_title = "MYSQL질문&답변";
}else{
	code_title = "갤러리";
}
%>