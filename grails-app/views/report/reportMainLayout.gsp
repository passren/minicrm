<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>统计报表 > <g:message code="${com.minicrm.ReportUtils.getMessageCode(reportCode)}" /></title>
    </head>
    <body>
        <div class="toolbar">
            <g:link action="exportCsv" id="${reportCode}">导出为CSV</g:link>
            <g:link action="exportExcel" id="${reportCode}">导出为Excel</g:link>
        </div>
        
        <h1>统计报表 > <g:message code="${com.minicrm.ReportUtils.getMessageCode(reportCode)}" /></h1>

        <div id="listResultData">
            <g:render template="${reportCode}" model="[resultData:resultData]" />
        </div>
    </body>
</html>
