<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.minicrm.*" %>
<%
def valueSetService = grailsApplication.mainContext.getBean("valueSetService");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>系统管理 > 维护值集</title>

        <script type="text/javascript">
            $(document).ready(function(){
                $("#linkBack").click(function(){
                    if(!confirm("尚未保存,确认返回？")) return false;
                    location="<g:createLink action='listValueSets'/>";
                });

                $("#linkSaveForm").click(function(){
                    $("#formValueSet").submit();
                });

                $("#linkDeleteValueSet").click(function(){
                    if(!confirm("删除后无法恢复,确认继续？")) return false;
                        location="<g:createLink action='deleteValueSet' id='${valueSet?.id}'/>";
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
                    <a id="linkDeleteValueSet" href="#">删除值集</a>
                </g:if>
            </div>

            <h1>系统管理 > 维护值集</h1>
            <g:if test="${flash.message}">
                <div class="message">
                    ${flash.message}
                </div>
            </g:if>
            <g:hasErrors bean="${valueSet}">
                <div class="errors">
                    <g:renderErrors bean="${valueSet}" as="list" />
                </div>
            </g:hasErrors>

            <div class="form">
                <g:form name="formValueSet" action="saveValueSet">
                    <input type="hidden" id="id" name="id" value="${valueSet?.id}" />
                    <input type="hidden" id="actionFlag" name="actionFlag" value="${actionFlag}" />

                    <table>
                        <thead>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2"><label for="category">类别</label>
                                    <g:textField name="category" value="${valueSet?.category}" size="15" />*
                                </td>
                                <td colspan="2"><label for="code">代码</label>
                                    <g:textField name="code" value="${valueSet?.code}" size="15" />*
                                </td>
                            </tr>
                            <tr> 
                                <td colspan="2"><label for="code1">代码一</label>
                                    <g:textField name="code1" value="${valueSet?.code1}" size="15" />
                                </td>
                                <td colspan="2"><label for="code2">代码二</label>
                                    <g:textField name="code2" value="${valueSet?.code2}" size="15" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </g:form>
            </div>

        </div>
    </body>
</html>