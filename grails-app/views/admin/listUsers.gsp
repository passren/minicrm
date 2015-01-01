<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="layout" content="main"/>

<script type="text/javascript" class="init">
$(document).ready(function() {
	//$('#userList').DataTable();
} );
</script>

<title>系统管理 > 用户列表</title>
</head>
<body>
    <div class="toolbar">
        <g:link action="addUser">创建用户</g:link>
    </div>
    
    <h1>系统管理 > 用户列表</h1>
	<g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
	</g:if>

	<div class="list">
		<table id="userList">
	       	<thead>
				<tr>
				<g:sortableColumn property="id" title="序号" style="width: 5%"/>
			        <g:sortableColumn property="username" title="登陆用户" style="width: 15%"/>
			        <g:sortableColumn property="realname" title="真实姓名" style="width: 15%"/>
			        <th style="width: 30%">角色</th>
			        <th style="width: 20%">关联人员</th>
			        <g:sortableColumn property="enabled" title="生效?" style="width: 5%"/>
			        <g:sortableColumn property="createdDate" title="创建日期" style="width: 10%"/>
			        <g:sortableColumn property="lastUpdatedDate" title="更新日期" style="width: 10%"/>
		        </tr>
	        </thead>
			<tbody>
				<g:each in="${users}" status="i" var="user">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${i+1}</td>
					<td><g:link action="updateUser" id="${user.id}">${user.username?.encodeAsHTML()}</g:link></td>
					<td>${user.realname?.encodeAsHTML()}</td>
					<td>
					   <g:each in="${user.authorities}">[${it.description}]</g:each>
                    </td>
                    <td>${user.person?.name}</td>
					<td>${user.enabled?"生效":"失效"}</td>
	                <td><g:formatDate format="yyyy-MM-dd" date="${user.createdDate}"/></td>
	                <td><g:formatDate format="yyyy-MM-dd" date="${user.lastUpdatedDate}"/></td>
	                </tr>
	           </g:each>
	       </tbody>
		</table>
	</div>
	<div class="paginate">
	    <span>Total Records: ${users.size()}</span>
	</div>
</body>
</html>