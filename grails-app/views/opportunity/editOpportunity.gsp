<%@ page contentType="text/html;charset=UTF-8" %>
<%
    def valueSetService = grailsApplication.mainContext.getBean("valueSetService");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main"/>
        <title>机会跟踪 > 维护销售机会</title>
        
        <asset:stylesheet src="redmond/jquery-ui-1.10.4.min.css"/>
        
        <script type="text/javascript">
        $(document).ready(function(){
            $("#linkBack").click(function(){
                if(!confirm("尚未保存,确认返回？")) return false;
                location="<g:createLink action='listOpportunities'/>";
            });

            $("#linkSaveForm").click(function(){
                $("#formOpportunity").submit();
            });

            $("#btnSearchCustomer").click(function(){
                var url = "${createLink(controller:'customer', action:'getCustomersAsJson', absolute:true)}";
                searchCustomer(url);
            });

            $("#linkSearchCustomer").click(function(){
                var divDialog = "#dialog-form";
                openCustomerSearchDialog(divDialog);
            });
            
            $("#txtSignedDate").datepicker();
            $("#txtImpStartDate").datepicker();
            $("#txtImpEndDate").datepicker();
        });
        </script>
    </head>
    <body>
    <div class="body">
	<div class="toolbar">
            <a id="linkBack" href="#">返回</a>
            <a id="linkSaveForm" href="#">保存</a>
	</div>
	
  	<h1>机会跟踪 > 维护销售机会</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${opportunity}">
	  <div class="errors">
	    <g:renderErrors bean="${opportunity}" as="list" />
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
                    <tr>
                    	<td colspan="2">输入%可以查询所有客户</td>
                	</tr>
                </tbody>
            </table>
	</div>
	
 	<div class="form">
            <g:form name="formOpportunity" action="saveOpportunity">
  	    <input type="hidden" id="id" name="id" value="${opportunity?.id}"/>
  	    <input type="hidden" id="customerId" name="customerId" value="${opportunity?.customer?.id}"/>
  	    <input type="hidden" id="actionFlag" name="actionFlag" value="${actionFlag}"/>
  	    
            <table>
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4"><label for="customerName">客户名称</label>
                                <g:textField id="customerName" name="customerName" value="${opportunity?.customer?.name}" size="40" readonly="true"/>*

                                <g:if test="${actionFlag == 'A'}">
                                    <a id="linkSearchCustomer" href="#">查找客户</a>
                                </g:if>

                                <g:if test="${actionFlag == 'U'}">
                                    <g:link controller="customer" action="viewCustomer" id="${opportunity.customer.id}" target="_blank">客户信息</g:link>
                                </g:if>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><hr/></td>
                        </tr>
                        <tr>
                            <td><label for="status">机会状态</label>
                                <g:select name="status"
                                          from="${valueSetService.getOpportunityStatus()}"
                                          value="${opportunity?.status?.id}"
                                          optionKey="id"
                                          optionValue="code1"
                                          noSelection="['':'']"
                                          />*
                            </td>
                            <td><label for="possibility">可能性</label>
                                <g:select name="possibility"
                                          from="${[0,10,20,30,40,50,60,70,80,90,100]}"
                                          value="${opportunity?.possibility}"
                                          noSelection="['':'']"
                                          />% *
                            </td>
                            <td colspan="2"><label for="product">购买内容</label>
                                <g:select name="product"
                                          from="${valueSetService.getProductList()}"
                                          value="${opportunity?.product?.id}"
                                          optionKey="id"
                                          optionValue="code1"
                                          noSelection="['':'']"
                                          />*
                            </td>
                        </tr>
                        <tr>
                            <td><label for="txtSignedDate">签约时间</label>
                                <g:textField id="txtSignedDate" name="txtSignedDate" 
                                                value="${com.minicrm.StringUtils.getDate(opportunity?.signedDate, 
                                                            com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
                                                size="15"/>
                            </td>
                            <td><label for="contractNumber">合同编号</label>
                                <g:textField name="contractNumber" value="${opportunity?.contractNumber}" size="15"/>
                            </td>
                            <td colspan="2"><label for="contractAmount">合同金额</label>
                                <g:textField name="contractAmount" value="${opportunity?.contractAmount}" size="15"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="impStatus">实施状态</label>
                                <g:select name="impStatus"
                                          from="${valueSetService.getImplementStatus()}"
                                          value="${opportunity?.impStatus?.id}"
                                          optionKey="id"
                                          optionValue="code1"
                                          noSelection="['':'']"
                                          />
                            </td>
                            <td><label for="txtImpStartDate">实施开始时间</label>
                                <g:textField id="txtImpStartDate" name="txtImpStartDate" 
                                                value="${com.minicrm.StringUtils.getDate(opportunity?.impStartDate, 
                                                            com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
                                                size="15"/>
                            </td>
                            <td><label for="txtImpEndDate">实施结束时间</label>
                                <g:textField id="txtImpEndDate" name="txtImpEndDate" 
                                                value="${com.minicrm.StringUtils.getDate(opportunity?.impEndDate,
                                                            com.minicrm.ConstUtils.DATE_DAY_FORMAT)}" 
                                                size="15"/>
                            </td>
                            <td><label for="impArea">实施地区</label>
                                <g:textField name="impArea" value="${opportunity?.impArea}" size="15"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="certificationAccount">开办帐号</label>
                                <g:textField name="certificationAccount" value="${opportunity?.certificationAccount}" size="15"/>
                            </td>
                            <td><label for="certificationNumber">证书编号</label>
                                <g:textField name="certificationNumber" value="${opportunity?.certificationNumber}" size="15"/>
                            </td>
                            <td colspan="2"><label for="impOthers">实施备注</label>
                                <g:textField name="impOthers" value="${opportunity?.impOthers}" size="40"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><label for="remark">备注信息</label>
                                <g:textField name="remark" value="${opportunity?.remark}" size="80"/>
                            </td>
                        </tr>
                </tbody>
            </table>
            </g:form>
        </div>
    </div>
    </body>
</html>
