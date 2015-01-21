<%@ page contentType="text/html;charset=UTF-8" %>
<%
    def valueSetService = grailsApplication.mainContext.getBean("valueSetService");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>销售活动 > 活动列表</title>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnClearCriteria").click(function(){
		$("#search_activity_customer_name").val("");
		$("#search_activity_summary").val("");
		$("#search_activity_type").val("");
	});
});
</script>

</head>
<body>
    <div class="toolbar">
            <g:link action="addActivity">创建活动</g:link>
    </div>
    
  <h1>销售活动 > 活动列表</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>

  <div class="body">
    <div class="search">
        <g:form name="formSearch" method="get" action="listActivities">
        <table>
            <thead>
            </thead>
            <tbody>
                <tr>
                    <td colspan="4">客户名称
                            <g:textField name="search_activity_customer_name" value="${searchCriteria?.search_activity_customer_name}" size="30"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">活动概要
                        <g:textField name="search_activity_summary" value="${searchCriteria?.search_activity_summary}" size="30"/>
                    </td>
                    <td>活动类型
                        <g:select name="search_activity_type"
                              from="${valueSetService.getActivityType()}"
                              value="${searchCriteria?.search_activity_type}"
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
    <table id="activityList">
        <thead>
            <tr>
                <th style="width: 2%">序号</th>
                <th style="width: 40%">活动概要</th>
                <th style="width: 25%">客户名称</th>
                <th style="width: 8%">活动类型</th>
                <th style="width: 15%">创建日期</th>
                <th style="width: 15%">更新日期</th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${activities}" status="i" var="activity">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td>${i+1}</td>
                    <td><g:link action="viewActivity" id="${activity.id}">${activity.summary?.encodeAsHTML()}</g:link></td>
                    <td><g:link controller="customer" action="viewCustomer" id="${activity.customer.id}">${activity.customer.name?.encodeAsHTML()}</g:link></td>
                    <td>${activity.type?.code1}</td>
                    <td><g:formatDate format="yyyy-MM-dd" date="${activity.createdDate}"/></td>
                    <td><g:formatDate format="yyyy-MM-dd" date="${activity.lastUpdatedDate}"/></td>
                </tr>
            </g:each>
        </tbody>
    </table>
    </div>

    <div class="paginate">
      <g:paginate controller="activity" action="listActivities" total="${activities.totalCount}"
                   params="${searchCriteria}"
                   next="&gt;" prev="&lt;" max="${com.minicrm.ConstUtils.PAGE_MAX_RECORDS}"/>
      <span>总记录数: ${activities.totalCount}</span>
    </div>
  </div>
</body>
</html>