%{--
  - Copyright (c) 2018. dkfz
  -
  - Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
  -
  -
  --}%
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7 ${instance}"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8 ${instance}"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9 ${instance}"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="${instance}"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="${message(code: 'application.title')}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="contextPath" content="${request.contextPath}">
    <meta name="controllerName" content="${controllerName}">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <g:layoutHead/>
    <r:require module="mdsearch"/>
    <r:require module="ie_head"/>
    <r:require module="ie"/>
    <r:layoutResources/>
</head>

<body>
<sec:ifLoggedIn><g:if test="${controllerName != 'home'}">
    <div id="loginOverlay" class="isInvisible">
        <div id=loginOverlayBox>
            <g:message code="login.again"/>
            <a href="${createLink(controller: 'home', action: 'index')}">Login here</a>
            <!--<g:render template="/login/login" model="[account: sec.username()]"/>-->
        </div>
    </div>
</g:if></sec:ifLoggedIn>
<div id="pattern"></div>

<div id="container">
    <div id="logo">
        <div class="logout">
            <sec:ifLoggedIn><g:message code="application.loggedIn"
                                       args="[sec.loggedInUserInfo(field: 'displayName'), sec.username()]"/> | <g:link
                    controller='j_spring_security_logout'><g:message
                        code="application.logout"/></g:link></sec:ifLoggedIn>
        </div>
    </div>
    <g:layoutBody/>
    <div id="push"></div>
</div>
<footer>
    <span>
        <span><a href="${createLink(controller: 'home', action: 'index')}"><g:message
                code="application.link.home"/></a>  | <a
                href="${createLink(controller: 'home', action: 'legal', fragment: 'legal')}"><g:message
                    code="application.link.legal"/></a> | <a
                href="${createLink(controller: 'home', action: 'legal', fragment: 'legal')}"><g:message
                    code="application.copyright"/></a></span>
        <span class=""><g:message code="application.version"/> <g:meta name="app.version"/> (<g:render
                template="/layouts/date"/>, <g:render template="/layouts/version"/>)</span>
    </span>
</footer>
<r:layoutResources/>
</body>
</html>
