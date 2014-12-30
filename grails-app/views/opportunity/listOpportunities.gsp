<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main"/>
        <title>销售机会 > 机会列表</title>
        
        <script type="text/javascript">
        $(document).ready(function(){
                $("#btnClearCriteria").click(function(){
                        $("#search_opportunity_customer_name").val("");
                        $("#search_opportunity_status").val("");
                        $("#search_opportunity_product").val("");
                });
        });
        </script>
    </head>
    <body>
        <div class="toolbar">
            <g:link action="addOpportunity">创建机会</g:link>
        </div>
        
        <h1>销售机会 > 机会列表</h1>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        
        <div class="body">
            <div class="search">
                <g:form name="formSearch" method="post" action="listOpportunities">
                <table>
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4">客户名称
                                <g:textField name="search_opportunity_customer_name" value="${searchCriteria?.search_opportunity_customer_name}" size="30"/>
                            </td>
                        </tr>
                        <tr>
                            <td>机会状态 
                                    <g:select name="search_opportunity_status"
                                      from="${status}"
                                      value="${searchCriteria?.search_opportunity_status}"
                                      optionKey="id" 
                                      optionValue="code1"
                                      noSelection="['':'-请选择-']"/>
                            </td>
                            <td>购买内容
                                <g:select name="search_opportunity_product"
                                          from="${products}"
                                          value="${searchCriteria?.search_opportunity_product}"
                                          optionKey="id" 
                                          optionValue="code1"
                                          noSelection="['':'-请选择-']"/>
                            </td>
                            <td colspan="2">
                                <g:submitButton name="btnSeachCustomer" value="查询" />
                                <input id="btnClearCriteria" name="btnClearCriteria" type="button" value="清除"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
                </g:form>
            </div>
            
            <div class="list">
            <table id="opportunityList">
                <thead>
                    <tr>
                        <th style="width: 2%">序号</th>
                        <th style="width: 10%">机会状态</th>
                        <th style="width: 10%">购买内容</th>
                        <th style="width: 5%">可能性</th>
                        <th style="width: 30%">客户名称</th>
                        <th style="width: 15%">签约时间</th>
                        <th style="width: 15%">合同编号</th>
                        <th style="width: 10%">合同金额</th>
                        <th style="width: 5%">创建日期</th>
                        <th style="width: 5%">更新日期</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${opportunities}" status="i" var="opportunity">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${i+1}</td>
                            <td>${opportunity.status?.code1}</td>
                            <td><g:link action="viewOpportunity" id="${opportunity.id}">${opportunity.product?.code1}</g:link></td>
                            <td>${opportunity.possibility}%</td>
                            <td><g:link controller="customer" action="viewCustomer" id="${opportunity.customer.id}">${opportunity.customer.name?.encodeAsHTML()}</g:link></td>
                            <td><g:formatDate format="yyyy-MM-dd" date="${opportunity.signedDate}"/></td>
                            <td>${opportunity.contractNumber?.encodeAsHTML()}</td>
                            <td>${opportunity.contractAmount?.encodeAsHTML()}</td>
                            <td><g:formatDate format="yyyy-MM-dd" date="${opportunity.createdDate}"/></td>
                            <td><g:formatDate format="yyyy-MM-dd" date="${opportunity.lastUpdatedDate}"/></td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            </div>

            <div class="paginate">

            </div>
        </div>
    </body>
</html>
