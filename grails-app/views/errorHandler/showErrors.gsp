<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>错误</title>
</head>
<body>
  <div class="body">
  	<h1>错误</h1>
  	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
  </div>
</body>
</html>