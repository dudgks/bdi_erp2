<%@page import="com.bdi.erp.common.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>

<body>

<%
int uiNo= Integer.parseInt(request.getParameter("uiNo"));
Connection con =DBConnection.getCon();
String sql ="delete from user_info";
sql+=" where uiNo=?";
PreparedStatement ps =con.prepareStatement(sql);
ps.setInt(1,uiNo);
ResultSet rs =ps.executeQuery();

%>


<script>

		location.href="<%=rPath%>/views/userinfo/userList.jsp";
	
</script>
</body>
</html>