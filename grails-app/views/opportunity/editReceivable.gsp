<%@ page contentType="text/html;charset=UTF-8" %>
<%
    def valueSetService = grailsApplication.mainContext.getBean("valueSetService");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>机会跟踪 > 销售机会 > 维护收款</title>

<asset:stylesheet src="redmond/jquery-ui-1.10.4.min.css"/>

<script type="text/javascript">
$(document).ready(function(){
    $("#linkBack").click(function(){
        if(!confirm("尚未保存,确认返回？")) return false;
        location="<g:createLink action='viewOpportunity' id='${opportunity.id}'/>";
    });
    
    $("#linkSaveForm").click(function(){
        $("#formReceivable").submit();
    });

    $("#txtReceiptDate").datepicker();
});
</script>

</head>
<body>
  <div class="body">
	<div class="toolbar">
  		<a id="linkBack" href="#">返回</a>
		<a id="linkSaveForm" href="#">保存</a>
	</div>
	
  	<h1>机会跟踪 > 销售机会 > 维护收款</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${receivable}">
	  <div class="errors">
	    <g:renderErrors bean="${receivable}" as="list" />
	  </div>
	</g:hasErrors>
	
 	<div class="form">
  	  <g:form name="formReceivable" action="saveReceivable">
  	    <input type="hidden" id="id" name="id" value="${receivable?.id}"/>
  	    <input type="hidden" id="customerId" name="opportunityId" value="${opportunity.id}"/>
  	    <input type="hidden" id="actionFlag" name="actionFlag" value="${actionFlag}"/>
  	    
  		<table>
  			<thead>
  			</thead>
  			<tbody>
  				<tr>
  					<td colspan="4"><label for="customerName">客户名称</label>
  						<g:textField id="customerName" name="customerName" value="${opportunity.customer.name}" size="40" readonly="true"/>
                        <g:link controller="customer" action="viewCustomer" id="${opportunity.customer.id}" target="_blank">客户信息</g:link>
  					</td>
  				</tr>
                <tr>
                    <td><label for="status">机会状态</label>
                        <g:textField name="status" value="${opportunity.status.code1}" size="15" readonly="true"/>
                    </td>
                    <td><label for="possibility">可能性</label>
                        <g:textField name="possibility" value="${opportunity.possibility}" size="15" readonly="true"/>%
                    </td>
                    <td colspan="2"><label for="product">购买内容</label>
                        <g:textField name="product" value="${opportunity.product.code1}" size="15" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <td><label for="signedDate">签约时间</label>
                        <g:textField name="signedDate" 
                                        value="${com.minicrm.StringUtils.getDate(opportunity.signedDate,
                                                    com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
                                        size="15" readonly="true"/>
                    </td>
                    <td><label for="contractNumber">合同编号</label>
                        <g:textField name="contractNumber" value="${opportunity.contractNumber}" size="15" readonly="true"/>
                    </td>
                    <td colspan="2"><label for="contractAmount">合同金额</label>
                        <g:textField name="contractAmount" value="${opportunity.contractAmount}" size="15" readonly="true"/>
                    </td>
                </tr>
  				<tr>
  					<td colspan="4"><hr/></td>
  				</tr>
  				<tr>
  					<td><label for="receiptMethod">收款方式</label>
	  					<g:select name="receiptMethod"
						          from="${valueSetService.getReceiptMethod()}"
						          value="${receivable?.receiptMethod?.id}"
						          optionKey="id"
						          optionValue="code1"
						          noSelection="['':'']"
						          />
  					</td>
  					<td><label for="receiptAmount">收款金额</label>
                        <g:textField name="receiptAmount" value="${receivable?.receiptAmount}" size="15"/>
                    </td>
                    <td colspan="2"><label for="txtReceiptDate">收款日期</label>
                        <g:textField id="txtReceiptDate" name="txtReceiptDate" 
                                                value="${com.minicrm.StringUtils.getDate(receivable?.receiptDate, 
                                                            com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
                                                size="15"/>
                    </td>
  				</tr>
  				<tr>
  					<td colspan="4"><label for="remark">备注信息</label>
						<g:textField name="remark" value="${receivable?.remark}" size="80"/>
  					</td>
  				</tr>
  	    	</tbody>
  	    </table>
  	  </g:form>
 	</div>
  </div>
</body>
</html>