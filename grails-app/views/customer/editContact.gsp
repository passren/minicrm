<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>客户管理 > 维护联系人信息</title>

<script type="text/javascript">
$(document).ready(function(){
	$("#linkBack").click(function(){
		if(!confirm("尚未保存,确认返回？")) return false;
		location="<g:createLink action='viewCustomer' id='${customer.id}'/>";
	});
	
	$("#linkSaveForm").click(function(){
		$("#formContact").submit();
	});
});
</script>

</head>
<body>
  <div class="body">
	<div class="toolbar">
  		<a id="linkBack" href="#">返回</a>
		<a id="linkSaveForm" href="#">保存</a>
	</div>
	
  	<h1>客户管理 > 维护联系人信息</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${contact}">
	  <div class="errors">
	    <g:renderErrors bean="${contact}" as="list" />
	  </div>
	</g:hasErrors>
	
 	<div class="form">
  	  <g:form name="formContact" action="saveContact">
  	    <input type="hidden" id="id" name="id" value="${contact?.id}"/>
  	    <input type="hidden" id="customerId" name="customerId" value="${customer.id}"/>
  	    <input type="hidden" id="actionFlag" name="actionFlag" value="${actionFlag}"/>
  	    
  		<table>
  			<thead>
  			</thead>
  			<tbody>
  				<tr>
  					<td colspan="2"><label for="customer.name">客户名称</label>
  						<g:textField name="customer.name" value="${customer.name}" size="40" readonly="true"/>
  					</td>
  					<td colspan="2"><label for="customer.city">客户区域</label>
  						<g:textField name="customer.province" value="${customer.city?.province.name}" size="15" readonly="true"/> -
  						<g:textField name="customer.city" value="${customer.city?.name}" size="15" readonly="true"/>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="4"><label for="customer.address">客户地址</label>
						<g:textField name="customer.address" value="${customer.address}" size="80" readonly="true"/>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="4"><hr/></td>
  				</tr>
  				<tr>
  					<td colspan="2"><label for="name">姓名</label>
  						<g:textField name="name" value="${contact?.name}" size="30"/>
  					</td>
  					<td><label for="department">部门</label>
  						<g:textField name="department" value="${contact?.department}" size="15"/>
  					</td>
  					<td><label for="position">职位</label>
  						<g:textField name="position" value="${contact?.position}" size="15"/>
  					</td>
  				</tr>
  				<tr>
  					<td><label for="deskphone">座机</label>
  						<g:textField name="deskphone" value="${contact?.deskphone}" size="15"/>
  					</td>
  					<td><label for="cellphone">手机</label>
  						<g:textField name="cellphone" value="${contact?.cellphone}" size="15"/>
  					</td>
  					<td><label for="email">邮箱</label>
  						<g:textField name="email" value="${contact?.email}" size="15"/>
  					</td>
  					<td><label for="status">状态</label>
	  					<g:select name="status"
						          from="${status}"
						          value="${contact?.status?.id}"
						          optionKey="id"
						          optionValue="code1"
						          noSelection="['':'']"
						          />
  					</td>
  				</tr>
  				<tr>
  					<td colspan="4"><label for="remark">备注信息</label>
						<g:textField name="remark" value="${contact?.remark}" size="80"/>
  					</td>
  				</tr>
  	    	</tbody>
  	    </table>
  	  </g:form>
 	</div>
  </div>
</body>
</html>