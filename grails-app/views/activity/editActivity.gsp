<%@ page contentType="text/html;charset=UTF-8" %>
<%
    def valueSetService = grailsApplication.mainContext.getBean("valueSetService");
	def customerId, customerName
	if(opportunity != null) {
        customerId = opportunity.customer.id
		customerName = opportunity.customer.name
	} else {
	    customerId = activity?.customer?.id
		customerName = activity?.customer?.name
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>销售活动 > 维护销售活动</title>

<asset:stylesheet src="redmond/jquery-ui-1.10.4.min.css"/>

<script type="text/javascript">
$(document).ready(function(){
	$("#linkBack").click(function(){
            if(!confirm("尚未保存,确认返回？")) return false;
            location="<g:createLink action='listActivities'/>";
	});
	
	$("#linkSaveForm").click(function(){
            $("#formActivity").submit();
	});

	$("#btnSearchCustomer").click(function(){
            var url = "${createLink(controller:'customer', action:'getCustomersAsJson', absolute:true)}";
            searchCustomer(url);
	});

	$("#linkSearchCustomer").click(function(){
            var divDialog = "#dialog-form";
            openCustomerSearchDialog(divDialog);
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
	
  	<h1>销售活动 > 维护销售活动</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${activity}">
	  <div class="errors">
	    <g:renderErrors bean="${activity}" as="list" />
	  </div>
	</g:hasErrors>
	
	<div id="dialog-form" title="查找客户" style="display:none">
		<table>
			<tbody>
				<tr>
					<td>客户名称
						<input type="text" name="search_customer_name" id="search_customer_name" value="">
					</td>
					<td>
						<input type="button" name="btnSearchCustomer" id="btnSearchCustomer" value="查找">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<select name="selCustomers" id="selCustomers" size="10" style="width:350px;"></select>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
 	<div class="form">
  	  <g:form name="formActivity" action="saveActivity">
  	    <input type="hidden" id="id" name="id" value="${activity?.id}"/>
  	    <input type="hidden" id="customerId" name="customerId" value="${customerId}"/>
  	    <input type="hidden" id="opportunityId" name="opportunityId" value="${opportunity?.id}"/>
  	    <input type="hidden" id="actionFlag" name="actionFlag" value="${actionFlag}"/>
  	    
  		<table>
  			<thead>
  			</thead>
  			<tbody>
  				<tr>
  					<td colspan="4"><label for="customerName">客户名称</label>
  						<g:textField id="customerName" name="customerName" value="${customerName}" size="40" readonly="true"/>*
  						
  						<g:if test="${customerId==null || customerId.toString().isEmpty()}">
  							<a id="linkSearchCustomer" href="#">查找客户</a>
  						</g:if>
  						<g:else>
  						    <g:link controller="customer" action="viewCustomer" id="${customerId}">客户信息</g:link>
  						</g:else>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="4"><hr/></td>
  				</tr>
  				<tr>
  					<td colspan="3"><label for="summary">活动概要</label>
  						<g:textField name="summary" value="${activity?.summary}" size="40"/>*
  					</td>
  					<td><label for="type">活动类型</label>
	  					<g:select name="type"
						          from="${valueSetService.getActivityType()}"
						          value="${activity?.type?.id}"
						          optionKey="id"
						          optionValue="code1"
						          noSelection="['':'']"
						          />*
  					</td>
  				</tr>
  				<tr>
  					<td colspan="2"><label for="issue">情况总结</label>
  						<g:textArea name="issue" value="${activity?.issue}" rows="5" cols="60"/>
  					</td>
  					<td colspan="2"><label for="solution">处理措施</label>
  						<g:textArea name="solution" value="${activity?.solution}" rows="5" cols="60"/>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="4"><label for="remark">备注信息</label>
						<g:textField name="remark" value="${activity?.remark}" size="80"/>
  					</td>
  				</tr>
  	    	</tbody>
  	    </table>
  	  </g:form>
 	</div>
  </div>
</body>
</html>