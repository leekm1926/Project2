<%@page import="model.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
  String id = request.getParameter("id");
  MembershipDAO dao = new MembershipDAO();
  boolean result = dao.idcheck(id);
  
  if(result){
  %>
  <center>
	<br /><br />
	<h2>이미 사용중인 아이디입니다</h2>
</center>
<%}else{ %>
  <center>
	<br /><br />
	<h2> <%=id %> 사용할수 있는 아이디입니다</h2>
</center>
<%} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id_overapping2.jsp</title>
</head>
<script type="text/javascript">
function idU() {
	self.close();
}
function idUse() {
	var str =document.getElementsByName("id")[0];
	var spanTag = document.getElementById("span");
	
	console.log(str.value);
	
    var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/;
    var idReg = /[a-zA-Z]/g;
    var idReg2 = /^[0-9]/g; //는 숫자로 시작하는 아이디 판별
    var idReg3 = /^[a-zA-Z]/g;
    var idReg4 = /[0-9]/g;
//     var res = str.split();
 	//중복체크를 누를때 입력된 아이디가 없다면 ....
    	 if(str.value==""){
     	//경고장을 띄우고....
        spanTag.innerHTML="아이디를 입력후 중복확인을 누르세요" ;
 
     	}
    	 else if(specialCheck.test(str.value)==true){
    	   spanTag.innerHTML="특수문자는 사용할수없습니다";
    		return false;
     	}
    	
 	
    	 else if(str.value.search(/\s/)!=-1){
    		 spanTag.innerHTML="공백은 사용할수 없습니다";
    		 return false;
     	}
    	 else if(str.value.length>11){
    		 spanTag.innerHTML="12자를 넘을수 없습니다";
    		 return false;
    	 }
    	 else if(str.value.length<4){
    		 spanTag.innerHTML="4자 이상이어야 합니다";
    		 return false;
    	 }
    	 else if(!idReg.test(str.value)){
    		 spanTag.innerHTML="영어만 사용 가능합니다";
    		 return false;
    	 }
      	else if(idReg2.test(str.value)){
      		spanTag.innerHTML="첫글자는 영어만사용가능합니다";
      		return false;
        }
    	 else if(!idReg3.test(str.value)){
    		 spanTag.innerHTML="영어만 사용가능합니다";
    		 return false;
    	 }
    	 else if(!idReg4.test(str.value)){
    		 spanTag.innerHTML="숫자하나이상 포함해야합니다";
    		 return false;
         }  
    	 else{
    		 <%
    		 
    		  boolean result2 = dao.idcheck(id);
    		  
    		  if(result){
    		  %>
    	
    		  spanTag.innerHTML="이미사용중인 아이디입니다";
    	
    		<%}else{ %>
 
    			spanTag.innerHTML= " <%=id %>사용가능합니다 ";

    		<%} %>
    	 }
 	location.href='./id_overapping2.jsp?id='+str.value;
	
}
function idUse1() {
	
		opener.document.registFrm.id.value=
					document.overlapFrm.id.value;
		opener.document.getElementsByName("id")[0].readOnly = true;
		
		self.close();
}


</script>
<body>
	<form name="overlapFrm">
	<input type="text" value="<%=request.getParameter("id") %>" name="id" size="20" />
	
	<input type="button" value="중복확인" onclick="idUse();" />
	<input type="button" value="아이디사용하기" onclick="idUse1();" />
	<br />
	<span id="span" style="color: red;"> </span>
	</form>
</body>
</html>