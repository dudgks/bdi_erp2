<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
List<Map<String,String>> userList = new ArrayList<Map<String,String>>();
Map<String,String> user = new HashMap<String,String>();
String driver = "org.mariadb.jdbc.Driver";
String url = "jdbc:mariadb://localhost:3306/bdi";
String id = "root";
String pwd = "12345678";
Class.forName(driver);
Connection con = DriverManager.getConnection(url,id,pwd);
String sql= "select * from user_info";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()){
	user.put("uiName",rs.getString("uiName"));
	user.put("uiId",rs.getString("uiId"));
	user.put("uiPwd",rs.getString("uiPwd"));
	user.put("uiDesc",rs.getString("uiDesc"));
	user.put("uiAge",rs.getString("uiAge"));
	user.put("diNo",rs.getString("diNo"));
	userList.add(user);		
}
%>
<body>
	<div class="container">
		<table class="table table-bordered table-hovered">
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>유저설명</th>
				<th>나이</th>
				<th>부서번호</th>
			<tr>
			<%for(Map<String,String> user1: userList){ %>
			<tr>
				<td><%=user1.get("uiName")%></td>
				<td><%=user1.get("uiId")%></td>
				<td><%=user1.get("uiPwd")%></td>
				<td><%=user1.get("uiDesc")%></td>
				<td><%=user1.get("uiAge")%></td>
				<td><%=user1.get("diNo")%></td>	
			<tr>
			<% }%>
		</table>
	</div>
</body>
</html>