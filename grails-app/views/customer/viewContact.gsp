<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>客户管理 > 联系人信息</title>
</head>
<body>
  <div class="body">
	<div class="toolbar">
  		<g:link action="viewCustomer" id="${contact.customer.id}">返回</g:link>
  		<g:link action="updateContact" id="${contact.id}">更新联系人信息</g:link>
	</div>
	
  	<h1>客户管理 > 联系人信息</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>

 	<div class="form">
  		<table>
  			<thead>
  			</thead>
  			<tbody>
  				<tr>
  					<td colspan="2"><label for="customer.name">客户名称</label>
  						<g:textField name="customer.name" value="${contact.customer.name}" size="40" readonly="true"/>
  					</td>
  					<td colspan="2"><label for="customer.city">客户区域</label>
  						<g:textField name="customer.province" value="${contact.customer.city?.province.name}" size="15" readonly="true"/> -
  						<g:textField name="customer.city" value="${contact.customer.city?.name}" size="15" readonly="true"/>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="4"><label for="customer.address">客户地址</label>
						<g:textField name="customer.address" value="${contact.customer.address}" size="80" readonly="true"/>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="4"><hr/></td>
  				</tr>
  				<tr>
  					<td colspan="2"><label for="name">姓名</label>
  						<g:textField name="name" value="${contact.name}" size="30" readonly="true"/>
  					</td>
  					<td><label for="department">部门</label>
  						<g:textField name="department" value="${contact.department}" size="15" readonly="true"/>
  					</td>
  					<td><label for="position">职位</label>
  						<g:textField name="position" value="${contact.position}" size="15" readonly="true"/>
  					</td>
  				</tr>
  				<tr>
  					<td><label for="deskphone">座机</label>
  						<g:textField name="deskphone" value="${contact.deskphone}" size="15" readonly="true"/>
  					</td>
  					<td><label for="cellphone">手机</label>
  						<g:textField name="cellphone" value="${contact.cellphone}" size="15" readonly="true"/>
  					</td>
                                        <td><label for="qq">QQ</label>
  						<g:textField name="qq" value="${contact.qq}" size="15" readonly="true"/>
  					</td>
  					<td><label for="email">邮箱</label>
  						<g:textField name="email" value="${contact.email}" size="15" readonly="true"/>
  					</td>
  				</tr>
  				<tr>
                                        <td><label for="status">状态</label>
  						<g:textField name="status" value="${contact.status?.code1}" size="15" readonly="true"/>
  					</td>
  					<td colspan="3"><label for="remark">备注</label>
						<g:textField name="remark" value="${contact.remark}" size="80" readonly="true"/>
  					</td>
  				</tr>
  				<tr>
  					<td><label for="contact.createdDate">创建日期</label>
  						<g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${contact.createdDate}"/>
  					</td>
  					<td><label for="contact.createUser">创建人员</label>
  						${contact.createUser.realname}
  					</td>
  					<td><label for="contact.lastUpdatedDate">更新日期</label>
						<g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${contact.lastUpdatedDate}"/>
					</td>
  					<td><label for="contact.lastUpdateUser">更新人员</label>
						${contact.lastUpdateUser.realname}
					</td>
  				</tr>
  	    	</tbody>
  	    </table>
 	</div>
  </div>
</body>
</html>