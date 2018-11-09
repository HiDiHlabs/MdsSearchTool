%{--
  - Copyright (c) 2018. dkfz
  -
  - Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
  -
  -
  --}%

<form id="login-form" method="POST" action="${createLink(controller: 'login', action: 'auth')}">
    <table>
        <tr><td><label for="account"> <g:message code="login.account" /> </label></td></tr>
        <tr><td><input name="j_username" id="account" value="${account}" required></td></tr>
        <tr><td><label for="password"> <g:message code="login.password" /></label></td></tr>
        <tr><td><input name="j_password" id="password" type="password" required></td></tr>
        <tr><td><div id="message-box"></div><div class="loginButton isInvisible"><input type="submit" id="submit" value="Login"/></div></td></tr>
    </table>
</form>
