<div class="section">
    <h1>关联销售机会</h1>
</div>

<div class="list">
	<table>
		<thead>
			<tr>
				<th style="width: 10%">机会状态</th>
				<th style="width: 20%">购买内容</th>
				<th style="width: 5%">可能性</th>
				<th style="width: 15%">签约时间</th>
				<th style="width: 15%">合同编号</th>
				<th style="width: 10%">合同金额</th>
				<th style="width: 10%">实施状态</th>
				<th style="width: 5%">创建日期</th>
				<th style="width: 5%">更新日期</th>
			</tr>
		</thead>
		<tbody>
			<tr class="odd">
				<td>${opportunity.status?.code1}</td>
				<td>
				   <g:link controller="opportunity" action="viewOpportunity" id="${opportunity.id}">
						${opportunity.product?.code1}
					</g:link>
				</td>
				<td>${opportunity.possibility}%</td>
				<td>
				   <g:formatDate format="yyyy-MM-dd"
						date="${opportunity.signedDate}" />
				</td>
				<td>${opportunity.contractNumber?.encodeAsHTML()}</td>
				<td>${opportunity.contractAmount?.encodeAsHTML()}</td>
				<td>${opportunity.impStatus?.code1}</td>
				<td>
				   <g:formatDate format="yyyy-MM-dd"
						date="${opportunity.createdDate}" />
				</td>
				<td>
				   <g:formatDate format="yyyy-MM-dd"
						date="${opportunity.lastUpdatedDate}" />
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="paginate">
	
</div>