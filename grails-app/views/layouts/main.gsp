<%@ page import="grails.util.Environment" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
        <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

    <g:layoutHead/>
</head>
<body>
    <div id="banner" role="banner">
        <div id="logo">
            <g:link controller="."><asset:image src="logo.png" alt="MiniCRM"/></g:link>
            <g:if test="${Environment.current==Environment.DEVELOPMENT}">
                <span>开发环境</span>
            </g:if>
            <g:if test="${Environment.current==Environment.TEST}">
                <span>测试环境</span>
            </g:if>
        </div>
        <div id="authority">
            <sec:ifNotLoggedIn>
            <g:link controller="login" action="auth">登陆</g:link>
            </sec:ifNotLoggedIn>

            <sec:ifLoggedIn>
            您好, <sec:username/>! <g:link uri="/logout">登出</g:link>
            </sec:ifLoggedIn>
        </div>
    </div>

    <div id="menu" role="complementary">
        <h1>销售跟踪</h1>
        <ul>
            <li><asset:image src="link.gif" /> <g:link controller="customer">客户管理</g:link></li>
            <li><asset:image src="link.gif" /> <g:link controller="activity">销售活动</g:link></li>
            <li><asset:image src="link.gif" /> <g:link controller="opportunity">机会跟踪</g:link></li>
            <li><asset:image src="link.gif" /> <g:link controller="serviceRequest">售后服务</g:link></li>
            <sec:ifAnyGranted roles="${com.minicrm.ConstUtils.ROLE_SALES_MANAGER}, ${com.minicrm.ConstUtils.ROLE_ADMIN}, ${com.minicrm.ConstUtils.ROLE_GENERAL_MANAGER}">
                <li><asset:image src="link.gif" /> <g:link controller="customer" action="listPersonsForAssignment">客户分配</g:link></li>
            </sec:ifAnyGranted>
        </ul>
        <sec:ifAnyGranted roles="${com.minicrm.ConstUtils.ROLE_GENERAL_MANAGER}">
        <h1>统计报表</h1>
        <ul>
            <li><asset:image src="link.gif" /> <g:link controller="report" action="customerDist"><g:message code="${com.minicrm.ReportUtils.getMessageCode('customerDist')}" /></g:link></li>
        </ul>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="${com.minicrm.ConstUtils.ROLE_ADMIN}">
            <h1>系统管理</h1>
            <ul>
                <li><asset:image src="link.gif" /> <g:link controller="admin" action="listUsers">用户管理</g:link></li>
                <li><asset:image src="link.gif" /> <g:link controller="admin" action="listPersons">人员管理</g:link></li>
                <li><asset:image src="link.gif" /> <g:link controller="admin" action="listValueSets">值集维护</g:link></li>
            </ul>
        </sec:ifAnyGranted>
    </div>

    <div id="page-body" role="main">
        <g:layoutBody/>
    </div>

    <div class="footer" role="contentinfo"><a>miniCRM v<g:meta name="app.version"/> 
    (Base on Grails<g:meta name="app.grails.version"/>)</a></div>
    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>
</body>
</html>
