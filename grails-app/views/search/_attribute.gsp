%{--
- Copyright (c) 2018. dkfz
-
- Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
-
-
--}%
<div class="propertyOptionItemLogicalOperatorContainer">
    <g:if test="${attribute.type == 'LIST'}">
        <g:if test="${attribute.key.startsWith("urn_dktk_code_")}">

            <g:each var="code" in="${attribute.codes}">
                <g:if test="${code.isInSubGroup}">
                    <div class="listContainerItem" style="width: 300px">
                </g:if>
                <g:else>
                    <div class="listContainerItem">
                </g:else>
            <g:set var="shownValue" value="${code.name}"/>
            <g:if test="${!code.name}"><g:set var="shownValue" value="Unknown"/></g:if>

                <g:set var="x" value="${""}"/>
                <g:set var="y" value="${""}"/>
                <g:set var="z" value="${"Beinhaltet folgende Werte: \n \n"}"/>
                <g:each var="value" in="${code.lov}">
                    <g:if test="${value.value.startsWith("urn:dktk:dataelement:29")}">
                        <g:set var="x" value="${x+value.key+"\n"}"/>
                    </g:if>
                    <g:else>
                        <g:set var="y" value="${y+value.key+"\n"}"/>
                    </g:else>
                </g:each>
                <g:if test="${!x.equals("")}">
                    <g:set var="z" value="${z+"Diagnose \n"+x}"/>
                </g:if>
                <g:if test="${!y.equals("")}">
                    <g:if test="${z.equals("Beinhaltet folgende Werte: \n \n") }">
                        <g:set var="z" value="${z+"Morphologie \n"+y}"/>
                    </g:if>
                    <g:else>
                        <g:set var="z" value="${z+"\n Morphologie \n"+y}"/>
                    </g:else>
                </g:if>
                <input type="checkbox" value="${code.key}" data-morph="${y}" data-diag="${x}">
                <g:if test="${code.isInSubGroup}">
                    <span class="values-${code.key} tooltip" title="${z}" style="width: 260px">${shownValue}</span>
                </g:if>
                <g:else>
                    <span class="values-${code.key} tooltip" title="${z}">${shownValue}</span>
                </g:else>
            </div>

            </g:each>

        </g:if>
        <g:else>
            <g:each var="value" in="${attribute.lov}">
                <g:if test="${(attribute.key.equals("urn_dktk_dataelement_89") || attribute.key.equals("urn_dktk_dataelement_81") || attribute.key.equals("urn_dktk_dataelement_80") ||attribute.key.equals("urn_dktk_dataelement_79") ||attribute.key.equals("urn_dktk_dataelement_78") ||attribute.key.equals("urn_dktk_dataelement_100") ||attribute.key.equals("urn_dktk_dataelement_101") ||attribute.key.equals("urn_dktk_dataelement_82") ||attribute.key.equals("urn_dktk_dataelement_99"))}">
                    <div class="listContainerItemSub">

                </g:if><g:else>
                <div class="listContainerItem">
            </g:else>
                <g:set var="shownValue" value="${value.value}"/>
                <g:if test="${!value.value}"><g:set var="shownValue" value="Unknown"/></g:if>
                <input type="checkbox" value="${value.key}">


                <span class="values-${attribute.key}">${shownValue}</span>

                    </div>
        </g:each>
        </g:else>

    </g:if>
    <g:if test="${attribute.type == 'STRING'}">
        <div class="propertyOptionItemLogicalOperatorContainerItem">
            <div class="selectBox">
                <select size="1" class="upper">
                    <option value="EQ"><g:message code="search.query.comparator.EQ"/></option>
                    <option value="CO"><g:message code="search.query.comparator.CO"/></option>
                </select>
            </div>
            <div><input type="text" class="attributeAutocomplete string" placeholder="Hier Suchtext eingeben" data-attribute="${attribute.key}" data-entity="${attribute.entity}"></div>
            <div class="info tooltip" title="${attribute.description}"></div>
        </div>
        <div class="text_addOperator"><g:message code="search.query.addAttribute"/></div>
        <div class="propertyOptionItemLogicalOperatorContainerItemSpace"></div>
    </g:if>
    <g:if test="${attribute.type == 'LONG' || attribute.type == 'DOUBLE'}">
        <div class="propertyOptionItemLogicalOperatorContainerItem">
            <div  class="selectBox">
                <select size="1" class="upper">
                    <option value="BT"><g:message code="search.query.comparator.BT"/></option>
                    <option value="EQ"><g:message code="search.query.comparator.EQ"/></option>
                    <!-- <option value="NE"><g:message code="search.query.comparator.NE"/></option>-->
                    <option value="LT"><g:message code="search.query.comparator.LT"/></option>
                    <option value="GT"><g:message code="search.query.comparator.GT"/></option>
                    <option value="LE"><g:message code="search.query.comparator.LE"/></option>
                    <option value="GE"><g:message code="search.query.comparator.GE"/></option>
                </select>
            </div>
            <div class="betweenNumberInput">
                <div><input type="text" class="number"/></div>
                <div class="text_numberInput"><g:message code="search.query.number.and" /></div>
                <div><input type="text" class="number"/></div>
            </div>
            <div class="singleNumberInput">
                <div><input type="text" class="number numberBig"/></div>
            </div>
            <div class="info tooltip" title="${g.message(code: 'search.query.number.tooltip', args: [attribute.format])}"></div>
        </div>
        <div class="text_addOperator"><g:message code="search.query.addAttribute"/></div>
        <div class="propertyOptionItemLogicalOperatorContainerItemSpace"></div>
    </g:if>
    <g:if test="${attribute.type == 'DATE'}">
        <div class="propertyOptionItemLogicalOperatorContainerItem">
            <div class="text_datePicker"><g:message code="search.query.date.from" /></div>
            <div><input type="text" class="date" placeholder="JJJJ" data-format="${attribute.jsFormat}"/></div>
            <div class="text_datePicker"><g:message code="search.query.date.to" /></div>
            <div><input type="text" class="date" placeholder="JJJJ" data-format="${attribute.jsFormat}"/></div>
            <div class="info tooltip" title="${g.message(code: 'search.query.date.tooltip', args: [attribute.format])}"></div>
        </div>
        <div class="text_addOperator"><g:message code="search.query.addAttribute"/></div>
        <div class="propertyOptionItemLogicalOperatorContainerItemSpace"></div>
    </g:if>
    <div class="ie7Space"></div>
</div>
