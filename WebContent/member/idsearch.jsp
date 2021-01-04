<%@page import="util.JavascriptUtil"%>
<%@page import="model.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

String name = request.getParameter("id_name");
String email = request.getParameter("id_email");

MembershipDAO dao = new MembershipDAO();

String id_check = dao.searchId(name, email);

dao.close();
if (!id_check.equals("")) {
	JavascriptUtil.jsAlertLocation("아이디:" + id_check, "id_pw.jsp", out);
}

else {
	JavascriptUtil.jsAlertLocation("회원가입 된 정보가 없습니다.", "id_pw.jsp", out);
}
%>
