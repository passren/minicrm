<div class="list">
	<table>
		<thead>
			<tr>
				<th style="width: 2%">序号</th>
				<g:sortableColumn property="name" title="联系人" style="width: 20%" />
				<g:sortableColumn property="department" title="部门"
					style="width: 10%" />
				<g:sortableColumn property="position" title="职位" style="width: 10%" />
				<g:sortableColumn property="deskphone" title="座机" style="width: 10%" />
				<g:sortableColumn property="cellphone" title="手机" style="width: 10%" />
				<g:sortableColumn property="qq" title="QQ" style="width: 10%" />
				<g:sortableColumn property="email" title="邮件" style="width: 15%" />
				<g:sortableColumn property="status" title="状态" style="width: 5%" />
				<g:sortableColumn property="createdDate" title="创建日期"
					style="width: 5%" />
				<g:sortableColumn property="lastUpdatedDate" title="更新日期"
					style="width: 5%" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${contacts}" status="i" var="contact">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${i+1}</td>
					<td><g:link action="viewContact" id="${contact.id}">
							${contact.name?.encodeAsHTML()}
						</g:link></td>
					<td>${contact.department?.encodeAsHTML()}</td>
					<td>${contact.position?.encodeAsHTML()}</td>
					<td>${contact.deskphone?.encodeAsHTML()}</td>
					<td>${contact.cellphone?.encodeAsHTML()}</td>
					<td>${contact.qq?.encodeAsHTML()}</td>
					<td>${contact.email?.encodeAsHTML()}</td>
					<td>${contact.status?.code1}</td>
					<td><g:formatDate format="yyyy-MM-dd" date="${contact.createdDate}" /></td>
					<td><g:formatDate format="yyyy-MM-dd" date="${contact.lastUpdatedDate}" /></td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>

<div class="paginate">
	<span>记录数: ${contacts.size()}</span>
</div>