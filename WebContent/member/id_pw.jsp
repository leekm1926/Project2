<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp"%>

<script>
	$(function() {
		$('#pwsearch').click(function() {
			$.get('./pwsearch.jsp', {
				'id' : $('#pw_id').val(),
				'name' : $('#pw_name').val(),
				'email' : $('#pw_email').val()
			}, function(data) {
				alert(data);
			})
		});
	});
</script>
<body>
	<center>
		<div id="wrap">
			<%@ include file="../include/top.jsp"%>

			<img src="../images/member/sub_image.jpg" id="main_visual" />

			<div class="contents_box">
				<div class="left_contents">
					<%@ include file="../include/member_leftmenu.jsp"%>
				</div>
				<div class="right_contents">
					<div class="top_title">
						<img src="../images/member/id_pw_title.gif" alt=""
							class="con_title" />
						<p class="location">
							<img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;아이디/비밀번호찾기
						<p>
					</div>
					<div class="idpw_box">
						<div class="id_box">
							<form action="../member/idsearch.jsp">
								<ul>
									<li><input type="text" name="id_name" value=""
										class="login_input01" /></li>
									<li><input type="text" name="id_email" value=""
										class="login_input01" /></li>
								</ul>
								<button type="submit" style="border: 0">
									<img src="../images/member/id_btn01.gif" class="id_btn" />
								</button>
								<a href="../member/join02.jsp"><img
									src="../images/login_btn03.gif" class="id_btn02" /></a>
							</form>
						</div>
						<div class="pw_box">
							<ul>
								<li><input type="text" id="pw_id" value=""
									class="login_input01" /></li>
								<li><input type="text" id="pw_name" value=""
									class="login_input01" /></li>
								<li><input type="text" id="pw_email" value=""
									class="login_input01" /></li>
							</ul>
							<button id="pwsearch"><img
								src="../images/member/id_btn01.gif" class="pw_btn" /></button>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="../include/quick.jsp"%>
		</div>


		<%@ include file="../include/footer.jsp"%>
	</center>
</body>
</html>
