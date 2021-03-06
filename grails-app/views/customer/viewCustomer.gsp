<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>客户管理 > 客户信息</title>
    </head>
    <body>
        <div class="body">
            <div class="toolbar">
                <g:link action="listCustomers">返回</g:link>
                <g:link action="updateCustomer" id="${customer.id}">更新客户信息</g:link>
                <g:link action="addContact" id="${customer.id}">创建联系人</g:link>
                </div>

            <h1>客户管理 > 客户信息</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>

            <div class="form">
                <table>
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="2"><label for="customer.name">客户名称</label>
                                <g:textField name="customer.name" value="${customer.name}" size="40" readonly="true"/></td>
                            <td colspan="2"><label for="customer.city">客户区域</label>
                                <g:textField name="customer.province" value="${customer.city?.province?.name}" size="15" readonly="true"/> -
                                <g:textField name="customer.city" value="${customer.city?.name}" size="15" readonly="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><label for="customer.address">客户地址</label>
                                <g:textField name="customer.address" value="${customer.address}" size="80" readonly="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="customer.category">客户类型</label>
                                <g:textField name="customer.category" value="${customer.category?.code1}" size="15" readonly="true"/>
                            </td>
                            <td><label for="customer.classification">客户定级</label>
                                <g:textField name="customer.classification" value="${customer.classification?.code1}" size="15" readonly="true"/>
                            </td>
                            <td><label for="customer.source">客户来源</label>
                                <g:textField name="customer.source" value="${customer.source?.code1}" size="15" readonly="true"/>
                            </td>
                            <td><label for="customer.source">最终情况</label>
                                <g:textField name="customer.situation" value="${customer.situation?.code1}" size="15" readonly="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="customer.status">客户状态</label>
                                <g:textField name="customer.status" value="${customer.status?.code1}" size="15" readonly="true"/>
                            </td>
                            <td colspan="3"><label for="customer.remark">客户备注</label>
                                <g:textField name="customer.remark" value="${customer.remark}" size="80" readonly="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="customer.createdDate">创建日期</label>
                                <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${customer.createdDate}"/>
                            </td>
                            <td><label for="customer.createUser">创建人员</label>
                                ${customer.createUser.realname}
                            </td>
                            <td><label for="customer.lastUpdatedDate">更新日期</label>
                                <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${customer.lastUpdatedDate}"/>
                            </td>
                            <td><label for="customer.lastUpdateUser">更新人员</label>
                                ${customer.lastUpdateUser.realname}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="listContacts">
                <g:render template="listContacts" model="[contacts:contacts]" />
            </div>
        </div>
    </body>
</html>