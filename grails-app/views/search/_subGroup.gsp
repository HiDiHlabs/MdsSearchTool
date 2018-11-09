%{--
  - Copyright (c) 2018. dkfz
  -
  - Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
  -
  -
  --}%

<g:if test="${attribute.key.equals("urn_dktk_dataelement_100")}">
    <div class="propertyOptionContainer ggp" data-key="${attribute.key}" data-name="${attribute.name}" data-type="${attribute.type}" style="width: 370px;">
</g:if>
<g:else>
    <div class="propertyOptionContainer ggp" data-key="${attribute.key}" data-name="${attribute.name}" data-type="${attribute.type}">
</g:else>
    <div class="propertyItemSpace"><div class="innerContainer"></div></div>
    <div class="propertyOptionItem"><div class="innerContainer">
        <g:if test="${attribute.subGroups != null }">
            <div class="propertyOptionContainerSub ggp" style="width: 380px;" >
                <g:each status="idx" var="subAttribute" in="${attribute.subGroups}">
                    <div class="propertyItemSpace" ><div class="innerContainer"></div></div>
                    <div class="propertyItemSpaceSub"><div class="innerContainer"></div></div>
                    <div class="queryNavItemSub propertyItemSL" style="width: 311px;">
                        <div class="innerContainer">
                            <div class="bullet propertyBullet" style="height: 30px;"></div>
                            <g:if test="${subAttribute.name.length() > 32}">
                                <div class="propertyText tooltip" title="${subAttribute.description}">${subAttribute.name.substring(0, 32)}...</div>
                            </g:if>
                            <g:else>
                                <div class="propertyText tooltip" title="${subAttribute.description}">${subAttribute.name}</div>
                            </g:else>
                            <div class="arrow propertyArrow"></div>
                            <div class="propertyResetButton"><img src="${resource(dir: 'images', file: 'check_box_red.png')}" class="tooltip" title="${g.message(code: 'search.query.reset')}"></div>
                            <g:if test="${subAttribute.type == 'LIST'}">
                                <div class="propertySelectAllButton"><img src="${resource(dir: 'images', file: 'check_box_green.png')}" class="tooltip" title="${g.message(code: 'search.query.selectAll')}"></div>
                            </g:if>
                        <!--<div class="info tooltip" title="${subAttribute.description}"></div>-->
                        </div>
                    </div>
                    <div class="propertyOptionContainer" data-key="${subAttribute.key}" data-name="${subAttribute.name}" data-type="${subAttribute.type}">
                        <div class="propertyItemSpace"><div class="innerContainer"></div></div>
                        <div class="propertyOptionItem" style="${idx == attribute.subGroups.size-1 ? 'width: 341px; border-bottom-color: white; border-bottom-width: 1px;' : 'width: 341px;'}"><div class="innerContainer">
                           <g:if test="${subAttribute.subGroups != null}">
                               <g:render template="subGroup" model="[attribute: subAttribute, group: group]"/>
                           </g:if>
                            <g:else>
                                <table class="propertyOptionItemTable">
                                    <tr>
                                        <td class="propertyOptionItemSubFirst">
                                            testste
                                                                                </td>
                                        <td class="propertyOptionItemSub">
                                        </td>
                                        <td>
                                            <g:render template="attribute" model="[attribute: subAttribute]"/>
                                        </td>
                                    </tr>
                                </table>
                            </g:else>
                        </div></div>
                    </div>
                </g:each>
            </div>
            <g:if test="${attribute.codes?.size != 0}">
                <table class="propertyOptionItemTable">
                    <tr>
                        <td>
                        </td>
                        <td>
                            <g:render template="attribute" model="[attribute: attribute]"/>
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
                                <g:each var="value" in="${attribute.lov}">

                                    <g:if test="${value.key.equals('t')}">
                                        <div class=" listContainerItem yesRadioButton">
                                            <g:set var="shownValue" value="${value.value}"/>
                                            <g:if test="${!value.value}"><g:set var="shownValue" value="Unknown"/></g:if>
                                            <input  class="yesRadioButton" type="checkbox" value="${value.key}"><span class=" yesRadioButton values-${attribute.key}">${shownValue}</span>
                                        </div>
                                    </g:if>
                                    <g:else>
                                        <div class=" listContainerItem">
                                            <g:set var="shownValue" value="${value.value}"/>
                                            <g:if test="${!value.value}"><g:set var="shownValue" value="Unknown"/></g:if>
                                            <input  type="checkbox" value="${value.key}"><span class="values-${attribute.key}">${shownValue}</span>
                                        </div>
                                    </g:else>
                                </g:each>
                            </div>
                            <div class="propertyOptionItemLogicalOperatorContainer" style="display:none">

                                <div class="innerPropertyText" data-key="${group.value[i+1].key}" data-name="${group.value[i+1].name}">${group.value[i+1].name}</div>
                                <g:each var="value" in="${group.value[i+1].lov}">
                                    <div class="listContainerItem" >
                                        <g:set var="shownValue" value="${value.value}"/>
                                        <g:if test="${!value.value}"><g:set var="shownValue" value="Unknown"/></g:if>
                                        <input type="checkbox" value="${value.key}"><span class="values-${group.value[i+1].key}">${shownValue}</span>
                                    </div>
                                </g:each>
                            </div>
                        </td>
                    </g:if>
                    <g:else>
                        <td>
                            <g:render template="attribute" model="[attribute: attribute]"/>

                        </td>
                    </g:else>
                </tr>
            </table>
        </g:else>
    </div></div>
</div>

