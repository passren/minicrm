<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main"/>
        <title>机会跟踪 > 机会信息</title>
    </head>
    <body>
        <div class="body">
            <div class="toolbar">
                <g:link action="listOpportunities">返回</g:link>
                <g:link action="updateOpportunity" id="${opportunity.id}">更新机会</g:link>
                <g:link action="addActivity" id="${opportunity.id}">创建活动</g:link>
                <g:link action="addReceivable" id="${opportunity.id}">创建收款</g:link>
                <g:link action="addInvoice" id="${opportunity.id}">创建发票</g:link>
            </div>

            <h1>机会跟踪 > 机会信息</h1>
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
                                <g:textField name="product" value="${opportunity.product.code1}" size="15" readonly="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="signedDate">签约时间</label>
                                <g:textField name="signedDate" 
                                                value="${com.minicrm.StringUtils.getDate(opportunity?.signedDate,
                                                            com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
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
                            <td><label for="impStatus">实施状态</label>
                                <g:textField name="impStatus" value="${opportunity.impStatus?.code1}" size="15" readonly="true"/>
                            </td>
                            <td><label for="impStartDate">实施开始时间</label>
                                <g:textField name="impStartDate" 
                                                value="${com.minicrm.StringUtils.getDate(opportunity?.impStartDate,
                                                            com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
                                                size="15" readonly="true"/>
                            </td>
                            <td><label for="impEndDate">实施结束时间</label>
                                <g:textField name="impStartDate" 
                                                value="${com.minicrm.StringUtils.getDate(opportunity?.impEndDate,
                                                            com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
                                                size="15" readonly="true"/>
                            </td>
                            <td><label for="impArea">实施地区</label>
                                <g:textField name="impArea" value="${opportunity?.impArea}" size="15" readonly="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="certificationAccount">开办帐号</label>
                                <g:textField name="certificationAccount" value="${opportunity?.certificationAccount}" size="15" readonly="true"/>
                            </td>
                            <td><label for="certificationNumber">证书编号</label>
                                <g:textField name="certificationNumber" value="${opportunity?.certificationNumber}" size="15" readonly="true"/>
                            </td>
                            <td colspan="2"><label for="impOthers">实施备注</label>
                                <g:textField name="impOthers" value="${opportunity?.impOthers}" size="40" readonly="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><label for="remark">备注信息</label>
                                <g:textField name="remark" value="${opportunity?.remark}" size="80" readonly="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="contact.createdDate">创建日期</label>
                                <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${opportunity.createdDate}"/>
                            </td>
                            <td><label for="contact.createUser">创建人员</label>
                                ${opportunity.createUser.realname}
                            </td>
                            <td><label for="contact.lastUpdatedDate">更新日期</label>
                                <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${opportunity.lastUpdatedDate}"/>
                            </td>
                            <td><label for="contact.lastUpdateUser">更新人员</label>
                                ${opportunity.lastUpdateUser.realname}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="listReceivables">
                <g:render template="listReceivables" model="[opportunity:opportunity]" />
            </div>
        
            <div id="listInvoices">
                <g:render template="listInvoices" model="[opportunity:opportunity]" />
            </div>
            
			<div id="listActivities">
			    <g:render template="listActivities" model="[activities:activities]" />
			</div>
            
        </div>
    </body>
</html>
