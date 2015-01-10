<div class="section">
    <h1>销售活动</h1>
</div>

<div class="list">
	<table>
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
					<td>
						${i+1}
					</td>
					<td><g:link controller="activity" action="viewActivity" id="${activity.id}">
							${activity.summary?.encodeAsHTML()}
						</g:link></td>
					<td><g:link controller="customer" action="viewCustomer"
							id="${activity.customer.id}">
							${activity.customer.name?.encodeAsHTML()}
						</g:link></td>
					<td>
						${activity.type?.code1}
					</td>
					<td><g:formatDate format="yyyy-MM-dd"
							date="${activity.createdDate}" /></td>
					<td><g:formatDate format="yyyy-MM-dd"
							date="${activity.lastUpdatedDate}" /></td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>

<div class="paginate">
	<span>记录数: ${activities.size()}</span>
</div>