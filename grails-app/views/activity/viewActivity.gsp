<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>销售活动 > 活动信息</title>
</head>
<body>
  <div class="body">
	<div class="toolbar">
		<g:link action="listActivities">返回</g:link>
		<g:link action="updateActivity" id="${activity.id}">更新活动</g:link>
	</div>
	
  	<h1>销售活动 > 活动信息</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>

 	<div class="form">
  		<table>
  			<thead>
  			</thead>
  			<tbody>
  				<tr>
  					<td colspan="4"><label for="customerName">客户名称</label>
  						<g:textField name="customerName" value="${activity.customer.name}" size="40" readonly="true"/>
						<g:link action="viewCustomer" id="${activity.customer.id}" target="_blank">客户信息</g:link>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="4"><hr/></td>
  				</tr>
  				<tr>
  					<td colspan="3"><label for="summary">活动概要</label>
  						<g:textField name="summary" value="${activity.summary}" size="40" readonly="true"/>
  					</td>
  					<td><label for="type">活动类型</label>
  						<g:textField name="type" value="${activity.type.code1}" size="15" readonly="true"/>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="2"><label for="issue">情况总结</label>
  						<g:textArea name="issue" value="${activity.issue}" rows="5" cols="60" readonly="true"/>
  					</td>
  					<td colspan="2"><label for="solution">处理措施</label>
  						<g:textArea name="solution" value="${activity.solution}" rows="5" cols="60" readonly="true"/>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="4"><label for="remark">备注信息</label>
						<g:textField name="remark" value="${activity.remark}" size="80" readonly="true"/>
  					</td>
  				</tr>
  	    	</tbody>
  	    </table>
 	</div>
  </div>
</body>
</html>