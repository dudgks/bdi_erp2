<%@page import="com.bdi.erp.common.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>

<body>

<%
int tNo= Integer.parseInt(request.getParameter("tNo"));
Connection con =DBConnection.getCon();
String sql ="delete from Test";
sql+=" where tNo=?";
PreparedStatement ps =con.prepareStatement(sql);
ps.setInt(1,tNo);
ResultSet rs =ps.executeQuery();

%>


<script>

		location.href="<%=rPath%>/views/userinfo2/testList.jsp";
	
</script>
</body>
</html>