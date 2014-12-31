<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main"/>
        <title>用户登陆</title>
    </head>
    <body>
        <div class="body">
            <h1>用户登陆</h1>
            <g:if test='${flash.message}'>
                <div class='errors'>${flash.message}</div>
            </g:if>

            <div class="loginForm">
            <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name" width="40%"><label for="username">用户名</label></td>
                            <td valign="top" class="value">
                                <input type='text' class='text_' name='j_username' id='username' />
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
</html>