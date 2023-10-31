<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String t1=request.getParameter("t1");
	String t2=request.getParameter("t2");
	System.out.println("t1 : "+t1);
	System.out.println("t2 : "+t2);
	String[] val=request.getParameterValues("chk");
	if(val !=null){
		for(String value:val){
			System.out.println("chk : "+value);		
		}
	}
	
	String rao=request.getParameter("rao");
	System.out.println("radio : "+rao);
%>
</body>
</html>