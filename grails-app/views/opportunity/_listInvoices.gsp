<div class="section">
    <h1>发票管理</h1>
</div>

<div class="list">
	<table>
		<thead>
			<tr>
				<th style="width: 2%">序号</th>
				<g:sortableColumn property="invoiceType" title="发票类型"
					style="width: 15%" />
				<g:sortableColumn property="invoiceAmount" title="发票金额"
					style="width: 15%" />
				<g:sortableColumn property="invoiceDate" title="发票日期"
					style="width: 15%" />
				<g:sortableColumn property="invoiceNumber" title="发票号码"
					style="width: 15%" />
				<g:sortableColumn property="remark" title="备注" style="width: 30%" />
				<g:sortableColumn property="createdDate" title="创建日期"
					style="width: 15%" />
				<g:sortableColumn property="lastUpdatedDate" title="更新日期"
					style="width: 15%" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${opportunity.invoices}" status="i" var="invoice">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>
						${i+1}
					</td>
					<td><g:link action="viewInvoice" id="${invoice.id}">
							${invoice.invoiceType.code1}
						</g:link></td>
					<td>
						${invoice.invoiceAmount?.encodeAsHTML()}
					</td>
					<td><g:formatDate format="yyyy-MM-dd"
							date="${invoice.invoiceDate}" /></td>
					<td>
						${invoice.invoiceNumber}
					</td>
					<td>
						${invoice.remark?.encodeAsHTML()}
					</td>
					<td><g:formatDate format="yyyy-MM-dd"
							date="${invoice.createdDate}" /></td>
					<td><g:formatDate format="yyyy-MM-dd"
							date="${invoice.lastUpdatedDate}" /></td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>
<div class="paginate">
	<span>记录数: ${opportunity.invoices?.size()}</span>
</div>