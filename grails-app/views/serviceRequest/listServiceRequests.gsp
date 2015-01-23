<%@ page contentType="text/html;charset=UTF-8" %>
<%
    def valueSetService = grailsApplication.mainContext.getBean("valueSetService");
    def pageOffset = params.offset?params.int("offset"):0
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>售后服务 > 服务请求列表</title>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnClearCriteria").click(function(){
		$("#search_sr_customer_name").val("");
		$("#search_sr_class").val("");
		$("#search_sr_status").val("");
		$("#search_sr_maintainer").val("");
	});

  $("#maxPageSize").change(function(){
      $("#max").val($("#maxPageSize").val());
      $("#formSearch").submit();
  });
});
</script>

</head>
<body>
    <div class="toolbar">
        <g:link action="addServiceRequest">创建服务请求</g:link>
    </div>
    
  <h1>售后服务 > 服务请求列表</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>

  <div class="body">
    <div class="search">
        <g:form name="formSearch" method="post" action="listServiceRequests">
        <input type="hidden" id="max" name="max" value="${searchCriteria.max}"/>
        <table>
            <thead>
            </thead>
            <tbody>
                <tr>
                    <td colspan="4">客户名称
                            <g:textField name="search_sr_customer_name" value="${searchCriteria?.search_sr_customer_name}" size="30"/>
                    </td>
                </tr>
                <tr>
                    <td>服务定级
                        <g:select name="search_sr_class"
                              from="${valueSetService.getServiceClass()}"
                              value="${searchCriteria?.search_sr_class}"
                              optionKey="id" 
                              optionValue="code1"
                              noSelection="['':'-请选择-']"/>
                    </td>
                    <td>服务状态
                        <g:select name="search_sr_status"
                              from="${valueSetService.getServiceStatus()}"
                              value="${searchCriteria?.search_sr_status}"
                              optionKey="id" 
                              optionValue="code1"
                              noSelection="['':'-请选择-']"/>
                    </td>
                    <td>维护人
                        <g:textField name="search_sr_maintainer" value="${searchCriteria?.search_sr_maintainer}" size="15"/>
                    </td>
                    <td>
                        <g:submitButton name="btnSeachCustomer" value="查询" />
                        <input id="btnClearCriteria" name="btnClearCriteria" type="button" value="清除"/>
                    </td>
                </tr>
            </tbody>
        </table>
        </g:form>
    </div>
  	
    <div class="list">
    <table id="serviceRequestList">
        <thead>
            <tr>
                <th style="width: 2%">序号</th>
                <th style="width: 40%">服务请求</th>
                <th style="width: 30%">客户名称</th>
                <th style="width: 10%">服务定级</th>
                <th style="width: 10%">服务状态</th>
                <th style="width: 10%">完成日期</th>
                <th style="width: 10%">维护人</th>
                <th style="width: 5%">创建日期</th>
                <th style="width: 5%">更新日期</th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${serviceRequests}" status="i" var="serviceRequest">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td>${pageOffset+i+1}</td>
                    <td><g:link action="viewServiceRequest" id="${serviceRequest.id}">${serviceRequest.name?.encodeAsHTML()}</g:link></td>
                    <td><g:link controller="customer" action="viewCustomer" id="${serviceRequest.customer.id}">${serviceRequest.customer.name?.encodeAsHTML()}</g:link></td>
                    <td>${serviceRequest.classification?.code1}</td>
                    <td>${serviceRequest.status?.code1}</td>
                    <td><g:formatDate format="yyyy-MM-dd" date="${serviceRequest.completedDate}"/></td>
                    <td>${serviceRequest.maintainer?.encodeAsHTML()}</td>
                    <td><g:formatDate format="yyyy-MM-dd" date="${serviceRequest.createdDate}"/></td>
                    <td><g:formatDate format="yyyy-MM-dd" date="${serviceRequest.lastUpdatedDate}"/></td>
                </tr>
            </g:each>
        </tbody>
    </table>
    </div>

    <div class="paginate">
      <g:paginate controller="serviceRequest" action="listServiceRequests" total="${serviceRequests?.totalCount}"
                   params="${searchCriteria}"
                   next="&gt;" prev="&lt;" max="${searchCriteria.max}"/>
      <span>
        <g:if test="${serviceRequests!=null && serviceRequests.totalCount>0}">
          <g:select name="maxPageSize"
                          from="${[5, 10, 20, 50, 100]}"
                          value="${searchCriteria.max}"/>
        </g:if>
      </span>
      <span>总记录数: ${serviceRequests?.totalCount}</span>
    </div>
  </div>
</body>
</html>