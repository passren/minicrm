<div class="chart">
    <h1>
        <asset:image src="skin/database_table.png" alt="Chart"/>
        <g:link action="customerDist">数据表</g:link>
    </h1>

    <%
    	def reportService = grailsApplication.mainContext.getBean("reportService")
    	def chartImg = reportService.drawCustomerDistChart(resultData, "", "", "")
    %>

    <g:img dir="${com.minicrm.ConstUtils.CHART_IMAGES_DIR}" file="${chartImg}" />
</div>