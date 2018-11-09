%{--
  - Copyright (c) 2018. dkfz
  -
  - Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
  -
  -
  --}%
<head>
    <title>
        <g:message code="search.page.title"/>
    </title>
</head>

<body>
<table class="bgStructureTable">
    <tr>
        <td class="bgStructureTableCell">
            <div id="content">
                <div id="left-content">
                    <div class="queryResultContainer">
                        <div class="queryResultHeader">
                            <div id="logo">
                                <span class="logo">DKTK Zentrale Suche</span>
                            </div>
                        </div>

                        <div class="queryResultNav">
                            <div class="queryResultNavItem queryResultHitContainer">
                                <div class="queryResultHits">
                                    Patienten:<span id="pat" style="display:none"><span style="padding-left:20px;"><span
                                        id="patHits">0</span> Treffer <span style="color: #00aa00;">(Gesamtzahl: <span
                                        id="patPosHits">0</span> )</span></span>

                                    <div class="info tooltip infoHits "
                                         title="Treffer: Anzahl Patienten, für die die Suchkriterien exakt zutreffen&#013;Gesamtzahl: Alle vorhandenen Patienten"></div>
                                </span>
                                    <br/>
                                    Biomaterial:<span id="sam" style="display:none"><span
                                        id="sampleHits">0</span> Treffer <span
                                        style="color: #00aa00;">(Gesamtzahl: <span id="samplePosHits">0</span> )</span>

                                    <div class="info tooltip infoHits"
                                         title="Treffer: Anzahl Proben, für die die Suchkriterien exakt zutreffen&#013;Gesamtzahl: Alle vorhandenen Proben"></div>
                                </span>
                                </div>
                            </div>

                            <!--  <div class="queryResultNavItem queryResultClose"> <div> <g:message
                                    code="search.result.close"/>  </div></div>-->
                        </div>

                        <div class="queryResultChartContainer">
                            <div class="queryResultChartHeader" id="decentralsearch">
                                <div class="chartText">Weiter zur Dezentralen Suche</div>

                                <div class="currently-loading" style="display:none;"></div>
                            </div>
                        </div>

                        <div class="queryResultChartContainer">
                            <div class="queryResultChartHeader" id="searchcriteria">
                                <div class="chartText">Suchkriterien</div>

                                <div class="arrow chartArrow"></div>
                            </div>

                            <div class="queryResultChartContent">
                                <div class="resultBarXAxisContainer">
                                    <div class="resultContainer">
                                        <div class="resultDiv"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="queryResultChartContainer">
                            <div class="queryResultChartHeader" id="chart">
                                <div class="chartText"><g:message code="search.result.chart"/></div>

                                <div class="arrow chartArrow" style="transform: rotate(0deg);"></div>
                            </div>

                            <div class="queryResultChartContent" style="display:none;">
                                <div class="resultBarXAxisContainer">
                                    <div style="padding-left:18px;">Anzahl</div>

                                    <div class="selectBoxBar">
                                        <g:select name="entityType" class="resultBarEntityType" from="${entityTypes}"
                                                  optionKey="key" optionValue="name"/>
                                    </div>

                                    <div>gruppiert nach</div>

                                    <div class="selectBoxBar">
                                        <g:select name="groupBy" class="resultBarXAxis" from="${groupBy}"
                                                  optionKey="key" optionValue="value"/>
                                    </div>
                                </div>
                                <canvas id="resultBar" width="558" height="546"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="searchNavContainer">
                    <div class="itemMedium  noTopBorder" style="background: transparent;"><div
                            class="caption">&nbsp;</div></div>

                    <div class="queryNavItem itemLarge white itemRunQuery"><div
                            class="caption"><span>Abfrage starten</span></div><a href="#"
                                                                                 class="btnRunQuery"><span><g:message
                                code="search.query.run.go"/></span></a></div>

                    <div class="groupContainer">
                        <div class="queryNavItem">
                            <div class="groupResetButton"><img
                                    src="${resource(dir: 'images', file: 'image-reset-th.png')}" class="tooltip"
                                    title="${g.message(code: 'search.query.reset')}"></div>

                            <div class="groupDeleteButton isInvisible"><img
                                    src="${resource(dir: 'images', file: 'red-cross-th.png')}" class="tooltip"
                                    title="${g.message(code: 'search.query.delete')}"></div>
                        </div>
                        <g:each var="group" in="${groups}">
                            <g:if test="${!group.key.equals("TNM")}">
                                <div class="queryNavItem queryNavItem_group white">
                                    <div class="bullet groupBullet"></div>

                                    <div class="text groupText">${group?.key}</div>

                                    <div class="arrow groupArrow"></div>
                                </div>
                                <g:if test="${group.value.size == 1}">
                                    <g:set var="propertyContainer" value="propertyContainerSingleAttribute"/>
                                </g:if>
                                <g:else>
                                    <g:set var="propertyContainer" value=""/>
                                </g:else>
                                <div class="propertyContainer ${propertyContainer}">
                                    <g:each status="i" var="attribute" in="${group.value}">
                                        <g:if test="${!(attribute.key.equals('urn_dktk_dataelement_23'))}">
                                            <g:if test="${!attribute.key.equals("TNM") && !attribute.key.equals("urn_dktk_dataelement_89")}">
                                                <div class="propertyItemSpace"><div class="innerContainer"></div></div>

                                                <div class="queryNavItem propertyItem">
                                                    <div class="innerContainer">
                                                        <g:if test="${group.value.size != 1}">
                                                            <div class="bullet propertyBullet"></div>
                                                            <g:if test="${attribute.name.length() > 42}">
                                                                <div class="propertyText tooltip"
                                                                     title="${attribute.name}">${attribute.name.substring(0, 42)}...</div>
                                                            </g:if>
                                                            <g:else>
                                                                <div class="propertyText tooltip"
                                                                     title="${attribute.name}">${attribute.name}</div>
                                                            </g:else>
                                                            <div class="arrow propertyArrow"></div>

                                                            <div class="propertyResetButton"><img
                                                                    src="${resource(dir: 'images', file: 'check_box_red.png')}"
                                                                    class="tooltip"
                                                                    title="${g.message(code: 'search.query.reset')}">
                                                            </div>
                                                            <!--<div class="info tooltip" title="${attribute.description}"></div>-->
                                                        </g:if>
                                                        <g:else>
                                                            <div class="propertyText propertyTextSingleAttribute tooltip"
                                                                 title="${attribute.description}">${attribute.name}</div>

                                                            <div class="propertyResetButton propertyResetButtonSingleAttribute"><img
                                                                    src="${resource(dir: 'images', file: 'check_box_red.png')}"
                                                                    class="tooltip"
                                                                    title="${g.message(code: 'search.query.reset')}">
                                                            </div>
                                                            <!--<div class="info tooltip" title="${attribute.description}"></div>-->
                                                        </g:else>
                                                    </div>
                                                </div>
                                            </g:if>
                                            <g:if test="${attribute.key.equals("TNM") || attribute.key.equals("urn_dktk_dataelement_89")}">
                                                <div class="propertyItemSpace"><div class="innerContainer"></div></div>

                                                <div class="queryNavItem propertyItem">
                                                    <div class="innerContainer">
                                                        <div class="bullet propertyBullet"></div>

                                                        <div class="propertyText tooltip"
                                                             title="${attribute.description ?: "Enthält die TNM-relevanten Angaben"}">${attribute.name ?: "TNM-Klassifikation"}</div>

                                                        <div class="arrow propertyArrow"></div>

                                                        <div class="propertyResetButton"><img
                                                                src="${resource(dir: 'images', file: 'check_box_red.png')}"
                                                                class="tooltip"
                                                                title="${g.message(code: 'search.query.reset')}"></div>
                                                        <!--<div class="info tooltip" title="${attribute.description ?: "Enthält die TNM-relevanten Angaben"}"></div>-->
                                                    </div>
                                                </div>

                                                <div class="propertyOptionContainerSub ggp">
                                                    <g:each status="t" var="tnmAttribute"
                                                            in="${attribute.subGroups ?: groups.get("TNM")}">
                                                        <div class="propertyItemSpace"><div
                                                                class="innerContainer"></div></div>

                                                        <div class="propertyItemSpaceSub"><div
                                                                class="innerContainer"></div></div>

                                                        <div class="queryNavItemSub propertyItemSL">
                                                            <div class="innerContainer">
                                                                <div class="bullet propertyBullet"></div>

                                                                <div class="propertyText tooltip"
                                                                     title="${tnmAttribute.description}">${tnmAttribute.name}</div>

                                                                <div class="arrow propertyArrow"></div>

                                                                <div class="propertyResetButton"><img
                                                                        src="${resource(dir: 'images', file: 'check_box_red.png')}"
                                                                        class="tooltip"
                                                                        title="${g.message(code: 'search.query.reset')}">
                                                                </div>
                                                                <g:if test="${attribute.key.equals("urn_dktk_dataelement_89")}">
                                                                    <div class="propertySelectAllButton"><img
                                                                            src="${resource(dir: 'images', file: 'check_box_green.png')}"
                                                                            class="tooltip"
                                                                            title="${g.message(code: 'search.query.selectAll')}">
                                                                    </div>
                                                                </g:if>
                                                            <!--<div class="info tooltip" title="${tnmAttribute.description}"></div>-->
                                                            </div>
                                                        </div>
                                                        <g:if test="${tnmAttribute.key.equals("urn_dktk_dataelement_100")}">
                                                            <div class="propertyOptionContainer ggp"
                                                                 data-key="${tnmAttribute.key}"
                                                                 data-name="${tnmAttribute.name}"
                                                                 data-type="${tnmAttribute.type}">
                                                                <div class="propertyItemSpace"><div
                                                                        class="innerContainer"></div></div>

                                                                <div class="propertyOptionItem"><div
                                                                        class="innerContainer">
                                                                    <div class="propertyOptionContainerSub ggp"
                                                                         style="width: 370px;">
                                                                        <g:each status="stat" var="ssubAttribute"
                                                                                in="${tnmAttribute.subGroups}">
                                                                            <div class="propertyItemSpace"><div
                                                                                    class="innerContainer"></div></div>

                                                                            <div class="propertyItemSpaceSub"><div
                                                                                    class="innerContainer"></div></div>

                                                                            <div class="queryNavItemSub propertyItemSL"
                                                                                 style="width: 310px;">
                                                                                <div class="innerContainer">
                                                                                    <div class="bullet propertyBullet"
                                                                                         style="height: 30px;"></div>
                                                                                    <g:if test="${ssubAttribute.name.length() > 32}">
                                                                                        <div class="propertyText tooltip"
                                                                                             title="${ssubAttribute.description}">${ssubAttribute.name.substring(0, 32)}...</div>
                                                                                    </g:if>
                                                                                    <g:else>
                                                                                        <div class="propertyText tooltip"
                                                                                             title="${ssubAttribute.description}">${ssubAttribute.name}</div>
                                                                                    </g:else>
                                                                                    <div class="arrow propertyArrow"></div>

                                                                                    <div class="propertyResetButton"><img
                                                                                            src="${resource(dir: 'images', file: 'check_box_red.png')}"
                                                                                            class="tooltip"
                                                                                            title="${g.message(code: 'search.query.reset')}">
                                                                                    </div>
                                                                                    <g:if test="${ssubAttribute.type == 'LIST'}">
                                                                                        <div class="propertySelectAllButton"><img
                                                                                                src="${resource(dir: 'images', file: 'check_box_green.png')}"
                                                                                                class="tooltip"
                                                                                                title="${g.message(code: 'search.query.selectAll')}">
                                                                                        </div>
                                                                                    </g:if>
                                                                                </div>
                                                                            </div>

                                                                            <div class="propertyOptionContainer "
                                                                                 style="width: 370px;"
                                                                                 data-key="${tnmAttribute.key}"
                                                                                 data-name="${tnmAttribute.name}"
                                                                                 data-type="${tnmAttribute.type}">
                                                                                <div class="propertyItemSpace"><div
                                                                                        class="innerContainer"></div>
                                                                                </div>

                                                                                <div class="propertyOptionItem"
                                                                                     style="width: 341px;"><div
                                                                                        class="innerContainer">
                                                                                    <table class="propertyOptionItemTable">
                                                                                        <tr>
                                                                                            <td class="propertyOptionItemSubFirst">
                                                                                            </td>
                                                                                            <td class="propertyOptionItemSub">
                                                                                            </td>
                                                                                            <td>
                                                                                                <g:render
                                                                                                        template="attribute"
                                                                                                        model="[attribute: ssubAttribute]"/>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div></div>
                                                                            </div>
                                                                        </g:each>
                                                                    </div>

                                                                </div>
                                                                </div>

                                                            </div>
                                                        </g:if>
                                                        <g:elseif
                                                                test="${attribute.key.equals("urn_dktk_dataelement_89")}">
                                                            <div class="propertyOptionContainer "
                                                                 data-key="${attribute.key}"
                                                                 data-name="${attribute.name}"
                                                                 data-type="${tnmAttribute.type}">
                                                                <div class="propertyItemSpace"><div
                                                                        class="innerContainer"></div></div>

                                                                <div class="propertyOptionItem"><div
                                                                        class="innerContainer">
                                                                    <table class="propertyOptionItemTable">
                                                                        <tr>
                                                                            <td class="propertyOptionItemSubFirst">
                                                                            </td>
                                                                            <td class="propertyOptionItemSub">
                                                                            </td>
                                                                            <td>
                                                                                <g:render template="attribute"
                                                                                          model="[attribute: tnmAttribute]"/>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div></div>
                                                            </div>
                                                        </g:elseif>
                                                        <g:else>
                                                            <div class="propertyOptionContainer "
                                                                 data-key="${tnmAttribute.key}"
                                                                 data-name="${tnmAttribute.name}"
                                                                 data-type="${tnmAttribute.type}">
                                                                <div class="propertyItemSpace"><div
                                                                        class="innerContainer"></div></div>

                                                                <div class="propertyOptionItem"><div
                                                                        class="innerContainer">
                                                                    <table class="propertyOptionItemTable">
                                                                        <tr>
                                                                            <td class="propertyOptionItemSubFirst">
                                                                            </td>
                                                                            <td class="propertyOptionItemSub">
                                                                            </td>
                                                                            <td>
                                                                                <g:render template="attribute"
                                                                                          model="[attribute: tnmAttribute]"/>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div></div>
                                                            </div>
                                                        </g:else>
                                                    </g:each>
                                                </div>
                                            </g:if>
                                            <g:else>
                                                <div class="propertyOptionContainer ggp" data-key="${attribute.key}"
                                                     data-name="${attribute.name}" data-type="${attribute.type}">
                                                    <div class="propertyItemSpace"><div class="innerContainer"></div>
                                                    </div>

                                                    <div class="propertyOptionItem"><div class="innerContainer">
                                                        <g:if test="${attribute.subGroups != null}">
                                                            <div class="propertyOptionContainerSub ggp"
                                                                 style="width: 380px;">
                                                                <g:each status="idx" var="subAttribute"
                                                                        in="${attribute.subGroups}">
                                                                    <div class="propertyItemSpace"><div
                                                                            class="innerContainer"></div></div>
                                                                    <!--<div class="propertyItemSpaceSub"><div class="innerContainer"></div></div>-->
                                                                    <div class="queryNavItemSub propertyItemSL"
                                                                         style="width: 340px;">
                                                                        <div class="innerContainer">
                                                                            <div class="bullet propertyBullet"
                                                                                 style="height: 30px;"></div>
                                                                            <g:if test="${subAttribute.name.length() > 32}">
                                                                                <div class="propertyText tooltip"
                                                                                     title="${subAttribute.description}">${subAttribute.name.substring(0, 32)}...</div>
                                                                            </g:if>
                                                                            <g:else>
                                                                                <div class="propertyText tooltip"
                                                                                     title="${subAttribute.description}">${subAttribute.name}</div>
                                                                            </g:else>
                                                                            <div class="arrow propertyArrow"></div>

                                                                            <div class="propertyResetButton"><img
                                                                                    src="${resource(dir: 'images', file: 'check_box_red.png')}"
                                                                                    class="tooltip"
                                                                                    title="${g.message(code: 'search.query.reset')}">
                                                                            </div>
                                                                            <g:if test="${subAttribute.type == 'LIST'}">
                                                                                <div class="propertySelectAllButton"><img
                                                                                        src="${resource(dir: 'images', file: 'check_box_green.png')}"
                                                                                        class="tooltip"
                                                                                        title="${g.message(code: 'search.query.selectAll')}">
                                                                                </div>
                                                                            </g:if>
                                                                        <!--<div class="info tooltip" title="${subAttribute.description}"></div>-->
                                                                        </div>
                                                                    </div>

                                                                    <div class="propertyOptionContainer"
                                                                         data-key="${subAttribute.key}"
                                                                         data-name="${subAttribute.name}"
                                                                         data-type="${subAttribute.type}">
                                                                        <div class="propertyItemSpace"><div
                                                                                class="innerContainer"></div></div>

                                                                        <g:if test="${subAttribute.subGroups == null}">
                                                                            <div class="propertyOptionItem"
                                                                                 style="${idx == attribute.subGroups.size - 1 ? 'width: 341px; border-bottom-color: white; border-bottom-width: 1px;' : 'width: 341px;'}">
                                                                                <div class="innerContainer">
                                                                                    <table class="propertyOptionItemTable test">
                                                                                        <tr>
                                                                                            <!--<td class="propertyOptionItemSubFirst">
                                                                                </td>-->
                                                                                            <td class="propertyOptionItemSub">
                                                                                            </td>
                                                                                            <td>
                                                                                                <g:render
                                                                                                        template="attribute"
                                                                                                        model="[attribute: subAttribute]"/>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div></div>
                                                                        </g:if>
                                                                        <g:else>
                                                                            <div class="propertyOptionContainer ggp"
                                                                                 data-key="${subAttribute.key}"
                                                                                 data-name="${subAttribute.name}"
                                                                                 data-type="${subAttribute.type}">
                                                                                <div class="propertyItemSpace"><div
                                                                                        class="innerContainer"></div>
                                                                                </div>

                                                                                <div class="propertyOptionItem"><div
                                                                                        class="innerContainer">
                                                                                    <div class="propertyOptionContainerSub ggp"
                                                                                         style="width: 370px;">
                                                                                        <g:each status="stat"
                                                                                                var="ssubAttribute"
                                                                                                in="${subAttribute.subGroups}">
                                                                                            <div class="propertyItemSpace"><div
                                                                                                    class="innerContainer"></div>
                                                                                            </div>

                                                                                            <div class="propertyItemSpaceSub"><div
                                                                                                    class="innerContainer"></div>
                                                                                            </div>

                                                                                            <div class="queryNavItemSub propertyItemSL"
                                                                                                 style="width: 340px;">
                                                                                                <div class="innerContainer">
                                                                                                    <div class="bullet propertyBullet"
                                                                                                         style="height: 30px;"></div>
                                                                                                    <g:if test="${ssubAttribute.name.length() > 32}">
                                                                                                        <div class="propertyText tooltip"
                                                                                                             title="${ssubAttribute.description}">${ssubAttribute.name.substring(0, 32)}...</div>
                                                                                                    </g:if>
                                                                                                    <g:else>
                                                                                                        <div class="propertyText tooltip"
                                                                                                             title="${ssubAttribute.description}">${ssubAttribute.name}</div>
                                                                                                    </g:else>
                                                                                                    <div class="arrow propertyArrow"></div>

                                                                                                    <div class="propertyResetButton"><img
                                                                                                            src="${resource(dir: 'images', file: 'check_box_red.png')}"
                                                                                                            class="tooltip"
                                                                                                            title="${g.message(code: 'search.query.reset')}">
                                                                                                    </div>
                                                                                                    <g:if test="${ssubAttribute.type == 'LIST'}">
                                                                                                        <div class="propertySelectAllButton"><img
                                                                                                                src="${resource(dir: 'images', file: 'check_box_green.png')}"
                                                                                                                class="tooltip"
                                                                                                                title="${g.message(code: 'search.query.selectAll')}">
                                                                                                        </div>
                                                                                                    </g:if>
                                                                                                </div>
                                                                                            </div>
                                                                                        </g:each>
                                                                                    </div>

                                                                                </div>
                                                                                </div>

                                                                            </div>

                                                                        </g:else>

                                                                    </div>
                                                                </g:each>
                                                            </div>
                                                            <g:if test="${attribute.codes?.size != 0}">
                                                                <table class="propertyOptionItemTable">
                                                                    <tr>
                                                                        <td>
                                                                        </td>
                                                                        <td>
                                                                            <g:render template="attribute"
                                                                                      model="[attribute: attribute]"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </g:if>
                                                        </g:if>
                                                        <g:else>
                                                            <table class="propertyOptionItemTable">
                                                                <tr>
                                                                    <g:if test="${group.value.size != 1}">
                                                                        <td>
                                                                        </td>
                                                                    </g:if>
                                                                    <g:else>
                                                                        <td class="singleAttribute">
                                                                        </td>
                                                                    </g:else>
                                                                    <g:if test="${attribute.key.equals('urn_dktk_dataelement_32')}">
                                                                        <td>
                                                                            <div class="propertyOptionItemLogicalOperatorContainer">
                                                                                <g:each var="value"
                                                                                        in="${attribute.lov}">

                                                                                    <g:if test="${value.key.equals('t')}">
                                                                                        <div class=" listContainerItem yesRadioButton">
                                                                                            <g:set var="shownValue"
                                                                                                   value="${value.value}"/>
                                                                                            <g:if test="${!value.value}"><g:set
                                                                                                    var="shownValue"
                                                                                                    value="Unknown"/></g:if>
                                                                                            <input class="yesRadioButton"
                                                                                                   type="checkbox"
                                                                                                   value="${value.key}"><span
                                                                                                class=" yesRadioButton values-${attribute.key}">${shownValue}</span>
                                                                                        </div>
                                                                                    </g:if>
                                                                                    <g:else>
                                                                                        <div class=" listContainerItem">
                                                                                            <g:set var="shownValue"
                                                                                                   value="${value.value}"/>
                                                                                            <g:if test="${!value.value}"><g:set
                                                                                                    var="shownValue"
                                                                                                    value="Unknown"/></g:if>
                                                                                            <input type="checkbox"
                                                                                                   value="${value.key}"><span
                                                                                                class="values-${attribute.key}">${shownValue}</span>
                                                                                        </div>
                                                                                    </g:else>
                                                                                </g:each>
                                                                            </div>

                                                                            <div class="propertyOptionItemLogicalOperatorContainer"
                                                                                 style="display:none">

                                                                                <div class="innerPropertyText"
                                                                                     data-key="${group.value[i + 1].key}"
                                                                                     data-name="${group.value[i + 1].name}">${group.value[i + 1].name}</div>
                                                                                <g:each var="value"
                                                                                        in="${group.value[i + 1].lov}">
                                                                                    <div class="listContainerItem">
                                                                                        <g:set var="shownValue"
                                                                                               value="${value.value}"/>
                                                                                        <g:if test="${!value.value}"><g:set
                                                                                                var="shownValue"
                                                                                                value="Unknown"/></g:if>
                                                                                        <input type="checkbox"
                                                                                               value="${value.key}"><span
                                                                                            class="values-${group.value[i + 1].key}">${shownValue}</span>
                                                                                    </div>
                                                                                </g:each>
                                                                            </div>
                                                                        </td>
                                                                    </g:if>
                                                                    <g:else>
                                                                        <td>
                                                                            <g:render template="attribute"
                                                                                      model="[attribute: attribute]"/>

                                                                        </td>
                                                                    </g:else>
                                                                </tr>
                                                            </table>
                                                        </g:else>
                                                    </div></div>
                                                </div>
                                            </g:else>
                                        </g:if>
                                    </g:each>

                                </div>

                            </g:if>
                        </g:each>
                        <div class="queryNavItem cloneItem"></div>
                    </div>

                    <div class="queryNavItem bgrdItem blue"><div class="text addOperator"><g:message
                            code="search.query.addGroup"/></div>

                        <div class="info menuInfo tooltip"
                             title="${g.message(code: 'search.query.addGroup.tooltip')}"></div></div>

                    <div class="queryNavItem"></div>

                    <div class="queryNavItem"></div>

                    <div class="queryNavItem"></div>

                    <div class="queryNavItem"></div>

                    <div class="queryNavItem"></div>

                    <div class="queryNavItem"></div>

                    <div class="queryNavItem"></div>

                    <div class="queryNavItem"></div>

                    <div class="queryNavItem bgrdItem blue"><div class="text"></div></div>

                    <div class="queryNavItem"></div>

                    <div class="queryNavItem"></div>

                    <div class="queryNavItem"></div>
                    <!--<div class="queryNavItem itemMedium white"><div class="queryName"><g:message
                            code="search.saved.name"/></div><div><input class="tfLarge queryNameInput" type="text" /></div><div class="info infoQN menuInfo tooltip" title="${g.message(code: 'search.saved.name.tooltip')}"></div></div>-->
                    <div class="queryNavItem"></div>
                </div>

                <nav>
                    <ul>
                        <li><!--Search &amp; Find--></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </nav>
            </div>
        </td>
        <td class="bgStructure">
            <div></div>
        </td>
    </tr>
</table>
</body>
