﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%-- 비로그인 상태의 사용자인 경우 - 사용자로부터 로그인정보를 입력받기 위한 JSP 문서 --%>
<%-- => [로그인] 태그를 클릭한 경우 [/login.do] 페이지 요청 - 입력값 전달 --%>
<%-- 로그인 상태의 사용자인 경우 - 환영메세지를 클라이언트에게 전달하여 응답하는 JSP 문서 --%>
<%-- => [회원목록] 태그를 클릭한 경우 [/list.do] 페이지 요청 --%>
<%-- => [로그아웃] 태그를 클릭한 경우 [/logout.do] 페이지 요청 --%>
<%-- => [회원등록] 태그를 클릭한 경우 [/writeform.do] 페이지 요청 - 관리자에게만 링크 제공 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>MVC</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- 요청 서블릿(컨트롤러)의 URL 주소 경로와 응답하는 JSP 문서의 경로가 서로 다르므로
웹자원의 경로는 절대경로로 표현하는 것을 권장 --%>
<%-- <link rel=stylesheet href="<%=request.getContextPath() %>/model_two/css/user.css" type="text/css"> --%>
<%-- <link rel=stylesheet href="${pageContext.request.contextPath}/model_two/css/user.css" type="text/css"> --%>
<link rel=stylesheet href="<c:url value="/model_two/css/user.css"/>" type="text/css">
<script language="JavaScript">
function userLogin() {
	if ( f.userid.value == "" ) {
		alert("아이디를 입력하십시요.");
		f.userid.focus();
		return;
	} 
	if ( f.password.value == "" ) {
		alert("비밀번호를 입력하십시요.");
		f.password.focus();
		return;
	}	
	
	f.action = "<c:url value="/login.do"/>";
	f.submit();
}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<table width=780 border=0 cellpadding=0 cellspacing=0>
	<tr>
	  <td width="20"></td>
	  <td style="color: red;">${message }</td>			
	</tr>

	<tr>
	  <td width="20"></td>
	  <td>
  	  <!--contents-->
	  <table width=590 border=0 cellpadding=0 cellspacing=0>
		  <tr>
			<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>회원관리 - 로그인</b></td>
		  </tr>
	  </table>  
	  <br>
	  
	  
	  <c:choose>  
		<%-- //비로그인 상태의 사용자인 경우 --%>
		<c:when test="${empty(loginUserinfo) }">   	
		  <!-- login Form  --> 
		  <form name="f" method="post">
		  <table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
			  <tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">사용자 아이디</td>
				<td width=490 bgcolor="ffffff" style="padding-left:10px;">
					<input type="text" style="width:150" name="userid" value="${userid }">
				</td>
			  </tr>
			  <tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
				<td width=490 bgcolor="ffffff" style="padding-left:10px;">
					<input type="password" style="width:150" name="password">
				</td>
			  </tr>
		  </table>
		  </form>
		  <br>
		  
		  <table width=590 border=0 cellpadding=0 cellspacing=0>
			  <tr>
				<td align=center>
					<input type="button" value="로그인" onClick="userLogin();"> &nbsp;
				</td>
			  </tr>
		  </table>
	  	</c:when>
	  	<c:otherwise><%-- 로그인 상태의 사용자인 경우 --%>

		  <table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
			  <tr>
				<td align=center bgcolor="E6ECDE" height="22">
					${loginUserinfo.name}님, 환영합니다.
				</td>
			  </tr>
		  </table>
		  <br>
		  
		  <table width=590 border=0 cellpadding=0 cellspacing=0>
			  <tr>
				<td align=center>
					<button type="button" onclick="location.href='<c:url value="/list.do"/>';">회원목록</button>
					<button type="button" onclick="location.href='<c:url value="/logout.do"/>';">로그아웃</button>
					<c:if test="${loginUserinfo.status == 9 }">
						<button type="button" onclick="location.href='<c:url value="/writeform.do"/>';">회원등록</button>
					</c:if>
				</td>
			  </tr>
		  </table>
		</c:otherwise>
	  </c:choose>
	  </td>
	</tr>
</table>  

</body>
</html>