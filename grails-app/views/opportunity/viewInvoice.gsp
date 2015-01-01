<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>机会跟踪 > 销售机会 > 发票信息</title>

<script type="text/javascript">
$(document).ready(function(){
    $("#linkDeleteInvoice").click(function(){
        if(!confirm("删除后无法恢复,确认继续？")) return false;
        location="<g:createLink action='deleteInvoice' id='${invoice.id}'/>";
    });
});
</script>

</head>
<body>
  <div class="body">
	<div class="toolbar">
	    <g:link action="viewOpportunity" id="${invoice.opportunity.id}">返回</g:link>
	    <g:link action="updateInvoice" id="${invoice.id}">更新发票</g:link>
	    <a id=linkDeleteInvoice href="#">删除发票</a>
	</div>
	
  	<h1>机会跟踪 > 销售机会 > 发票信息</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
    <g:hasErrors bean="${invoice}">
      <div class="errors">
        <g:renderErrors bean="${invoice}" as="list" />
      </div>
    </g:hasErrors>
 	<div class="form">
  		<table>
  			<thead>
  			</thead>
  			<tbody>
  				<tr>
  					<td colspan="4"><label for="customerName">客户名称</label>
  						<g:textField id="customerName" name="customerName" value="${invoice.opportunity.customer.name}" size="40" readonly="true"/>
                        <g:link controller="customer" action="viewCustomer" id="${invoice.opportunity.customer.id}" target="_blank">客户信息</g:link>
  					</td>
  				</tr>
                <tr>
                    <td><label for="status">机会状态</label>
                        <g:textField name="status" value="${invoice.opportunity.status.code1}" size="15" readonly="true"/>
                    </td>
                    <td><label for="possibility">可能性</label>
                        <g:textField name="possibility" value="${invoice.opportunity.possibility}" size="15" readonly="true"/>%
                    </td>
                    <td colspan="2"><label for="product">购买内容</label>
                        <g:textField name="product" value="${invoice.opportunity.product.code1}" size="15" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <td><label for="signedDate">签约时间</label>
                        <g:textField name="signedDate" 
                                        value="${com.minicrm.StringUtils.getDate(invoice.opportunity.signedDate,
                                                    com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
                                        size="15" readonly="true"/>
                    </td>
                    <td><label for="contractNumber">合同编号</label>
                        <g:textField name="contractNumber" value="${invoice.opportunity.contractNumber}" size="15" readonly="true"/>
                    </td>
                    <td colspan="2"><label for="contractAmount">合同金额</label>
                        <g:textField name="contractAmount" value="${invoice.opportunity.contractAmount}" size="15" readonly="true"/>
                    </td>
                </tr>
  				<tr>
  					<td colspan="4"><hr/></td>
  				</tr>
  				<tr>
                    <td><label for="invoiceType">发票类型</label>
                        <g:textField name="invoiceType" value="${invoice.invoiceType.code1}" size="15" readonly="true"/>
                    </td>
                    <td><label for="invoiceAmount">发票金额</label>
                        <g:textField name="invoiceAmount" value="${invoice.invoiceAmount}" size="15" readonly="true"/>
                    </td>
                    <td><label for="txtInvoiceDate">发票日期</label>
                        <g:textField id="txtInvoiceDate" name="txtInvoiceDate" 
                                                value="${com.minicrm.StringUtils.getDate(invoice.invoiceDate, 
                                                            com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
                                                size="15" readonly="true"/>
                    </td>
                    <td><label for="invoiceNumber">发票号码</label>
                        <g:textField name="invoiceNumber" value="${invoice.invoiceNumber}" size="15" readonly="true"/>
                    </td>
                </tr>
  				<tr>
  					<td colspan="4"><label for="remark">备注信息</label>
						<g:textField name="remark" value="${invoice.remark}" size="80" readonly="true"/>
  					</td>
  				</tr>
                <tr>
				    <td><label for="createdDate">创建日期</label>
				        <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${invoice.createdDate}"/>
				    </td>
				    <td><label for="createUser">创建人员</label>
				        ${invoice.createUser.realname}
				    </td>
				    <td><label for="lastUpdatedDate">更新日期</label>
				        <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${invoice.lastUpdatedDate}"/>
				    </td>
				    <td><label for="lastUpdateUser">更新人员</label>
				        ${invoice.lastUpdateUser.realname}
				    </td>
				</tr>
  	    	</tbody>
  	    </table>
 	</div>
  </div>
</body>
</html>