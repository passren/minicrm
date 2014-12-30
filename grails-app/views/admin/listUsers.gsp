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

<title>用户列表</title>
</head>
<body>
<div class="list">
	<table id="userList">
       	<thead>
			<tr>
			<g:sortableColumn property="id" title="No." style="width: 5%"/>
		        <g:sortableColumn property="username" title="Login Name" style="width: 10%"/>
		        <g:sortableColumn property="realname" title="Real Name" style="width: 10%"/>
		        <th style="width: 20%">Roles</th>
		        <g:sortableColumn property="enabled" title="Enabled?" style="width: 5%"/>
		        <th style="width: 25%">&nbsp;</th>
	        </tr>
        </thead>
		<tbody>
			<g:each in="${users}" status="i" var="user">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
           <td>${i+1}</td>
           <td>${user.username?.encodeAsHTML()}</td>
           <td>${user.realname?.encodeAsHTML()}</td>
           <td>
             <g:each in="${user.authorities}">
               [${it.description}]
             </g:each>
             </td>
           <td>${user.enabled?"Yes":"No"}</td>
           <td class="actionButtons">
             <span class="actionButton">
               <a href="#" onclick="javascript:updUser('<g:createLink action='update' id='${user.id}'/>');">
				<asset:image src="skin/database_edit.png" alt="Update User"/>
               </a>
               <a href="#" onclick="javascript:delUser('<g:createLink action='delete' id='${user.id}'/>');">
				<asset:image src="skin/database_delete.png" alt="Delete User"/>
               </a>
               <a href="#" onclick="javascript:resetPwd('<g:createLink action='resetPwd' id='${user.id}'/>');">
				<asset:image src="skin/information.png" alt="Reset Password"/>
               </a>
             </span>
           </td>
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