<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="grails.util.Environment" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>用户登陆</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
        <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
        <asset:stylesheet src="application.css"/>
        <asset:javascript src="application.js"/>
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
        </div>
        <div class="body">
            <g:if test='${flash.message}'>
                <div class='errors'>${flash.message}</div>
            </g:if>

            <div class="loginForm">
            <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
            <h1>用户登陆</h1>
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name" width="45%"><label for="username">用户名</label></td>
                            <td valign="top" class="value">
                                <input type='text' class='text_' name='j_username' id='username' value=''/>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><label for="password">密码</label></td>
                            <td valign="top" class="value">
                                <input type='password' class='text_' name='j_password' id='password' />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><label for="remember_me">记住我</label></td>
                            <td valign="top" class="value">
                                <input type='checkbox' name='${rememberMeParameter}' id='remember_me'
                                <g:if test='${hasCookie}'>checked='checked'</g:if> />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="text-align:center" colspan="2">
                                <input type='submit' value='登陆' />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
            </div>
        </div>
    </body>
    <script type='text/javascript'>
    <!--
    (function(){
            document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
    </script>
    
    <div class="footer" role="contentinfo"><a>miniCRM v<g:meta name="app.version"/> 
    (Base on Grails<g:meta name="app.grails.version"/>)</a></div>
    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>
</html>