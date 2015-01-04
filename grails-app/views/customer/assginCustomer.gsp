<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.minicrm.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>系统管理 > 分配客户</title>

<asset:stylesheet src="redmond/jquery-ui-1.10.4.min.css"/>

<script type="text/javascript">
$(document).ready(function(){
    var customerIds = ${person.customers?.id.toList()};
	
    $("#linkBack").click(function(){
		if(!confirm("尚未保存,确认返回？")) return false;
		location="<g:createLink action='listPersonsForAssignment'/>";
    });
    
    $("#linkSaveForm").click(function(){
        $("#customerIds").val(customerIds);
        $("#formCustomerAssignment").submit();
    });

    $("#linkAddAssignment").click(function(){
        var dialog = $("#dialog-form").dialog({
            autoOpen: false,
            width: 400,
            modal: true,
            buttons: {
                "选择": function(){
                    var selOpts = $("#selCustomers").find("option:selected");
                    if(selOpts.size()>0) {
	                    selOpts.each(function(){
	                		var customerId = $(this).val();
	                		var customerName = $(this).text();
	                		if($.inArray(customerId, customerIds) == -1) {
		                		var lineNum = $("#assignedCustomerList tr").length;
		                		var lineClass = ((lineNum-1)%2==0) ? "odd" : "even";
		                		var newData = "<tr class='"+lineClass+"'><td>"+lineNum+"</td>"+
		                		  "<td><a href='${createLink(controller:'customer', action:'viewCustomer')}/"+customerId+"' target='_blank'>"+customerName+"</a></td>"+
		                		   "<td id='opStatus'>新增加</td>"+
		                		   "<td><input type='checkbox' id='chkCustomer' value='"+customerId+"'/></td></tr>";
		                		$("#assignedCustomerList tr:last").after(newData);
	                		    customerIds.push(customerId);
	                		}
	                	});
	                	
	                    dialog.dialog("close");
                    }
                }, 
                "取消": function(){
                    dialog.dialog("close");
                }
            },
            close: function(){
            }
        });

        $("#search_customer_name").val("");
        $("#selCustomers").empty();
        dialog.dialog("open");
    });
    
    $("#btnSearchCustomer").click(function(){
    	var url = "${createLink(controller:'customer', action:'getAllCustomersAsJson', absolute:true)}";
        searchCustomer(url);
    });

    $("#linkDeleteAssignment").click(function(){
    	$("input[id='chkCustomer']:checkbox:checked").each(function(){
    		var customerId = $(this).val();
   			var trObj = $(this).parent().parent();
            trObj.children("#opStatus").text("需删除");
   			customerIds = deleteCustomerIds(customerId);
        });
    });
    
    function deleteCustomerIds(removeItem) {
        return $.grep(customerIds, function(val) {
            return val != removeItem;
        });
    }
    
});

</script>

</head>
<body>
    <div class="body">
        <div class="toolbar">
            <a id="linkBack" href="#">返回</a>
            <a id="linkSaveForm" href="#">保存</a>
            <a id="linkAddAssignment" href="#">添加客户分配</a>
            <a id="linkDeleteAssignment" href="#">删除客户分配</a>
        </div>

        <h1>系统管理 > 分配客户</h1>
        <g:if test="${flash.message}">
            <div class="message">
                ${flash.message}
            </div>
        </g:if>
        <g:hasErrors bean="${person}">
            <div class="errors">
                <g:renderErrors bean="${person}" as="list" />
            </div>
        </g:hasErrors>

        <div id="dialog-form" title="添加客户分配" style="display:none">
            <table>
                <tbody>
                    <tr>
                        <td>客户名称
                            <input type="text" name="search_customer_name" id="search_customer_name" value="">
                        </td>
                        <td>
                            <input type="button" name="btnSearchCustomer" id="btnSearchCustomer" value="查找">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <select name="selCustomers" id="selCustomers" size="10" style="width:350px;" multiple="multiple"></select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">按住CTRL键可多选</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <g:form name="formCustomerAssignment" action="saveCustomerAssignment">
            <input type="hidden" id="id" name="id" value="${person.id}"/>
            <input type="hidden" id="customerIds" name="customerIds" value=""/>
        </g:form>

        <div class="form">
            <table>
                <thead>
                </thead>
                <tbody>
                    <tr>
                        <td><label for="name">姓名</label>
                            <g:textField name="name" value="${person.name}" size="15" readonly="true"/>
                        </td>
                        <td><label for="jobnumber">工号</label>
                            <g:textField name="jobnumber" value="${person.jobnumber}" size="15" readonly="true"/>
                        </td>
                        <td><label for="jobposition">职位</label>
                            <g:textField name="jobposition" value="${person.jobposition?.code1}" size="15" readonly="true"/>
                        </td>
                        <td><label for="supervisor">主管</label>
                            <g:textField name="supervisor" value="${person.supervisor?.name}" size="15" readonly="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="status">状态</label>
                            <g:textField name="status" value="${person.status?.code1}" size="15" readonly="true"/>
                        </td>
                        <td><label for="username">登陆名</label>
                            <g:textField name="username" value="${person.user?.username}" size="15" readonly="true"/>
                        </td>
                        <td colspan="2"><label for="role">角色</label>
                            <g:textField name="role" value="${person.user?.authorities.collect{it.description}}" size="50" readonly="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><label for="createdDate">创建日期</label>
                            <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${person.createdDate}"/>
                        </td>
                        <td colspan="2"><label for="lastUpdatedDate">更新日期</label>
                            <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${person.lastUpdatedDate}"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="list">
            <h1>客户列表</h1>
            <table id="assignedCustomerList">
                <thead>
                    <tr>
                        <th style="width: 5%">序号</th>
                        <th style="width: 50%">客户名称</th>
                        <th style="width: 20%">更新状态</th>
                        <th style="width: 20%">选择</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${person.customers}" status="i" var="customer">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>
                                ${i+1}
                            </td>
                            <td>
                                <g:link controller="customer" action="viewCustomer" 
                                id="${customer.id}" target="_blank">
                                    ${customer.name?.encodeAsHTML()}
                                </g:link>
                            </td>
                            <td id="opStatus">已保存</td>
                            <td>
                                <g:checkBox name="chkCustomer" value="${customer.id}" checked="false"/>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>