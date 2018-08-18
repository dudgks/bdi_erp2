<%@page import="com.bdi.erp.common.DBConnection"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>

<body>
	<div class="container">
	<%
	String tId = "";
	String tPwd = "";
	String tBirth= "";
	String tContent ="";
	int tNo= Integer.parseInt(request.getParameter("tNo"));
	
	Connection con =DBConnection.getCon();
	String sql ="select tId,tPwd,tBirth,tContent";
	sql+=" diNo from Test";
	sql+=" where tNo=?";
	PreparedStatement ps =con.prepareStatement(sql);
	ps.setInt(1,tNo);
	ResultSet rs =ps.executeQuery();
	if(rs.next()){
		tId=rs.getString("tId");
		tPwd =rs.getString("tPwd");
		tBirth =rs.getString("tBirth");
		tContent =rs.getString("tContent");
	}
	%>
		<form action="<%=rPath%>/views/userinfo2/testUpdateOK.jsp" onsubmit="return checkVal()">
			<fieldset>
				<legend>유저수정</legend>
				<table class="table table-bordered table-hover">
				<tr>
					<th>번호</th>
					<td><%=tNo%></td>
				</tr>
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
						<td><input type="date" name="tBirth"></td>
					</tr>
					<tr>
						<th>설명</th>
						<td><textarea name="tContent"></textarea>
					
					<tr>
						<td colspan="2" align="center">
						<button>수정</button>
						<button type="button" onclick="deleteTest()">삭제</button>
						</td>
					</tr>

				</table>
			</fieldset>
			<input type="hidden" name="tNo" value="<%=tNo%>">
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
	
	function deleteTest(){
		if(confirm("삭제하시겠습니까?")){
			location.href="<%=rPath%>/views/userinfo2/testDeleteOK.jsp?tNo=<%=tNo%>";
		}
	}
</script>
</body>
</html>