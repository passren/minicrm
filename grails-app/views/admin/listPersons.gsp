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

<title>系统管理 > 人员列表</title>
</head>
<body>
    <div class="toolbar">
        <g:link action="addPerson">创建人员</g:link>
    </div>
    
    <h1>系统管理 > 人员列表</h1>
	<g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
	</g:if>

	<div class="list">
		<table id="userList">
	       	<thead>
				<tr>
				<g:sortableColumn property="id" title="序号" style="width: 5%"/>
			        <g:sortableColumn property="name" title="姓名" style="width: 15%"/>
			        <g:sortableColumn property="jobnumber" title="工号" style="width: 15%"/>
			        <g:sortableColumn property="jobposition" title="职位" style="width: 15%"/>
			        <g:sortableColumn property="supervisor" title="主管" style="width: 15%"/>
			        <g:sortableColumn property="status" title="状态" style="width: 5%"/>
			        <g:sortableColumn property="createdDate" title="创建日期" style="width: 10%"/>
			        <g:sortableColumn property="lastUpdatedDate" title="更新日期" style="width: 10%"/>
		        </tr>
	        </thead>
			<tbody>
				<g:each in="${persons}" status="i" var="person">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${i+1}</td>
					<td><g:link action="updatePerson" id="${person.id}">${person.name?.encodeAsHTML()}</g:link></td>
					<td>${person.jobnumber?.encodeAsHTML()}</td>
                    <td>${person.jobposition?.code1}</td>
					<td>${person.supervisor?.name}</td>
					<td>${person.status?.code1}</td>
	                <td><g:formatDate format="yyyy-MM-dd" date="${person.createdDate}"/></td>
	                <td><g:formatDate format="yyyy-MM-dd" date="${person.lastUpdatedDate}"/></td>
	                </tr>
	           </g:each>
	       </tbody>
		</table>
	</div>
	<div class="paginate">
	    <span>记录数: ${persons.size()}</span>
	</div>
</body>
</html>