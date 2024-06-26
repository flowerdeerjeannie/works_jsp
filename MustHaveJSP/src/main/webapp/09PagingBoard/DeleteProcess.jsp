<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
String num=request.getParameter("num");
BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO(application);
dto = dao.selectView(num); //num을 넣어가지고 그 넘버에 해당하는 기존 게시물을 얻어낸다.
 
String sessionId = session.getAttribute("UserId").toString(); //현재로그인사용자아디 

int delResult = 0;

if(sessionId.equals(dto.getId())){ //작성자 본인인지 확인하는과정. 
	dto.setNum(num);
	delResult=dao.deletePost(dto); //삭제. dao는 이 메서드들을 다 가지고있는 메서드용객체고 dto는 진짜객체 
	dao.close();
	
	if (delResult==1){
		JSFunction.alertLocation("삭제되었습니다.","List.jsp", out);
	} else {
		JSFunction.alertBack("삭제에 실패하였습니다.",out);
	}
}
else {
	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
	
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>