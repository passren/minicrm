<%@ page contentType="text/html;charset=UTF-8" %>
<%
def valueSetService = grailsApplication.mainContext.getBean("valueSetService");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>售后服务 > 维护服务请求</title>

    <asset:stylesheet src="redmond/jquery-ui-1.10.4.min.css"/>

    <script type="text/javascript">
        $(document).ready(function(){
        $("#linkBack").click(function(){
        if(!confirm("尚未保存,确认返回？")) return false;
            location="<g:createLink action='listServiceRequests'/>";
        });

        $("#linkSaveForm").click(function(){
        $("#formServiceRequest").submit();
        });

        $("#btnSearchCustomer").click(function(){
            var url = "${createLink(controller:'customer', action:'getCustomersAsJson', absolute:true)}";
        searchCustomer(url);
        });

        $("#linkSearchCustomer").click(function(){
        var divDialog = "#dialog-form";
        openCustomerSearchDialog(divDialog);
        });

        $("#txtCompletedDate").datepicker();
        });
    </script>

</head>
<body>
    <div class="body">
        <div class="toolbar">
            <a id="linkBack" href="#">返回</a>
            <a id="linkSaveForm" href="#">保存</a>
        </div>

        <h1>售后服务 > 维护服务请求</h1>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${serviceRequest}">
            <div class="errors">
                <g:renderErrors bean="${serviceRequest}" as="list" />
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
            <g:form name="formServiceRequest" action="saveServiceRequest">
                <input type="hidden" id="id" name="id" value="${serviceRequest?.id}"/>
                <input type="hidden" id="customerId" name="customerId" value="${serviceRequest?.customer?.id}"/>
                <input type="hidden" id="actionFlag" name="actionFlag" value="${actionFlag}"/>

                <table>
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4"><label for="customerName">客户名称</label>
                                <g:textField id="customerName" name="customerName" value="${serviceRequest?.customer?.name}" size="40" readonly="true"/>*

                                <g:if test="${actionFlag == 'A'}">
                                    <a id="linkSearchCustomer" href="#">查找客户</a>
                                </g:if>

                                <g:if test="${actionFlag == 'U'}">
                                    <g:link controller="customer" action="viewCustomer" id="${serviceRequest.customer.id}" target="_blank">客户信息</g:link>
                                </g:if>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><hr/></td>
                        </tr>
                        <tr>
                            <td colspan="3"><label for="name">服务请求</label>
                                <g:textField name="name" value="${serviceRequest?.name}" size="60"/>*
                            </td>
                            <td><label for="classification">服务定级</label>
                                <g:select name="classification"
                                from="${valueSetService.getServiceClass()}"
                                value="${serviceRequest?.classification?.id}"
                                    optionKey="id"
                                    optionValue="code1"
                                    noSelection="['':'']"
                                    />*
                            </td>
                        </tr>
                        <tr>
                            <td><label for="status">服务状态</label>
                                <g:select name="status"
                                from="${valueSetService.getServiceStatus()}"
                                value="${serviceRequest?.status?.id}"
                                    optionKey="id"
                                    optionValue="code1"
                                    noSelection="['':'']"
                                    />*
                            </td>
                            <td><label for="completedDate">完成日期</label>
                                <g:textField name="txtCompletedDate" 
                                value="${com.minicrm.StringUtils.getDate(serviceRequest?.completedDate,com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
                                    size="15"/>
                            </td>
                            <td><label for="maintainer">维护人</label>
                                <g:textField name="maintainer" value="${serviceRequest?.maintainer}" size="15"/>
                            </td>
                            <td><label for="owner">责任人</label>
                                <g:textField name="owner" value="${serviceRequest?.owner}" size="15"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><label for="remark">备注信息</label>
                                <g:textField name="remark" value="${serviceRequest?.remark}" size="80"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </g:form>
        </div>
    </div>
</body>
</html>