<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>

<body>
	<div class="container">
		<form action="<%=rPath%>/views/userinfo2/testInsertOK.jsp" onsubmit="return checkVal()">
			<fieldset>
				<legend>유저등록</legend>
				<table class="table table-bordered table-hover">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="tId"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="tPwd"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type name="tBirth"></td>
					</tr>
					<tr>
						<th>설명</th>
						<td><textarea name="tContent"></textarea>
					
					<tr>
						<td colspan="2" align="center">
						<button>회원가입</button>
						</td>
					</tr>

				</table>
			</fieldset>
		</form>
	</div>
<script>
	function checkVal(){
		var objs = document.querySelectorAll('input');
		for(var i=0;i<objs.length;i++){
			if(objs[i].type!="number"){
				if(objs[i].value.length<1 || objs[i].value.length>30){
					alert(objs[i].name + "의 값을 확인해줘.!")
					objs[i].focus();
					return false;
				}
			}else{
				if(objs[i].value<1){
					alert(objs[i].name+"의 값을 확인해주세요.")
					objs[i].focus();
					return false;
				}
			}
		}
		var obj = document.querySelector('textarea');
		if(obj.value.length>=20){
			alert("유저설명이 2000자이상일 순 없습니다.");
			obj.focus();
			return false;
		}
		return true;
	}
	
</script>	
	
</body>
</html>