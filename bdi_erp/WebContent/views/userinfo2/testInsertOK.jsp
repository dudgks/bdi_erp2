
<%@page import="com.bdi.erp.common.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%

String tId = request.getParameter("tId");
String tPwd = request.getParameter("tPwd");
String tBirth = request.getParameter("tBirth");
tBirth= tBirth.replaceAll("-","");
String tContent = request.getParameter("tContent");
//config
//db.properties



Connection con = DBConnection.getCon();

String sql= "insert into Test(tId,tPwd,tBirth,tContent)";
sql+="value(?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,tId);
ps.setString(2,tPwd);
ps.setString(3,tBirth);
ps.setString(4,tContent);

int cnt =ps.executeUpdate();
DBConnection.close();


if(cnt==1){
%>
<script>
	alert("유저등록이 완료되었습니다.");
	location.href="<%=rPath%>/views/userinfo2/testList.jsp";
</script>
<%
}
%>



