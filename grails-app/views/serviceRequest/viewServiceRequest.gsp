<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>售后服务 > 服务请求</title>

<asset:stylesheet src="redmond/jquery-ui-1.10.4.min.css"/>

<script type="text/javascript">
$(document).ready(function(){
    $("#linkDeleteServiceRequest").click(function(){
        if(!confirm("删除后无法恢复,确认继续？")) return false;
        location="<g:createLink action='deleteServiceRequest' id='${serviceRequest.id}'/>";
    });
});
</script>

</head>
<body>
  <div class="body">
	<div class="toolbar">
	    <g:link action="listServiceRequests">返回</g:link>
	    <g:link action="updateServiceRequest" id="${serviceRequest.id}">更新服务请求</g:link>
	    <a id=linkDeleteServiceRequest href="#">删除服务请求</a>
	</div>
	
  	<h1>售后服务 > 服务请求</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${serviceRequest}">
	  <div class="errors">
	    <g:renderErrors bean="${serviceRequest}" as="list" />
	  </div>
	</g:hasErrors>

 	<div class="form">
  		<table>
  			<thead>
  			</thead>
  			<tbody>
                <tr>
                    <td colspan="4"><label for="customerName">客户名称</label>
                        <g:textField name="customerName" value="${serviceRequest.customer.name}" size="40" readonly="true"/>
                        <g:link controller="customer" action="viewCustomer" id="${serviceRequest.customer.id}" target="_blank">客户信息</g:link>
                    </td>
                </tr>
  				<tr>
  					<td colspan="4"><hr/></td>
  				</tr>
  				<tr>
  					<td colspan="3"><label for="name">服务请求</label>
  						<g:textField name="name" value="${serviceRequest.name}" size="60" readonly="true"/>
  					</td>
  					<td><label for="classification">服务定级</label>
  					    <g:textField name="classification" value="${serviceRequest.classification?.code1}" size="15" readonly="true"/>
  					</td>
  				</tr>
  				<tr>
  					<td><label for="status">服务状态</label>
  					    <g:textField name="status" value="${serviceRequest.status?.code1}" size="15" readonly="true"/>
  					</td>
  					<td><label for="completedDate">完成日期</label>
  						<g:textField name="txtCompletedDate" 
  						                value="${com.minicrm.StringUtils.getDate(serviceRequest.completedDate,
                                                    com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
  						                size="15" readonly="true"/>
  					</td>
  					<td><label for="maintainer">维护人</label>
                        <g:textField name="maintainer" value="${serviceRequest.maintainer}" size="15" readonly="true"/>
                    </td>
                    <td><label for="owner">责任人</label>
                        <g:textField name="owner" value="${serviceRequest.owner}" size="15" readonly="true"/>
                    </td>
  				</tr>
  				<tr>
  					<td colspan="4"><label for="remark">备注信息</label>
						<g:textField name="remark" value="${serviceRequest.remark}" size="80" readonly="true"/>
  					</td>
  				</tr>
                <tr>
                    <td><label for="createdDate">创建日期</label>
                        <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${serviceRequest.createdDate}"/>
                    </td>
                    <td><label for="createUser">创建人员</label>
                        ${serviceRequest.createUser.realname}
                    </td>
                    <td><label for="lastUpdatedDate">更新日期</label>
                        <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${serviceRequest.lastUpdatedDate}"/>
                    </td>
                    <td><label for="lastUpdateUser">更新人员</label>
                        ${serviceRequest.lastUpdateUser.realname}
                    </td>
                </tr>
  	    	</tbody>
  	    </table>
 	</div>
  </div>
</body>
</html>