<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.minicrm.*" %>
<%
def valueSetService = grailsApplication.mainContext.getBean("valueSetService");
def personService = grailsApplication.mainContext.getBean("personService");
def supervisors = personService.getPersonsWithoutSelf(person);
supervisors = supervisors==null ? Person.list() : supervisors
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>系统管理 > 维护人员</title>

        <script type="text/javascript">
            $(document).ready(function(){
            $("#linkBack").click(function(){
            if(!confirm("尚未保存,确认返回？")) return false;
            location="<g:createLink action='listPersons'/>";
            });

            $("#linkSaveForm").click(function(){
            $("#formPerson").submit();
            });

            $("#linkDeletePerson").click(function(){
            if(!confirm("删除后无法恢复,确认继续？")) return false;
        location="<g:createLink action='deletePerson' id='${person?.id}'/>";
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
                    <a id="linkDeletePerson" href="#">删除人员</a>
                </g:if>
            </div>

            <h1>系统管理 > 维护人员</h1>
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

            <div class="form">
                <g:form name="formPerson" action="savePerson">
                    <input type="hidden" id="id" name="id" value="${person?.id}" />
                    <input type="hidden" id="actionFlag" name="actionFlag" value="${actionFlag}" />

                    <table>
                        <thead>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2"><label for="name">姓名</label>
                                    <g:textField name="name" value="${person?.name}" size="15" />*
                                </td>
                                <td colspan="2"><label for="jobnumber">工号</label>
                                    <g:textField name="jobnumber" value="${person?.jobnumber}" size="15" />
                                </td>
                            </tr>
                            <tr> 
                                <td colspan="2"><label for="jobposition">职位</label>
                                    <g:select name="jobposition"
                                    from="${valueSetService.getPersonPosition()}"
                                    value="${person?.jobposition?.id}"
                                        optionKey="id"
                                        optionValue="code1"
                                        noSelection="['':'']"
                                        />
                                </td>
                                <td colspan="2"><label for="supervisor">主管</label>
                                    <g:select name="supervisor"
                                    from="${supervisors}"
                                    value="${person?.supervisor?.id}"
                                        optionKey="id"
                                        optionValue="name"
                                        noSelection="['':'']"
                                        />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><label for="status">状态</label>
                                    <g:select name="status"
                                    from="${valueSetService.getPersonStatus()}"
                                    value="${person?.status?.id}"
                                        optionKey="id"
                                        optionValue="code1"
                                        noSelection="['':'']"
                                        />
                            </tr>
                            <g:if test="${actionFlag == com.minicrm.ConstUtils.CONTROLLER_ACTION_FLAG_UPDATE}">
                                <tr>
                                    <td colspan="2"><label for="createdDate">创建日期</label>
                                        <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${person?.createdDate}"/>
                                    </td>
                                    <td colspan="2"><label for="lastUpdatedDate">更新日期</label>
                                        <g:formatDate format="${com.minicrm.ConstUtils.DATE_TIME_FORMAT}" date="${person?.lastUpdatedDate}"/>
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