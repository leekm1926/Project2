<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="smtp.SMTPAuth"%>
<%@page import="util.JavascriptUtil"%>
<%@page import="model.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String email = request.getParameter("email");

MembershipDAO dao = new MembershipDAO();

String pw_check = dao.searchPw(id, name, email);
String alert = "";
dao.close();
if (!pw_check.equals("")) {
	SMTPAuth smtp = new SMTPAuth();

	String mailContents = "<h1>회원님의 비밀번호는 "+pw_check+"입니다.</h1>"; 
		
	//메일을 보내기위한 여러가지 폼값을 Map컬렉션에 저장
	Map<String,String> emailContent = new HashMap<String,String>();
	emailContent.put("from", "leekm0926@naver.com");
	emailContent.put("to", email);
	emailContent.put("subject", "화곡멋쟁이 비밀번호");
	//emailContent.put("content", request.getParameter("content"));
	emailContent.put("content", mailContents);

	//내용이 null값이 아니라면 이메일 발송
	
		boolean emailResult = smtp.emailSending(emailContent);
		if(emailResult==true){
			alert = "메일로 비밀번호가 발송되었습니다.";
			out.print(alert);
		}
		else{
			alert = "메일발송실패";
			out.print(alert);
		}
	}


else {
	alert = "가입된 회원정보가 없습니다.";
			out.print(alert);
}
%>
