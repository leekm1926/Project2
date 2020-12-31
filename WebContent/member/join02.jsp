<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<script type="text/javascript">


function email_input(s,no){
    form = document.registFrm;
    sel = s[s.selectedIndex].value;
    dis = 1;
 
    if(sel=="user"){
        sel = "";
        dis = 0;
    }
 
    if(no==1){
        form.email_2.value = sel;
        form.email_2.disabled = dis;
    }
    
}

</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function zipFind() {
            new daum.Postcode({
                oncomplete: function (data) {
                    //daum우편번호 API가 전달해주는 값을 콘솔에 입력
                    console.log(data.zonecode);
                    console.log(data.address);
                    console.log(data.sido);
                    console.log(data.sigungu);

                    //가입폼에 적용하기
                    var f = document.registFrm;
                    f.zip2.value = data.zonecode;
                    f.addr1.value = data.address;
                    f.addr2.focus();
                }
            }).open();
        }
        </script>
<script>
var isValidate = function(frm){
	 var num = /[0-9]/g;
	 var spc = /[~!@#$%^&*()_+|<>?:{}]/g;  
	
	if(frm.name.value==''){
         alert('이름을 입력해주세요');
         frm.name.focus();
         return false;
     }
    if(frm.id.value==''){
         alert('아이디를 입력해주세요');
         frm.id.focus();
         return false;
     }  
     if(!frm.pass.value || !frm.pass2.value){
         alert('패스워드를 입력해주세요');
         return false;
    } 
     if(!num.test(frm.pass.value)){
     	alert("숫자가 하나이상 포함되어야합니다");
     	return false;
     }
     
    if(frm.pass.value.length>11){
    	   alert("비밀번호는 12자를 넘을수없습니다");
    	   return false;
    	   }
    		 
    	    if(frm.pass.value.length<4){
    	   alert("비밀번호는 4자 이상어야합니다");
    	   return false;
    	   }
     if(frm.pass.value != frm.pass2.value){
         alert("입력한 패스워드가 일치하지않습니다");
         frm.pass.value="";
         frm.pass2.value="";
         frm.pass.focus();
         return false;
    }
     if(!frm.tel1.value || !frm.tel2.value || !frm.tel3.value){
         alert('전화번호를 입력해주세요');
         return false;
     }
     if(!frm.mobile1.value || !frm.mobile2.value || !frm.mobile3.value){
         alert('휴대폰번호를 입력해주세요');
         return false;
     }
     if(!frm.email_1.value || !frm.email_2.value){
         alert('이메일주소 입력해주세요');
         return false;
     }
     if(!frm.zip2.value){
         alert('주소를 입력해주세요');
         return false;
     }
     if(!frm.addr1.value){
         alert('주소를 입력해주세요');
         return false;
     }
     if(!frm.addr2.value){
         alert('주소를 입력해주세요');
         return false;
     }
     
     if(frm.over.value!="중복확인완료"){
    	 alert("중복체크를 하지않았습니다");
    	 return false;
     }
     
     if(frm.id.readOnly == false){
    	 alert("중복체크를 하지않았습니다");
    	 return false;
     }
     
 

}
</script>
<script type="text/javascript">
	
function id_check_person(fn) {
	

	 var str = fn.id.value;
	 var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/;
	 var idReg = /[a-zA-Z]/g;
    var idReg2 = /^[0-9]/g; //는 숫자로 시작하는 아이디 판별
    var idReg3 = /^[a-zA-Z]/g;
    var idReg4 = /[0-9]/g;
   
    
    
    if(fn.id.value==""){
    	//경고장을 띄우고....
        alert("아이디를 입력후 중복확인을 누르세요");
        //포커스를 이동한다.
    	fn.id.focus();
    }
	 
	 else if(!idReg4.test(str)){
         alert("숫자를 포함해야합니다");
         //포커스를 이동한다.
     	fn.id.focus();
     	}
   else if(specialCheck.test(str)==true){
    alert("특수문자를 사용할수 없습니다");
    fn.id.focus();
    }
   else if(str.search(/\s/)!=-1){
    alert("공백은 사용 할 수 없습니다");
    fn.id.focus();
    }
	 
   else if(str.length>11){
   alert("아이디는 12자를 넘을수없습니다");
   fn.id.focus();          
   }
	 
   else if(str.length<4){
   alert("아이디는 4자 이상어야합니다");
   fn.id.focus();	 
   }
   else if(!idReg.test(str)){
  	alert("영어만 사용가능합니다");
   fn.id.focus();	 
  	}
   else if(idReg2.test(str)){
   alert("첫글자는 영어만 사용가능합니다");
   fn.id.focus();	 
   } 
   else if(!idReg3.test(str)){
  	alert("영어만 사용가능합니다");
   fn.id.focus();	 
  	}
   
  	
   else{
	   fn.over.value = "중복확인완료";
       window.open("id_overapping2.jsp?id="+fn.id.value,
       "idover","width=500, height=300");
   }
	
	
}
</script>
 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/join_tit.gif" alt="회원가입" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;회원가입<p>
				</div>

				<p class="join_title"><img src="../images/join_tit03.gif" alt="회원정보입력" /></p>
				<table cellpadding="0" cellspacing="0" border="0" class="join_box">
					<colgroup>
						<col width="80px;" />
						<col width="*" />
					</colgroup>
					<tr>
						<th><img src="../images/join_tit001.gif" /></th>
						<td><input type="text" name="name" value="" class="join_input" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit002.gif" /></th>
						<td><input type="text" name="id"  value="" class="join_input" />&nbsp;<a onclick="id_check_person();" style="cursor:hand;"><img src="../images/btn_idcheck.gif" alt="중복확인"/></a>&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit003.gif" /></th>
						<td><input type="password" name="pass" value="" class="join_input" />&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit04.gif" /></th>
						<td><input type="password" name="pass2" value="" class="join_input" /></td>
					</tr>
					

					<tr>
						<th><img src="../images/join_tit06.gif" /></th>
						<td>
							<input type="text" name="tel1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="tel2" value="" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="tel3" value="" maxlength="4" class="join_input" style="width:50px;" />
						</td>
					</tr>
					<tr>
						<th><img src="../images/join_tit07.gif" /></th>
						<td>
							<input type="text" name="mobile1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="mobile2" value="" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="mobile3" value="" maxlength="4" class="join_input" style="width:50px;" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit08.gif" /></th>
						<td>
 
	<input type="text" name="email_1" style="width:100px;height:20px;border:solid 1px #dadada;" value="" /> @ 
	<input type="text" name="email_2" style="width:150px;height:20px;border:solid 1px #dadada;" value="" readonly />
	<select name="last_email_check2" onChange="email_input(this);" class="pass" id="last_email_check2" >
		<option selected="" value="">선택해주세요</option>
		<option value="1" >직접입력</option>
		<option value="dreamwiz.com" >dreamwiz.com</option>
		<option value="empal.com" >empal.com</option>
		<option value="empas.com" >empas.com</option>
		<option value="freechal.com" >freechal.com</option>
		<option value="hanafos.com" >hanafos.com</option>
		<option value="hanmail.net" >hanmail.net</option>
		<option value="hotmail.com" >hotmail.com</option>
		<option value="intizen.com" >intizen.com</option>
		<option value="korea.com" >korea.com</option>
		<option value="kornet.net" >kornet.net</option>
		<option value="msn.co.kr" >msn.co.kr</option>
		<option value="nate.com" >nate.com</option>
		<option value="naver.com" >naver.com</option>
		<option value="netian.com" >netian.com</option>
		<option value="orgio.co.kr" >orgio.co.kr</option>
		<option value="paran.com" >paran.com</option>
		<option value="sayclub.com" >sayclub.com</option>
		<option value="yahoo.co.kr" >yahoo.co.kr</option>
		<option value="yahoo.com" >yahoo.com</option>
	</select>
	 
						<input type="checkbox" name="open_email" value="1">
						<span>이메일 수신동의</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit09.gif" /></th>
						<td>
						<input type="text" name="zip1" value=""  class="join_input" style="width:50px;" />&nbsp;-&nbsp;
						<input type="text" name="zip2" value=""  class="join_input" style="width:50px;" />
						<a href="javascript:;" title="새 창으로 열림" onclick="zipFind('zipFind', '<?=$_Common[bbs_path]?>member_zipcode_find.php', 590, 500, 0);" onkeypress="">[우편번호검색]</a>
						<br/>
						
						<input type="text" name="addr1" value=""  class="join_input" style="width:550px; margin-top:5px;" /><br>
						<input type="text" name="addr2" value=""  class="join_input" style="width:550px; margin-top:5px;" />
						
						</td>
					</tr>
				</table>

				<p style="text-align:center; margin-bottom:20px"><a href="join02.jsp"><img src="../images/btn01.gif" /></a>&nbsp;&nbsp;<a href="#"><img src="../images/btn02.gif" /></a></p>
				
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
