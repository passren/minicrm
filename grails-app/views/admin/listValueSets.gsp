<%@ page contentType="text/html;charset=UTF-8" %>
<%
def valueSetService = grailsApplication.mainContext.getBean("valueSetService");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="layout" content="main"/>

        <script type="text/javascript">
            $(document).ready(function() {
                $("#search_valueset_category").change(function(){
                    location="${createLink(action:'listValueSets')}?search_valueset_category="+$(this).val();
                });
            } );
        </script>

        <title>系统管理 > 值集列表</title>
    </head>
    <body>
        <div class="toolbar">
            <g:link action="addValueSet">创建值集</g:link>
        </div>

        <h1>系统管理 > 值集列表</h1>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        
        <div class="search">
            <table>
                <tbody>
                    <tr>
                        <td>类别过滤
                            <g:select name="search_valueset_category"
                                        from="${valueSetService.getAllCategories()}"
                                        value="${search_valueset_category}"
                                        noSelection="['':'']"
                                        />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
                    
        <div class="list">
            <table id="valueSetList">
                <thead>
                    <tr>
                        <th style="width: 5%">序号</th>
                        <th style="width: 20%">类别</th>
                        <th style="width: 15%">代码</th>
                        <th style="width: 15%">代码一</th>
                        <th style="width: 15%">代码二</th>
                        <th style="width: 15%">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${valueSets}" status="i" var="valueSet">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${i+1}</td>
                            <td>${valueSet.category}</td>
                            <td>${valueSet.code}</td>
                            <td>${valueSet.code1}</td>
                            <td>${valueSet.code2}</td>
                            <td><g:link action="updateValueSet" id="${valueSet.id}">更新</g:link></td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
        <div class="paginate">
            <span>记录数: ${valueSets?.size()}</span>
        </div>
    </body>
</html>