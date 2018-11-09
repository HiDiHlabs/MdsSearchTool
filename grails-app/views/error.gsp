%{--
  - Copyright (c) 2018. dkfz
  -
  - Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
  -
  -
  --}%
<!doctype html>
<html>
    <head>
        <title>Grails Runtime Exception</title>
        <meta name="layout" content="main">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
    </head>
    <body>
        <g:renderException exception="${exception}" />
    </body>
</html>