<%@page import="com.bdi.erp.common.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>

<body>

<%
String tNo= request.getParameter("tNo");
String tId= request.getParameter("tId");
String tPwd= request.getParameter("tPwd");
String tBirth= request.getParameter("tBirth");
String tContent= request.getParameter("tContent");

out.print(tNo);
Connection con =DBConnection.getCon();
String sql ="Update Test";
sql += " set tId=?,tPwd=?, tBirth=?,tContent=?";
sql+="where tNo=?";
PreparedStatement ps =con.prepareStatement(sql);
ps.setString(1,tId);
ps.setString(2,tPwd);
ps.setString(3,tBirth);
ps.setString(4,tContent);
ps.setString(5,tNo);
ResultSet rs =ps.executeQuery();

%>

<script>

		location.href="<%=rPath%>/views/userinfo2/testList.jsp";
	
</script>

</body>
</html>