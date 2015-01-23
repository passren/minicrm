<%@ page contentType="text/html;charset=UTF-8" %>
<%
  def pageOffset = params.offset?params.int("offset"):0
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="layout" content="main"/>

        <script type="text/javascript" class="init">
            $(document).ready(function() {
            //$('#userList').DataTable();

            $("#maxPageSize").change(function(){
                location = "<g:createLink controller="customer" action='listPersonsForAssignment' />?max="+$("#maxPageSize").val();
            });
            } );
        </script>

        <title>系统管理 > 分配人员列表</title>
    </head>
    <body>
        <h1>系统管理 > 分配人员列表</h1>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>

        <div class="list">
            <table id="userList">
                <thead>
                    <tr>
                        <g:sortableColumn property="id" title="序号" style="width: 5%"/>
                        <g:sortableColumn property="name" title="姓名" style="width: 15%"/>
                        <th style="width: 10%">分配数量</th>
                        <g:sortableColumn property="jobnumber" title="工号" style="width: 15%"/>
                        <th style="width: 15%">登陆名</th>
                        <th style="width: 15%">角色</th>
                        <g:sortableColumn property="createdDate" title="创建日期" style="width: 10%"/>
                        <g:sortableColumn property="lastUpdatedDate" title="更新日期" style="width: 10%"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${persons}" status="i" var="person">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${pageOffset+i+1}</td>
                            <td><g:link action="assginCustomerForPerson" id="${person.id}">${person.name?.encodeAsHTML()}</g:link></td>
                            <td>${person.customers.size()}</td>
                            <td>${person.jobnumber?.encodeAsHTML()}</td>
                            <td>${person.user?.username}</td>
                            <td>
                                <g:each in="${person.user?.authorities}">[${it.description}]</g:each>
                            </td>
                            <td><g:formatDate format="yyyy-MM-dd" date="${person.createdDate}"/></td>
                            <td><g:formatDate format="yyyy-MM-dd" date="${person.lastUpdatedDate}"/></td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
        <div class="paginate">
          <g:paginate controller="customer" action="listPersonsForAssignment" total="${persons?persons.totalCount:0}"
                       next="&gt;" prev="&lt;" />
            <span>
              <g:if test="${persons!=null && persons.totalCount>0}">
                <g:select name="maxPageSize"
                                  from="${[5, 10, 20, 50, 100]}"
                                  value="${params.max}"/>
              </g:if>
            </span>
          <span>总记录数: ${persons?persons.totalCount:0}</span>
        </div>
    </body>
</html>