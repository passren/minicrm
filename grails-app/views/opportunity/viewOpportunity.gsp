<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main"/>
        <title>销售机会 > 机会信息</title>
    </head>
    <body>
        <div class="body">
            <div class="toolbar">
                <g:link action="listOpportunities">返回</g:link>
                <g:link action="updateOpportunity" id="${opportunity.id}">更新机会</g:link>
                <g:link action="addReceivable" id="${opportunity.id}">创建收款</g:link>
                <g:link action="addInvoice" id="${opportunity.id}">创建发票</g:link>
            </div>

            <h1>销售机会 > 机会信息</h1>
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
                                <g:textField name="customerName" value="${opportunity.customer.name}" size="40" readonly="true"/>
                                <g:link controller="customer" action="viewCustomer" id="${opportunity.customer.id}" target="_blank">客户信息</g:link>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><hr/></td>
                        </tr>
                        <tr>
                            <td><label for="status">机会状态</label>
                                <g:textField name="status" value="${opportunity.status.code1}" size="15" readonly="true"/>
                            </td>
                            <td><label for="possibility">可能性</label>
                                <g:textField name="possibility" value="${opportunity.possibility}" size="15" readonly="true"/>%
                            </td>
                            <td colspan="2"><label for="product">购买内容</label>
                                <g:textField name="product" value="${opportunity.product.code1}" size="15" readonly="true"/>%
                            </td>
                        </tr>
                        <tr>
                            <td><label for="signedDate">签约时间</label>
                                <g:textField name="signedDate" 
                                                value="${com.minicrm.StringUtils.getDate(opportunity?.signedDate, 'yyyy-MM-dd')}" 
                                                size="15" readonly="true"/>
                            </td>
                            <td><label for="contractNumber">合同编号</label>
                                <g:textField name="contractNumber" value="${opportunity?.contractNumber}" size="15" readonly="true"/>
                            </td>
                            <td colspan="2"><label for="contractAmount">合同金额</label>
                                <g:textField name="contractAmount" value="${opportunity?.contractAmount}" size="15" readonly="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><label for="remark">备注信息</label>
                                <g:textField name="remark" value="${opportunity?.remark}" size="80" readonly="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="contact.createdDate">创建日期</label>
                                <g:formatDate format="yyyy-MM-dd HH:mm:SS" date="${opportunity.createdDate}"/>
                            </td>
                            <td><label for="contact.createUser">创建人员</label>
                                ${opportunity.createUser.realname}
                            </td>
                            <td><label for="contact.lastUpdatedDate">更新日期</label>
                                <g:formatDate format="yyyy-MM-dd HH:mm:SS" date="${opportunity.lastUpdatedDate}"/>
                            </td>
                            <td><label for="contact.lastUpdateUser">更新人员</label>
                                ${opportunity.lastUpdateUser.realname}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="list">
            <table id="receivableList">
                <thead>
                    <tr>
                        <th style="width: 2%">序号</th>
                        <g:sortableColumn property="receiptMethod" title="收款方式" style="width: 20%"/>
                        <g:sortableColumn property="receiptAmount" title="收款金额" style="width: 30%"/>
                        <g:sortableColumn property="receiptDate" title="收款日期" style="width: 15%"/>
                        <g:sortableColumn property="createdDate" title="创建日期" style="width: 15%"/>
                        <g:sortableColumn property="lastUpdatedDate" title="更新日期" style="width: 15%"/>
                    </tr>
                </thead>
		<tbody>
                    <g:each in="${opportunity.receivables}" status="i" var="receivable">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td>${i+1}</td>
                        <td><g:link action="viewReceivable" id="${receivable.id}">${receivable.receiptMethod}</g:link></td>
                        <td>${receivable.receiptAmount}</td>
                        <td><g:formatDate format="yyyy-MM-dd" date="${receivable.receiptDate}"/></td>
                        <td><g:formatDate format="yyyy-MM-dd" date="${receivable.createdDate}"/></td>
                        <td><g:formatDate format="yyyy-MM-dd" date="${receivable.lastUpdatedDate}"/></td>
                    </tr>
                    </g:each>
                </tbody>
            </table>
  	</div>
        
        <div class="list">
            <table id="invoiceList">
                <thead>
                    <tr>
                        <th style="width: 2%">序号</th>
                        <g:sortableColumn property="invoiceType" title="发票类型" style="width: 20%"/>
                        <g:sortableColumn property="invoiceAmount" title="发票金额" style="width: 20%"/>
                        <g:sortableColumn property="invoiceNumber" title="发票号码" style="width: 20%"/>
                        <g:sortableColumn property="invoiceTrack" title="发票动向" style="width: 15%"/>
                        <g:sortableColumn property="createdDate" title="创建日期" style="width: 15%"/>
                        <g:sortableColumn property="lastUpdatedDate" title="更新日期" style="width: 15%"/>
                    </tr>
                </thead>
		<tbody>
                    <g:each in="${opportunity.invoices}" status="i" var="invoice">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td>${i+1}</td>
                        <td><g:link action="viewInvoice" id="${invoice.id}">${invoice.invoiceType}</g:link></td>
                        <td>${invoice.invoiceAmount}</td>
                        <td>${invoice.invoiceNumber}</td>
                        <td>${invoice.invoiceTrack}</td>
                        <td><g:formatDate format="yyyy-MM-dd" date="${invoice.createdDate}"/></td>
                        <td><g:formatDate format="yyyy-MM-dd" date="${invoice.lastUpdatedDate}"/></td>
                    </tr>
                    </g:each>
                </tbody>
            </table>
  	</div>
    </body>
</html>
