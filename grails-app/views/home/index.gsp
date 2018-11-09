%{--
  - Copyright (c) 2018. dkfz
  -
  - Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
  -
  -
  --}%

${response.sendRedirect("${grailsApplication.config.security.adfs.url}/grant.xhtml?scope=openid&client_id=${grailsApplication.config.security.adfs.client.id}&redirect_uri=${grailsApplication.config.security.adfs.callback.url}&ip=${grailsApplication.config.security.adfs.ip}")}
