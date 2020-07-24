<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ruby.contact.domain.*" %>
<%@ page import="com.ruby.contact.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String status = "ok";
	String message = "";
	
	if (request.getMethod().equals("POST")) {
		long no = 0;
		try {
			no = Long.parseLong(request.getParameter("no"));
		} catch (Exception e) {}
		
		int count = SampleDAO.deleteContact(no);
		if (count == 1) {
			status = "OK";
			message = "일련번호 " + no + "번 데이터가 삭제되었습니다.";
		} else {
			status = "fail";
			message = "삭제하려는 데이터가 존재하지 않습니다";
		}
	} else {
		status = "fail";
		message = "POST 메서드만 지원합니다.";
	}
%>
{
	"status" : "<%=status %>",
	"message" : "<%=message %>"
}
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>