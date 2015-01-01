<%@ page contentType="text/html;charset=UTF-8" %>
<%
    def valueSetService = grailsApplication.mainContext.getBean("valueSetService");
    def areaService = grailsApplication.mainContext.getBean("areaService");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>客户管理 > 维护客户信息</title>

<script type="text/javascript">
$(document).ready(function(){
	$("#linkBack").click(function(){
		if(!confirm("尚未保存,确认返回？")) return false;
		location="<g:createLink action='listCustomers'/>";
	});
	
	$("#linkSaveForm").click(function(){
		$("#formCustomer").submit();
	});

	$("#province").change(function(){
		var province_id = $("#province").val();
		
		if(province_id==null || province_id=="") {
			$("#city").empty();
			return;
		}
		
		$.ajax({
			type: "Post",
			url: "${createLink(action:'getCitiesByProvince', absolute:true)}",
			data: "province_id="+province_id,
			success: function(data) {
				var obj = eval(data);
				$("#city").empty();
				$.each(obj, function (n, value) {
					var option = "<option value='"+value.id+"'>"+value.name+"</option>";
					$("#city").append(option);
				});
			},
			error: function(result, status) {
			}
		});
	});
});
</script>

</head>
<body>
  <div class="body">
  	<div class="toolbar">
  		<a id="linkBack" href="#">返回</a>
		<a id="linkSaveForm" href="#">保存</a>
	</div>
	
  	<h1>客户管理 > 维护客户信息</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${customer}">
	  <div class="errors">
	    <g:renderErrors bean="${customer}" as="list" />
	  </div>
	</g:hasErrors>
  
  	<div class="form">
  	  <g:form name="formCustomer" action="saveCustomer">
  	    <input type="hidden" id="id" name="id" value="${customer?.id}"/>
  	    <input type="hidden" id="actionFlag" name="actionFlag" value="${actionFlag}"/>
  		<table>
  			<thead>
  			</thead>
  			<tbody>
  				<tr>
  					<td colspan="2"><label for="name">客户名称</label>
  						<g:textField name="name" value="${customer?.name}" size="40"/>
  					</td>
  					<td colspan="2"><label for="city">客户区域</label>
  						<g:select name="province"
					          from="${areaService.getProvinces()}"
					          value="${customer?.city?.province?.id}"
					          optionKey="id"
					          optionValue="name"
					          noSelection="['':'']"
					          />
					    -
					    <g:select name="city"
					          from="${areaService.getCitiesByProvince(customer?.city?.province)}"
					          value="${customer?.city?.id}"
					          optionKey="id"
					          optionValue="name"
					          noSelection="['':'']"
					          />
  					</td>
  				</tr>
  				<tr>
  					<td colspan="4"><label for="address">客户地址</label>
						<g:textField name="address" value="${customer?.address}" size="80"/>
  					</td>
  				</tr>
  				<tr>
  					<td><label for="category">客户类型</label>
  						<g:select name="category"
					          from="${valueSetService.getCustomerCategory()}"
					          value="${customer?.category?.id}"
					          optionKey="id"
					          optionValue="code1"
					          noSelection="['':'']"
					          />
	          		</td>
	          		<td><label for="classification">客户定级</label>
	          			<g:select name="classification"
					          from="${valueSetService.getCustomerClassification()}"
					          value="${customer?.classification?.id}"
					          optionKey="id"
					          optionValue="code1"
					          noSelection="['':'']"
					          />
	          		</td>
	          		<td><label for="source">客户来源</label>
				  		<g:select name="source"
					          from="${valueSetService.getCustomerSource()}"
					          value="${customer?.source?.id}"
					          optionKey="id"
					          optionValue="code1"
					          noSelection="['':'']"
					          />
	          		</td>
                                <td><label for="situation">最终情况</label>
				  		<g:select name="situation"
					          from="${valueSetService.getCustomerSituation()}"
					          value="${customer?.situation?.id}"
					          optionKey="id"
					          optionValue="code1"
					          noSelection="['':'']"
					          />
	          		</td>
  				</tr>
  				<tr>
                                        <td><label for="status">客户状态</label>
	          			<g:select name="status"
					          from="${valueSetService.getCustomerStatus()}"
					          value="${customer?.status?.id}"
					          optionKey="id"
					          optionValue="code1"
					          noSelection="['':'']"
					          />
                                        </td>
  					<td colspan="3"><label for="remark">备注信息</label>
						<g:textField name="remark" value="${customer?.remark}" size="80"/>
  					</td>
  				</tr>
  			</tbody>
  		</table>
  	  </g:form>
  	</div>
  </div>
</body>
</html>