<%@page import="com.bdi.erp.common.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>

<body>

<%
String uiNo= request.getParameter("uiNo");
String uiName= request.getParameter("uiName");
String uiId= request.getParameter("uiId");
String uiPwd= request.getParameter("uiPwd");
String uiDesc= request.getParameter("uiDesc");
String uiAge= request.getParameter("uiAge");
String diNo= request.getParameter("diNo");
out.print(uiNo);
Connection con =DBConnection.getCon();
String sql ="Update user_info";
sql += " set uiName=?, uiId=?,uiPwd=?, uiDesc=?,uiAge=?,diNo=?";
sql+="where uiNo=?";
PreparedStatement ps =con.prepareStatement(sql);
ps.setString(1,uiName);
ps.setString(2,uiId);
ps.setString(3,uiPwd);
ps.setString(4,uiDesc);
ps.setString(5,uiAge);
ps.setString(6,diNo);
ps.setString(7,uiNo);
ResultSet rs =ps.executeQuery();

%>

<script>

		location.href="<%=rPath%>/views/userinfo/userList.jsp";
	
</script>

</body>
</html>