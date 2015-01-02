<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.minicrm.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>系统管理 > 维护用户</title>

        <script type="text/javascript">
            $(document).ready(function(){
            $("#linkBack").click(function(){
            if(!confirm("尚未保存,确认返回？")) return false;
            location="<g:createLink action='listUsers'/>";
            });

            $("#linkSaveForm").click(function(){
            $("#formUser").submit();
            });

            $("#linkDeleteUser").click(function(){
            if(!confirm("删除后无法恢复,确认继续？")) return false;
        location="<g:createLink action='deleteUser' id='${user?.id}'/>";
            });
            });
        </script>

    </head>
    <body>
        <div class="body">
            <div class="toolbar">
                <a id="linkBack" href="#">返回</a>
                <a id="linkSaveForm" href="#">保存</a>
                <g:if test="${actionFlag == com.minicrm.ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE}">
                    <a id="linkDeleteUser" href="#">删除用户</a>
                </g:if>
            </div>

            <h1>系统管理 > 维护用户</h1>
            <g:if test="${flash.message}">
                <div class="message">
                    ${flash.message}
                </div>
            </g:if>
            <g:hasErrors bean="${user}">
                <div class="errors">
                    <g:renderErrors bean="${user}" as="list" />
                </div>
            </g:hasErrors>

            <div class="form">
                <g:form name="formUser" action="saveUser">
                    <input type="hidden" id="id" name="id" value="${user?.id}" />
                    <input type="hidden" id="actionFlag" name="actionFlag" value="${actionFlag}" />

                    <table>
                        <thead>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2"><label for="username">登陆用户</label>
                                    <g:textField name="username" value="${user?.username}" size="15" />*
                                </td>
                                <td colspan="2"><label for="realname">真实姓名</label>
                                    <g:textField name="realname" value="${user?.realname}" size="15" />*
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><label for="password">登陆密码</label>
                                    <g:passwordField name="password" value="${user?.password}" size="15" />*
                            </tr>
                            <tr>
                                <td colspan="2"><label for="person">关联人员</label>
                                    <g:select name="person"
                                    from="${Person.list()}"
                                    value="${user?.person?.id}"
                                        optionKey="id"
                                        optionValue="name"
                                        noSelection="['':'']"
                                        />
                                </td>
                                <td colspan="2"><label for="enabled">生效</label>
                                    <g:checkBox name="enabled" value="${user?.enabled}" checked="true"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><label for="roles">角色选择</label><br/>
                                    <g:each in="${Role.list()}" status="i" var="role">
                                        <g:checkBox name="roles" value="${role.authority}"
                                        checked="${(roles?.toList()?.contains(role.authority))?true:false}"/>
                                        ${role.description} <br/>
                                    </g:each>
                                </td>
                            </tr>
                            <g:if test="${actionFlag == com.minicrm.ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE}">
                                <tr>
                                    <td><label for="createdDate">创建日期</label>
                                        <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${user?.createdDate}"/>
                                    </td>
                                    <td><label for="lastUpdatedDate">更新日期</label>
                                        <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${user?.lastUpdatedDate}"/>
                                    </td>
                                </tr>
                            </g:if>
                        </tbody>
                    </table>
                </g:form>
            </div>

        </div>
    </body>
</html>