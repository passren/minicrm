
<div class="section">
	<h1>收款管理</h1>
</div>

<div class="list">
	<table>
		<thead>
			<tr>
				<th style="width: 2%">序号</th>
				<g:sortableColumn property="receiptMethod" title="收款方式"
					style="width: 15%" />
				<g:sortableColumn property="receiptAmount" title="收款金额"
					style="width: 15%" />
				<g:sortableColumn property="receiptDate" title="收款日期"
					style="width: 15%" />
				<g:sortableColumn property="remark" title="备注" style="width: 30%" />
				<g:sortableColumn property="createdDate" title="创建日期"
					style="width: 15%" />
				<g:sortableColumn property="lastUpdatedDate" title="更新日期"
					style="width: 15%" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${opportunity.receivables}" status="i" var="receivable">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>
						${i+1}
					</td>
					<td><g:link action="viewReceivable" id="${receivable.id}">
							${receivable.receiptMethod.code1}
						</g:link></td>
					<td>
						${receivable.receiptAmount}
					</td>
					<td><g:formatDate format="yyyy-MM-dd"
							date="${receivable.receiptDate}" /></td>
					<td>
						${receivable.remark?.encodeAsHTML()}
					</td>
					<td><g:formatDate format="yyyy-MM-dd"
							date="${receivable.createdDate}" /></td>
					<td><g:formatDate format="yyyy-MM-dd"
							date="${receivable.lastUpdatedDate}" /></td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>

<div class="paginate">
	<span>记录数: ${opportunity.receivables?.size()}</span>
</div>
