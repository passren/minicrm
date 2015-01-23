<%@ page contentType="text/html;charset=UTF-8" %>
<%
  def valueSetService = grailsApplication.mainContext.getBean("valueSetService");
	def areaService = grailsApplication.mainContext.getBean("areaService");
  def pageOffset = params.offset?params.int("offset"):0
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>客户管理 > 客户列表</title>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnClearCriteria").click(function(){
		$("#search_customer_name").val("");
		$("#search_customer_province").val("");
		$("#search_customer_category").val("");
		$("#search_customer_classification").val("");
		$("#search_customer_source").val("");
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
        <g:link action="addCustomer">创建客户</g:link>
    </div>
    
    <h1>客户管理 > 客户列表</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    
    <div class="body">
  	<div class="search">
            <g:form name="formSearch" method="get" action="listCustomers">
            <input type="hidden" id="max" name="max" value="${searchCriteria.max}"/>
            <table>
                <thead>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2">客户名称
                            <g:textField name="search_customer_name" value="${searchCriteria?.search_customer_name}" size="30"/>
                        </td>
                        <td colspan="2">客户区域
                            <g:select name="search_customer_province"
                              from="${areaService.getProvinces()}"
                              value="${searchCriteria?.search_customer_province}"
                              optionKey="id"
                              optionValue="name"
                              noSelection="['':'-请选择-']"
                              />
                        </td>
                    </tr>
                    <tr>
                        <td>客户类型 
                                <g:select name="search_customer_category"
                                  from="${valueSetService.getCustomerCategory()}"
                                  value="${searchCriteria?.search_customer_category}"
                                  optionKey="id" 
                                  optionValue="code1"
                                  noSelection="['':'-请选择-']"/>
                        </td>
                        <td>客户定级
                            <g:select name="search_customer_classification"
                                      from="${valueSetService.getCustomerClassification()}"
                                      value="${searchCriteria?.search_customer_classification}"
                                      optionKey="id" 
                                      optionValue="code1"
                                      noSelection="['':'-请选择-']"/>
                        </td>
                        <td>客户来源
                            <g:select name="search_customer_source"
                                      from="${valueSetService.getCustomerSource()}"
                                      value="${searchCriteria?.search_customer_source}"
                                      optionKey="id" 
                                      optionValue="code1"
                                      noSelection="['':'-请选择-']"/>
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
  	<table id="customerList">
       	<thead>
			<tr>
				<th style="width: 2%">序号</th>
				<th style="width: 30%">客户名称</th>
				<th style="width: 45%">客户地址</th>
				<th style="width: 5%">客户类型</th>
				<th style="width: 5%">客户定级</th>
				<th style="width: 5%">客户来源</th>
                                <th style="width: 5%">最终情况</th>
				<th style="width: 2%">创建日期</th>
				<th style="width: 2%">更新日期</th>
				<th style="width: 2%">状态</th>
				<!--
		        <g:sortableColumn property="name" title="客户名称" style="width: 30%"/>
		        <g:sortableColumn property="address" title="客户地址" style="width: 50%"/>
		        <g:sortableColumn property="category.code1" title="客户类型" style="width: 5%"/>
		        <g:sortableColumn property="classification" title="客户定级" style="width: 5%"/>
		        <g:sortableColumn property="source" title="客户来源" style="width: 5%"/>
		        <g:sortableColumn property="createdDate" title="创建日期" style="width: 2%"/>
		        <g:sortableColumn property="lastUpdatedDate" title="更新日期" style="width: 2%"/>
		        <g:sortableColumn property="status" title="状态" style="width: 2%"/>
		        -->
	        </tr>
        </thead>
		<tbody>
			<g:each in="${customers}" status="i" var="customer">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${pageOffset+i+1}</td>
					<td><g:link action="viewCustomer" id="${customer.id}">${customer.name?.encodeAsHTML()}</g:link></td>
					<td>${customer.city.province.name}-${customer.city.name}-${customer.address?.encodeAsHTML()}</td>
					<td>${customer.category?.code1}</td>
					<td>${customer.classification?.code1}</td>
					<td>${customer.source?.code1}</td>
                                        <td>${customer.situation?.code1}</td>
					<td><g:formatDate format="yyyy-MM-dd" date="${customer.createdDate}"/></td>
					<td><g:formatDate format="yyyy-MM-dd" date="${customer.lastUpdatedDate}"/></td>
					<td>${customer.status?.code1}</td>
				</tr>
	       </g:each>
       </tbody>
	</table>
  	</div>
  	
	<div class="paginate">
	  <g:paginate controller="customer" action="listCustomers" total="${customers?.totalCount}"
	               params="${searchCriteria}"
	               next="&gt;" prev="&lt;" max="${searchCriteria.max}"/>
    <span>
      <g:if test="${customers!=null && customers.totalCount>0}">
        <g:select name="maxPageSize"
                          from="${[5, 10, 20, 50, 100]}"
                          value="${searchCriteria.max}"/>
      </g:if>
    </span>
	  <span>总记录数: ${customers?.totalCount}</span>
	</div>
  </div>
</body>
</html>