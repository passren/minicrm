<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>机会跟踪 > 销售机会 > 收款信息</title>

<script type="text/javascript">
$(document).ready(function(){
    $("#linkDeleteReceivable").click(function(){
        if(!confirm("删除后无法恢复,确认继续？")) return false;
        location="<g:createLink action='deleteReceivable' id='${receivable.id}'/>";
    });
});
</script>

</head>
<body>
  <div class="body">
	<div class="toolbar">
	    <g:link action="viewOpportunity" id="${receivable.opportunity.id}">返回</g:link>
	    <g:link action="updateReceivable" id="${receivable.id}">更新收款</g:link>
	    <a id="linkDeleteReceivable" href="#">删除收款</a>
	</div>
	
  	<h1>机会跟踪 > 销售机会 > 收款信息</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
    <g:hasErrors bean="${receivable}">
      <div class="errors">
        <g:renderErrors bean="${receivable}" as="list" />
      </div>
    </g:hasErrors>
 	<div class="form">
  		<table>
  			<thead>
  			</thead>
  			<tbody>
  				<tr>
  					<td colspan="4"><label for="customerName">客户名称</label>
  						<g:textField id="customerName" name="customerName" value="${receivable.opportunity.customer.name}" size="40" readonly="true"/>
                        <g:link controller="customer" action="viewCustomer" id="${receivable.opportunity.customer.id}" target="_blank">客户信息</g:link>
  					</td>
  				</tr>
                <tr>
                    <td><label for="status">机会状态</label>
                        <g:textField name="status" value="${receivable.opportunity.status.code1}" size="15" readonly="true"/>
                    </td>
                    <td><label for="possibility">可能性</label>
                        <g:textField name="possibility" value="${receivable.opportunity.possibility}" size="15" readonly="true"/>%
                    </td>
                    <td colspan="2"><label for="product">购买内容</label>
                        <g:textField name="product" value="${receivable.opportunity.product.code1}" size="15" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <td><label for="signedDate">签约时间</label>
                        <g:textField name="signedDate" 
                                        value="${com.minicrm.StringUtils.getDate(receivable.opportunity.signedDate,
                                                    com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
                                        size="15" readonly="true"/>
                    </td>
                    <td><label for="contractNumber">合同编号</label>
                        <g:textField name="contractNumber" value="${receivable.opportunity.contractNumber}" size="15" readonly="true"/>
                    </td>
                    <td colspan="2"><label for="contractAmount">合同金额</label>
                        <g:textField name="contractAmount" value="${receivable.opportunity.contractAmount}" size="15" readonly="true"/>
                    </td>
                </tr>
  				<tr>
  					<td colspan="4"><hr/></td>
  				</tr>
  				<tr>
  					<td><label for="receiptMethod">收款方式</label>
                        <g:textField name="receiptMethod" value="${receivable.receiptMethod.code1}" size="15" readonly="true"/>
  					</td>
  					<td><label for="receiptAmount">收款金额</label>
                        <g:textField name="receiptAmount" value="${receivable.receiptAmount}" size="15" readonly="true"/>
                    </td>
                    <td colspan="2"><label for="txtReceiptDate">收款日期</label>
                        <g:textField id="txtReceiptDate" name="txtReceiptDate" 
                                                value="${com.minicrm.StringUtils.getDate(receivable.receiptDate, 
                                                            com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
                                                size="15" readonly="true"/>
                    </td>
  				</tr>
  				<tr>
  					<td colspan="4"><label for="remark">备注信息</label>
						<g:textField name="remark" value="${receivable.remark}" size="80" readonly="true"/>
  					</td>
  				</tr>
                <tr>
                    <td><label for="createdDate">创建日期</label>
                        <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${receivable.createdDate}"/>
                    </td>
                    <td><label for="createUser">创建人员</label>
                        ${receivable.createUser.realname}
                    </td>
                    <td><label for="lastUpdatedDate">更新日期</label>
                        <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${receivable.lastUpdatedDate}"/>
                    </td>
                    <td><label for="lastUpdateUser">更新人员</label>
                        ${receivable.lastUpdateUser.realname}
                    </td>
                </tr>
  	    	</tbody>
  	    </table>
 	</div>
  </div>
</body>
</html>