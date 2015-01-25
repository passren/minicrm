<div class="list">
    <h1>
        <asset:image src="skin/chart.png" alt="Chart"/>
        <g:link action="customerDistChart">分布图</g:link>
    </h1>
    <table>
        <thead>
            <tr>
                <th style="width: 5%">序号</th>
                <th style="width: 30%">省份</th>
                <th style="width: 30%">城市</th>
                <th style="width: 20%">客户数量</th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${resultData}" status="i" var="result">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td>${i+1}</td>
                    <td>${result.provinceName}</td>
                    <td>${result.cityName}</td>
                    <td>${result.customerNum}</td>
                </tr>
            </g:each>
        </tbody>
    </table>
</div>