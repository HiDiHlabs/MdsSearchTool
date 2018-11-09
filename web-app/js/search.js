/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

/*jslint browser: true */
/*global $, createLink */
var cMode, cQuery;
var browserVersion;


/*
 * function     : serialize
 * parameters   : none
 * description  : collects all query data and puts it in the right format
 * return       : list of maps with the name of the property and the filter information (operator, value1, value2)
 *                e.g. ["key": "location", "filter":["op": "", "val1": "Berlin", "val2": ""]]
 */
function serialize() {
    "use strict";
    var outerGroupList = [];
    $('.groupContainer').each(function () {
        var innerGroupList = [];
        var entityFilterList = [];
        $(this).find('.propertyContainer').each(function () {
            if ($(this).prev().children('.bullet').hasClass('glow')) {

                $(this).children('.ggp').each(function () {
                    var propertyMap = {},
                        filterList = [];
                    var name = $(this).data('name');
                    var key = $(this).data('key');

                    if ($(this).children().hasClass('propertyOptionContainer') ) {

                        $(this).children('.propertyOptionContainer').each(function () {
                            name = $(this).data('name');
                            key = $(this).data('key');
                            if ($(this).prev().find('.bullet').hasClass('glow')) {

                                switch ($(this).data('type')) {
                                    case "STRING":
                                        $(this).find('.propertyOptionItemLogicalOperatorContainerItem').each(function () {
                                            filterList.push({
                                                "op": $(this).find('select').val(),
                                                "key": key,
                                                "name": name,
                                                "def": "",
                                                "value": $(this).find('input').val(),
                                                "type": $(this).data('type')
                                            });
                                        });
                                        break;
                                    case "LIST":
                                        $(this).find('.propertyOptionItemLogicalOperatorContainer').each(function () {

                                            $(this).find('input').each(function () {
                                                if ($(this).prop('checked')) {

                                                    if ($(this).val() === '') {
                                                        filterList.push({
                                                            "op": "EM",
                                                            "key": key,
                                                            "name": name,
                                                            "def": $(this).next().text(),
                                                            "value": $(this).val(),
                                                            "type": $(this).data('type')
                                                        });
                                                    } else {
                                                        filterList.push({
                                                            "op": "EQ",
                                                            "key": key,
                                                            "name": name,
                                                            "def": $(this).next().text(),
                                                            "value": $(this).val(),
                                                            "type": $(this).data('type')
                                                        });
                                                    }
                                                }
                                            });

                                        });
                                        break;
                                }

                                var exists = false;
                                var i;
                                if(filterList.length >= 1) {
                                    for (i = 0; i < innerGroupList.length; ++i) {
                                        var b;
                                        if (innerGroupList[i].hasOwnProperty("list")) {
                                            for (b = 0; b < 1; ++b) {
                                                if (innerGroupList[i]["list"][b].key === filterList[0].key) {
                                                    exists = true;
                                                    var c;
                                                    for (c = 0; c < filterList.length; ++c) {
                                                        innerGroupList[i]["list"].push(filterList[c]);
                                                    }
                                                }
                                            }
                                        }else{
                                            if(innerGroupList[i].key === filterList[0].key){
                                                exists = true;
                                                var tempEl = innerGroupList[i];
                                                filterList.push(tempEl);
                                                propertyMap.list = filterList;
                                                propertyMap.op = "OR";
                                                innerGroupList[i] = propertyMap;
                                            }
                                        }
                                    }
                                }
                                if (filterList.length === 1) {
                                    if(!exists){
                                        innerGroupList.push(filterList[0])
                                    }
                                } else if (filterList.length > 1) {

                                    if(!exists){
                                        propertyMap.list = filterList;
                                        propertyMap.op = "OR";
                                        innerGroupList.push(propertyMap);
                                    }
                                }
                                propertyMap = {};
                                filterList = [];
                            }
                        });

                    } else {

                    if ($(this).parent().hasClass('propertyContainerSingleAttribute')) {
                        $(this).find('.propertyOptionItemLogicalOperatorContainer').each(function () {
                            $(this).find('input').each(function () {
                                if ($(this).prop('checked')) {
                                    filterList.push({
                                        "op": "EQ",
                                        "key": key,
                                        "name": name,
                                        "def": $(this).next().text(),
                                        "value": $(this).val()
                                    });
                                }
                            });
                        });
                    } else {
                        if ($(this).prev().find('.bullet').hasClass('glow')) {
                            switch ($(this).data('type')) {
                                case "STRING":
                                    $(this).find('.propertyOptionItemLogicalOperatorContainerItem').each(function () {
                                        filterList.push({
                                            "op": $(this).find('select').val(),
                                            "key": key,
                                            "name": name,
                                            "def": "",
                                            "value": $(this).find('input').val(),
                                            "type": $(this).data('type')
                                        });
                                    });
                                    break;
                                case "LONG":
                                case "DOUBLE":
                                    $(this).find('.propertyOptionItemLogicalOperatorContainerItem').each(function () {
                                        if ($(this).find('select').val() === 'BT') {
                                            var numberArray = [];
                                            $(this).find('.betweenNumberInput input').each(function (index) {
                                                numberArray[index] = $(this).val();
                                            });
                                            if (numberArray[0] !== '' && numberArray[1] !== '') {
                                                var c1 = {
                                                    "op": "GE",
                                                    "key": key,
                                                    "name": name,
                                                    "def": "",
                                                    "value": numberArray[0],
                                                    "type": $(this).data('type')
                                                };
                                                var c2 = {
                                                    "op": "LE",
                                                    "key": key,
                                                    "name": name,
                                                    "def": "",
                                                    "value": numberArray[1],
                                                    "type": $(this).data('type')
                                                };
                                                filterList.push({"op": "AND", list: [c1, c2]});
                                            }
                                        } else {
                                            var val = $(this).find('.singleNumberInput input').val();
                                            if (val !== '') {
                                                filterList.push({
                                                    "op": $(this).find('select').val(),
                                                    "key": key,
                                                    "name": name,
                                                    "def": "",
                                                    "value": val,
                                                    "type": $(this).data('type')
                                                });
                                            }
                                        }
                                    });
                                    break;
                                case "DATE":
                                    $(this).find('.propertyOptionItemLogicalOperatorContainerItem').each(function () {
                                        var dateArray = [];
                                        $(this).find('input').each(function (index) {
                                            //dateArray[index] = $.datepicker.formatDate('@', $(this).datepicker('getDate'));
                                            dateArray[index] = $(this).val();
                                            console.log("index" +index);
                                            console.log($.datepicker.formatDate('@', $(this).datepicker('getDate')));
                                        });
                                        if (dateArray[0] !== '' && dateArray[1] !== '') {
                                            var dateV1 = new Date(dateArray[0],0,1,0,0,0);
                                            dateV1.setUTCFullYear(dateArray[0],0,1);
                                            dateV1.setUTCHours(0,0,0);
                                            var dateV2 = new  Date(dateArray[1],11,31,0,0,0);
                                            dateV2.setUTCFullYear(dateArray[1],11,31);
                                            dateV2.setUTCHours(0,0,0);

                                            var c1 = {
                                                "op": "GE",
                                                "key": key,
                                                "name": name,
                                                "def": "",
                                                "value": dateV1.getTime(),
                                                "type": "Date"
                                            };
                                            var c2 = {
                                                "op": "LE",
                                                "key": key,
                                                "name": name,
                                                "def": "",
                                                "value": dateV2.getTime(),
                                                "type": "Date"
                                            };
                                            filterList.push({"op": "AND", list: [c1, c2]});
                                        }
                                    });
                                    break;
                                case "LIST":
                                    $(this).find('.propertyOptionItemLogicalOperatorContainer').each(function () {
                                        if ($(this).children().hasClass('innerPropertyText')) {

                                            key = $(this).children('.innerPropertyText').data('key');
                                            //if(key == "urn_dktk_dataelement_89")
                                            name = $(this).children('.innerPropertyText').data('name');

                                            $(this).find('input').each(function () {
                                                if ($(this).prop('checked')) {
                                                    if ($(this).val() === '') {
                                                        filterList.push({
                                                            "op": "EM",
                                                            "key": key,
                                                            "name": name,
                                                            "def": $(this).next().text(),
                                                            "value": $(this).val(),
                                                            "type": $(this).data('type')
                                                        });
                                                    } else {
                                                        filterList.push({
                                                            "op": "EQ",
                                                            "key": key,
                                                            "name": name,
                                                            "def": $(this).next().text(),
                                                            "value": $(this).val(),
                                                            "type": $(this).data('type')
                                                        });
                                                    }
                                                }
                                            });
                                        } else {
                                            $(this).find('input').each(function () {
                                                if ($(this).prop('checked')) {

                                                    if (key.search('urn_dktk_code') !== -1) {
                                                        var propertyMapMorph = {},
                                                            filterListMorph = [];
                                                        var morphList = $(this).data('morph').split(/\s+/);
                                                        var diagList = $(this).data('diag').split(/\s+/);

                                                        $.each(morphList, function (index, value) {

                                                            if (value.search(/\*/g) !== -1) {
                                                                var morphval = value.replace(/\*/g, "");
                                                                filterListMorph.push({
                                                                    "op": "SW",
                                                                    "key": "urn_dktk_dataelement_7",
                                                                    "name": "Morphologie",
                                                                    "def": "",
                                                                    "value": morphval
                                                                });
                                                            } else if (value !== '') {
                                                                filterListMorph.push({
                                                                    "op": "EQ",
                                                                    "key": "urn_dktk_dataelement_7",
                                                                    "name": "Morphologie",
                                                                    "def": "",
                                                                    "value": value
                                                                });
                                                            }

                                                        });
                                                        propertyMapMorph.op = "OR";
                                                        propertyMapMorph.list = filterListMorph;

                                                        var propertyMapDiag = {},
                                                            filterListDiag = [];


                                                        $.each(diagList, function (index, value) {
                                                            if (value.search(/\*/g) !== -1) {
                                                                var diagval = value.replace(/\*/g, "");
                                                                filterListDiag.push({
                                                                    "op": "SW",
                                                                    "key": "urn_dktk_dataelement_29",
                                                                    "name": "Diagnose",
                                                                    "def": "",
                                                                    "value": diagval
                                                                });
                                                            }
                                                            else if (value !== '') {
                                                                filterListDiag.push({
                                                                    "op": "EQ",
                                                                    "key": "urn_dktk_dataelement_29",
                                                                    "name": "Diagnose",
                                                                    "def": "",
                                                                    "value": value
                                                                });
                                                            }
                                                        });
                                                        propertyMapDiag.op = "OR";
                                                        propertyMapDiag.list = filterListDiag;

                                                        var entityMap = {};
                                                        entityMap.op = "AND";
                                                        entityMap.list = [propertyMapDiag, propertyMapMorph];
                                                        entityFilterList.push(entityMap);

                                                    } else {
                                                        if ($(this).val() === '') {
                                                            filterList.push({
                                                                "op": "EM",
                                                                "key": key,
                                                                "name": name,
                                                                "def": $(this).next().text(),
                                                                "value": $(this).val()
                                                            });
                                                        } else {
                                                            filterList.push({
                                                                "op": "EQ",
                                                                "key": key,
                                                                "name": name,
                                                                "def": $(this).next().text(),
                                                                "value": $(this).val()
                                                            });
                                                        }
                                                    }

                                                }
                                            });
                                        }
                                    });
                                    break;
                            }
                        }
                    }
                        var exists = false;
                        var i;
                        if(filterList.length >= 1) {

                            for (i = 0; i < innerGroupList.length; ++i) {
                                var b;
                                if (innerGroupList[i].hasOwnProperty("list")) {
                                    for (b = 0; b < 1; ++b) {
                                        if (innerGroupList[i]["list"][b].key === filterList[0].key) {
                                            exists = true;
                                            var c;
                                            for (c = 0; c < filterList.length; ++c) {
                                                innerGroupList[i]["list"].push(filterList[c]);

                                            }
                                        }
                                    }
                                }else{
                                    if(innerGroupList[i].key === filterList[0].key){
                                        exists = true;
                                        var tempEl = innerGroupList[i];
                                        filterList.push(tempEl);
                                        propertyMap.list = filterList;
                                        propertyMap.op = "OR";
                                        innerGroupList[i] = propertyMap;
                                    }
                                }
                            }
                        }
                    if (filterList.length === 1) {
                            if(!exists){
                                innerGroupList.push(filterList[0]);
                            }
                    } else if (filterList.length > 1) {
                            if(!exists) {
                                propertyMap.list = filterList;
                                propertyMap.op = "OR";

                                innerGroupList.push(propertyMap);
                            }
                    }
                }
                });
            }
        });
        if(innerGroupList.length === 1) {
            outerGroupList.push(innerGroupList[0])
        } else {
            var inner = {};
            inner.list = innerGroupList;
            inner.op = "AND";
            outerGroupList.push(inner);
        }
        if(entityFilterList.length === 1) {
            outerGroupList.push(entityFilterList[0])
        } else if (entityFilterList.length > 1 ) {
            var entityInner = {};
            entityInner.list = entityFilterList;
            entityInner.op = "OR";
            outerGroupList.push(entityInner);
        }
    });
    if(outerGroupList.length === 1) {
        return outerGroupList[0];
    } else {
        var outer = {};
        outer.list = outerGroupList;
        outer.op = "AND";
        return outer;
    }
}



$(function () {
    "use strict";

    /*
     * function     : rotate
     * parameters   : Object element, Integer degree
     * description  : rotates the specific element by specific number of degree
     * return       : none
     */
    function rotateElement(element, degree) {
        if (browserVersion !== 'IE7' && browserVersion !== 'IE8') {
            element.rotate({
                duration: 500,
                animateTo: degree
            });
        } else {
            if (degree === '0') {
                element.removeClass('arrow_down');
            } else if (degree === '90') {
                element.addClass('arrow_down');
            }
        }
    }


    /*
     * function     : groupBulletCheck
     * parameters   : none
     * description  : checks if any property bullet is on each group and turns on the specific group bullet
     * return       : none
     */
    function groupBulletCheck() {
        $('.queryNavItem_group').children('.bullet').removeClass('glow');
        $('.propertyContainer .bullet').each(function () {
            if ($(this).hasClass('glow')) {
                $(this).parents('.propertyContainer').prev().children('.bullet').addClass('glow');
            }
        });
        $('.propertyContainerSingleAttribute').each(function () {
            if ($(this).find('input[type=checkbox]').is(":checked")) {
                $(this).prev().children('.bullet').addClass('glow');
            }
        });
    }


    $(document).on('focus', '.attributeAutocomplete', function (event) {
        if (!$(event.target).hasClass('ui-autocomplete-input')) {
            $(event.target).autocomplete({
                delay: 0,
                minLength: 0,
                source: function (request, response) {
                    $.ajax({
                        url: createLink('ajax', 'autoCompleteValue', $(event.target).data('entity')),
                        type: 'GET',
                        dataType: 'json',
                        data: {attribute: $(event.target).data('attribute'), term: $(event.target).val()},
                        success: function (data) {
                            response($.map(data, function (item) {
                                return {
                                    label: item,
                                    value: item
                                };
                            }));
                        }
                    });
                },
                select: function (event, ui) {
                    $(this).parents('.propertyOptionContainer').prev().find('.bullet').addClass('glow');
                    groupBulletCheck();
                },
                close: function (event, ui) {
                    updateSearchCriteriaContainer();
                }
            });
        }
        $(this).autocomplete('search', '');
    });


    /*
     * element(event)   : .datePicker
     * description      : datePicker initialization
     */
    $(document).on('focus', '.datePicker:not(.ui-datepicker-input)', function (event) {
        var format = $(this).data('format');
        $(this).datepicker({
            dateFormat : format,
            changeYear: true
        });
    });


    /*
     * element(event)   : none
     * description      : returns the browserversion (IE7 or IE8)
     */
    var browserV = navigator.appVersion;
    if (browserV.indexOf('MSIE 7.') !== -1) {
        browserVersion = 'IE7';
    } else if (browserV.indexOf('MSIE 8.') !== -1) {
        browserVersion = 'IE8';
    }


    /*
     * element(event)   : none
     * description      : rotates chartArrow for IE7 and IE8
     */
    if (browserVersion === 'IE7' || browserVersion === 'IE8') {
        $('.chartArrow').addClass('arrow_down');
    }


    /*
     * element(event)   : none
     * description      : global group clone, for adding a whole clean search mask
     */
    var groupContainerClone = $('.groupContainer').clone();


    /*
     * element(event)   : :checkbox, :input
     * description      : against Firefox caching check boxes and input boxes
     */
    $(':checkbox, :input').attr('autocomplete', 'off');


    /*
     * element(event)   : *
     * description      : function to make all elements but input elements unselectable
     */
    $('*').each(function () {
        if (this.nodeName !== 'INPUT') {
            $(this).css('-webkit-touch-callout', 'none')
                .css('-webkit-user-select', 'none')
                .css('-khtml-user-select', 'none')
                .css('-moz-user-select', 'none')
                .css('-moz-user-select', '-moz-none')
                .css('-ms-user-select', 'none')
                .css('user-select', 'none');
        } else {
            $(this).css('-moz-user-select', 'text !important');
        }
    });


    /*
     * element(event)   : .slider(click)
     * description      : switches between the two slider images 'sliderRight' and 'sliderLeft' to chose between patient search and sample search
     */
    $('.slider').click(function (event) {
        if ($(event.target).hasClass('sliderLeft')) {
            $(event.target).removeClass('sliderLeft').addClass('sliderRight');
        } else {
            $(event.target).removeClass('sliderRight').addClass('sliderLeft');
        }
    });


    /*
     * element(event)   : .groupArrow, .groupText, .groupBullet (click)
     * description      : rotates/rotates back the group arrows and let the property headers appear/disappear
     */
    $('#searchNavContainer').on('click', '.groupArrow, .groupText, .groupBullet', function () {
        var status = $(this).parent().next().is(':hidden');

        /* reset */
        $('.propertyContainer').hide();
        $('.propertyOptionContainer').hide();
        $('.propertyOptionContainerSub').hide();
        $('.groupArrow').each(function () {
            rotateElement($(this), 0);
        });
        $('.propertyArrow').each(function () {
            rotateElement($(this), 0);
        });
        /* reset */
        if (status) {
            $(this).parent().next().show();
            rotateElement($(this).parent().children('.groupArrow'), 90);
        }
    });


    /*
     * element(event)   : .propertyArrow, .propertyText, .propertyBullet (click)
     * description      : rotates/rotates back the property arrows and let the property contents appear/disappear
     */
    $('#searchNavContainer').on('click', '.propertyArrow, .propertyText, .propertyBullet', function () {
        var status = $(this).parents('.propertyItem').next().is(':hidden');
        var status2 = $(this).parents('.propertyItemSL').next().is(':hidden');
        var status3 = $(this).parents('.propertyItem').next().hasClass('propertyOptionContainerSub');
        var status4 = $(this).parents('.queryNavItemSub').parent().hasClass('propertyOptionContainerSub');
        var status5 = $(this).parents('.queryNavItemSub').parent('.propertyOptionContainerSub').is(':hidden');

        $('.propertyOptionContainer').hide();

        if(status || status3){
            $('.propertyOptionContainerSub').hide();
        }

        $('.propertyArrow').each(function () {
            rotateElement($(this), 0);
        });
        $(this).parents('.propertyOptionContainer').show();
        rotateElement($(this).parents('.propertyOptionContainer').prev().find('.propertyArrow'), 90);
        rotateElement($(this).parents('.propertyOptionContainerSub').prev().find('.propertyArrow'), 90);

        if (status || status2 || status5) {
            $(this).parents().next().show();
            $(this).parents().next().children().find('.propertyOptionContainerSub').show();

            if(status4 || status5){

                rotateElement($(this).parents('.propertyOptionContainer').prev().find('.propertyArrow'), 90);
                $(this).parents('.queryNavItemSub').next().show();
            }
            rotateElement($(this).parents().children('.propertyArrow'), 90);
        }

        if($(this).parent().parent().hasClass('propertyItemSL')){
            rotateElement($(this).parent().parent().parent().prev().find('.propertyArrow'), 90);
        }
    });


    /*
     * element(event)   : .chartArrow, .chartText (click)
     * description      : rotates/rotates back the chart arrow and let the chart appear/disappear
     */
    $('#left-content').on('click', '.queryResultChartHeader', function () {

        var status = $(this).next().is(':hidden');
        $('.queryResultChartContent').hide();
        $('.chartArrow').each(function () {
            rotateElement($(this), 0);
        });

        if (status) {
            if($(this).parent().next().is('.queryResultChartContainer')){
                var item = $(this).parent().next();
                $(this).parent().next().detach();
                item.insertAfter($("#decentralsearch").parent());

            }
            rotateElement($(this).children('.chartArrow'), 90);
            $(this).next().show();
        } else {
            rotateElement($(this).children('.chartArrow'), 0);
            $(this).next().hide();
        }
    });


    /*
     * checks for values in input boxes, turns the bullets on or off and updates SearchCriteriaContainer
     */
    function inputChange(container) {
        var active = false;
        if (container.data('type') !== 'LIST') {
            container.find('.propertyOptionItemLogicalOperatorContainerItem').each(function () {
                if ($(this).find('select').val() === 'BT') {
                    if ($(this).find('.betweenNumberInput input').first().val() !== '' &&
                            $(this).find('.betweenNumberInput input').last().val() !== '') {
                        active = true;
                    }
                } else if (container.data('type') === 'DATE') {
                    if ($(this).find('input').first().val() !== '' &&
                            $(this).find('input').last().val() !== '') {
                        active = true;
                    }
                } else {
                    if ($(this).find('.singleNumberInput input').val() !== '') {
                        active = true;
                    }
                }
            });
            if (active) {
                container.prev().find('.bullet').addClass('glow');
            } else {
                container.prev().find('.bullet').removeClass('glow');
            }
        }
        groupBulletCheck();
        updateSearchCriteriaContainer();
    }


    /*
     * element(event)   : .propertyOptionContainer input (change, keyup)
     * description      : call inputChange()
     */
    $('#searchNavContainer').on('change keyup', '.propertyOptionContainer input', function (event) {
        inputChange($(event.target).parents('.propertyOptionContainer'));
    });


    /*
     * element(event)   : .listContainerItem span, .listContainerItem input (click)
     * description      : checks for values in check boxes in LIST containers and turns the bullets on or off
     */
    $('#searchNavContainer').on('click', '.listContainerItem span, .listContainerItemSub span, .listContainerItemSub input, .listContainerItem input', function () {
        /*
         * checks check box when span element is clicked
         */
        if (!($(this).prev().prop('checked'))) {
            $(this).prev().prop('checked', true);
        } else {
            $(this).prev().prop('checked', false);
        }
        var bulletMode = false;
        var level = false;

        $(this).parent().parent().parent().children().children().each(function () {
            if ($(this).find('input').prop('checked')) {
                bulletMode = true;
            }
        });
        if ($(this).parents('.propertyContainer').hasClass('propertyContainerSingleAttribute')) {
            if (bulletMode) {
                $(this).parents('.propertyContainer').prev().find('.bullet').addClass('glow');
            } else {
                $(this).parents('.propertyContainer').prev().find('.bullet').removeClass('glow');
            }
        } else {
            if (bulletMode) {
                $(this).parents('.propertyOptionContainer').prev().find('.bullet').addClass('glow');
                $(this).parents('.propertyOptionContainerSub').prev().find('.bullet').addClass('glow');

            } else {
                if($(this).closest('.propertyOptionContainer').find('.glow').size() >= 1){
                }else{
                    if($(this).closest('.propertyOptionContainerSub').find('.glow').size() >= 1){
                        $(this).closest('.propertyOptionContainer').prev().find('.bullet').removeClass('glow');
                        $(this).closest('.propertyOptionContainer').prev().closest('.propertyOptionContainer').find('input').each(function () {
                            if ($(this).prop('checked')) {
                                level = true;
                            }
                        });
                        if(!level){
                            $(this).closest('.propertyOptionContainer').prev().closest('.propertyOptionContainer').prev().find('.bullet').removeClass('glow');
                        }
                        if($(this).parents('.propertyOptionContainerSub').prev().hasClass('propertyItem')) {

                            var countGlow = $(this).parents('.propertyOptionContainerSub').find('.glow').size();
                            if(countGlow === 0){

                                $(this).parents('.propertyOptionContainerSub').prev().find('.bullet').removeClass('glow');
                            }
                        }

                    }else{
                        $(this).parents('.propertyOptionContainer').prev().find('.bullet').removeClass('glow');

                        if($(this).parents('.propertyOptionContainerSub').prev().hasClass('propertyItem')) {

                            var countGlow = $(this).parents('.propertyOptionContainerSub').find('.glow').size();
                            if(countGlow === 0){

                                $(this).parents('.propertyOptionContainerSub').prev().find('.bullet').removeClass('glow');
                            }
                        }
                    }

                }


                //$(this).parents('.propertyOptionContainerSub').prev().find('.bullet').removeClass('glow');
            }
            groupBulletCheck();
        }
        updateSearchCriteriaContainer();
    });






    /*
     * update search criteria if a comparison operator in a dropdown menu is changed
     */
    $('#searchNavContainer').on('change', '.propertyOptionItemLogicalOperatorContainerItem select', function () {
        updateSearchCriteriaContainer();
    });


    /*
     * element(event)   : .propertyOptionItemLogicalOperatorContainerItem input (change)
     * description      : removes empty input boxes when there are more then two of them, e.g. you add a new input box for an "or"-relation and afterwards you clean it for a new search
     */
    $('#searchNavContainer').on('change', '.propertyOptionItemLogicalOperatorContainerItem input', function () {
        if ($(this).val() === '') {
            if ($(this).closest('.propertyOptionItemLogicalOperatorContainer').children('.propertyOptionItemLogicalOperatorContainerItem').size() > 1) {
                $(this).closest('.propertyOptionItemLogicalOperatorContainerItem').remove();
            }
        }
    });


    /*
     * element(event)   : .text_addOperator (click)
     * description      : adds a new input or select box for an "or"-relation in properties
     */
    $('#searchNavContainer').on('click', '.text_addOperator', function () {
        var clone = $(this).prev().clone().insertAfter($(this).prev());
        $(clone).find('input').each(function () {
            // reset cloned inputs (datepicker, autocomplete and value)
            $(this).removeClass('hasDatepicker').removeAttr('id');
            $(this).removeClass('ui-autocomplete-input');
            $(this).val('');
        });
        // show first option of dropdown menu (between), show two input fields
        $(clone).find('select option:first-child').attr('selected', true);
        $(clone).find('.betweenNumberInput').show();
        $(clone).find('.singleNumberInput').hide();
    });


    /*
     * element(event)   : .addOperator (click)
     * description      : adds a new search mask with the group container clone, being cloned at the document startup
     */
    $('.addOperator').click(function () {
        var group = groupContainerClone.insertAfter('.groupContainer:last');
        $(groupContainerClone).find('.groupDeleteButton').removeClass('isInvisible');
        groupContainerClone = group.clone(); // user global clone
    });


    /*
     * element(event)   : .groupResetButton (click)
     * description      : resets a whole search mask
     */
    $('#searchNavContainer').on('click', '.groupResetButton', function () {
        var prev = $(this).parents('.groupContainer').prev();
        $(this).parents('.groupContainer').remove();
        var group = groupContainerClone.insertAfter(prev);
        groupContainerClone = group.clone(); // user global clone
        updateSearchCriteriaContainer();
    });


    /*
     * element(event)   : .groupDeleteButton (click)
     * description      : deletes a whole search mask - is just enabled/visible if there is more then 1 search mask
     */
    $('#searchNavContainer').on('click', '.groupDeleteButton', function () {
        $(this).parents('.groupContainer').remove();
        updateSearchCriteriaContainer();
    });


    /*
     * element(event)   : .yesRadioButton (click)
     * description      : enables/disables list of radio buttons like attribute "intention op"
     */
    $('#searchNavContainer').on('click', '.yesRadioButton', function () {

        if($(this).parent().hasClass('active')){
            $(this).parent().removeClass('active');
            var items = $(this).parent().parent().next('.propertyOptionItemLogicalOperatorContainer').hide();

            updateSearchCriteriaContainer();
        }else{
            $(this).parent().addClass('active');
            var items = $(this).parent().parent().next('.propertyOptionItemLogicalOperatorContainer').show();
        }

    });





    /*
     * element(event)   : .propertyResetButton (click)
     * description      : resets a single property container, all values and all operators
     */
    $('#searchNavContainer').on('click', '.propertyResetButton', function () {
        var level = false;

        var subContainer = $(this).parents('.queryNavItemSub').next();
        subContainer.find('.bullet').removeClass('glow');

        var inputContainer = $(this).parents('.propertyItem').next();
        if (inputContainer.length == 0){
        inputContainer = $(this).parents('.propertyItemSL').next();
        }
        inputContainer.find('.propertyOptionItemLogicalOperatorContainerItem:not(:first)').each(function () {
            $(this).remove();
        });
        inputContainer.css('height', '');
        inputContainer.find('input[type=text], select').val('');
        inputContainer.find('input[type=checkbox]').each(function () {
            $(this).prop('checked', false);
        });
        if ($(this).parents('.propertyContainer').hasClass('propertyContainerSingleAttribute')) {
            $(this).parents('.propertyContainer').prev().find('.bullet').removeClass('glow');
        } else {
            $(this).parent().find('.bullet').removeClass('glow');
            $(this).closest('.propertyItem').next().find('.bullet').removeClass('glow');
            if($(this).closest('.propertyOptionContainer').find('.glow').size() >= 1){
            }else{
                if($(this).closest('.propertyOptionContainerSub').find('.glow').size() >= 1){
                    $(this).closest('.propertyOptionContainer').prev().find('.bullet').removeClass('glow');
                    $(this).closest('.propertyOptionContainer').prev().closest('.propertyOptionContainer').find('input').each(function () {
                        if ($(this).prop('checked')) {
                            level = true;
                        }
                    });
                    if(!level){
                        $(this).closest('.propertyOptionContainer').prev().closest('.propertyOptionContainer').prev().find('.bullet').removeClass('glow');
                    }
                    if($(this).parents('.propertyOptionContainerSub').prev().hasClass('propertyItem')) {

                        var countGlow = $(this).parents('.propertyOptionContainerSub').find('.glow').size();
                        if(countGlow === 0){

                            $(this).parents('.propertyOptionContainerSub').prev().find('.bullet').removeClass('glow');
                        }
                    }

                }else{
                    $(this).parents('.propertyOptionContainer').prev().find('.bullet').removeClass('glow');

                    if($(this).parents('.propertyOptionContainerSub').prev().hasClass('propertyItem')) {

                        var countGlow = $(this).parents('.propertyOptionContainerSub').find('.glow').size();
                        if(countGlow === 0){

                            $(this).parents('.propertyOptionContainerSub').prev().find('.bullet').removeClass('glow');
                        }
                    }
                }

            }

        }

        inputContainer.find('.propertyOptionItemLogicalOperatorContainer').children().removeClass('active').parent().next('.propertyOptionItemLogicalOperatorContainer').hide();

        groupBulletCheck();
        updateSearchCriteriaContainer();
    });


    /*
    * element(event)   : .propertyResetButton (click)
    * description      : resets a single property container, all values and all operators
    */
    $('#searchNavContainer').on('click', '.propertySelectAllButton', function () {

        var inputContainer = $(this).parents('.propertyItem').next();
        if (inputContainer.length == 0){
            inputContainer = $(this).parents('.propertyItemSL').next();
        }
       // inputContainer.css('height', '');
        inputContainer.find('input[type=checkbox]').each(function () {
            $(this).prop('checked', true);
        });

        $(this).parents('.propertyOptionContainer').prev().find('.bullet').addClass('glow');
        $(this).parents('.propertyOptionContainerSub').prev().find('.bullet').addClass('glow');

        if ($(this).parents('.propertyContainer').hasClass('propertyContainerSingleAttribute')) {
            $(this).parents('.propertyContainer').prev().find('.bullet').addClass('glow');
        } else {
            $(this).parent().find('.bullet').addClass('glow');

            if($(this).parent().parent().parent().prev().hasClass('propertyItem')) {
                var countGlow = $(this).parent().parent().parent().find('.glow').size();
                //if(countGlow === 0){
                    $(this).parent().parent().parent().prev().find('.bullet').addClass('glow');
                //}
                var bullets = $(this).parent().parent().parent().find('.glow');
            }
            if($(this).parent().parent().next().hasClass('propertyOptionContainerSub')) {
                $(this).parent().parent().next().find('.bullet').addClass('glow');
            }
            if($(this).parent().parent().next().hasClass('propertyOptionContainer')) {
                $(this).parent().parent().next().find('.bullet').addClass('glow');
            }
        }

        groupBulletCheck();
        updateSearchCriteriaContainer();
    });

    /*
     * element(event)   : .selectBox (click)
     * description      : changes the layout of number property containers to
     *                      between (2 inputs boxes) or others (1 input box) and call inputChange()
     */
    $('#searchNavContainer').on('click', '.selectBox', function () {
        var type = $(this).parents('.propertyOptionContainer').data('type');
        if (type === 'LONG' || type === 'DOUBLE') {
            if ($(this).find('select').val() === 'BT') {
                $(this).parent().find('input').val('');
                $(this).parent().find('.betweenNumberInput').show();
                $(this).parent().find('.singleNumberInput').hide();
            } else {
                $(this).parent().find('input').val('');
                $(this).parent().find('.singleNumberInput').show();
                $(this).parent().find('.betweenNumberInput').hide();
            }
            inputChange($(this).parents('.propertyOptionContainer'));
        }
    });


    /*
     * element(event)   : input[type=text] (keyup change)
     * description      : validates all input boxes =>
     *      input boxes for numbers just contains numbers,
     *      input boxes for dates just contains dates
     */
    $('#searchNavContainer').on('keyup change', 'input[type=text]', function () {
        var input = this,
            inputType = $(input).parents('.propertyOptionContainer').data('type'),
            inputValue = $(input).val(),
            pattern;
        if (inputType !== 'undefined') {
            switch (inputType) {
            case 'LONG':
                pattern = /[a-zA-Z]/g;
                if (pattern.test(inputValue)) {
                    $(input).val('');
                    $(input).addClass('inputError');
                } else {
                    $(this).removeClass('inputError');
                }
                break;
            case 'DATE':
                //pattern = /^\d{2}[.-\/]\d{2}[.-\/]\d{4}$/;
                pattern = /^\d{1,4}$/;
                if (!(pattern.test(inputValue))) {
                    $(input).val($(input).val().substr(0,$(input).val().length-1));
                    $(input).addClass('inputError');
                } else {
                    $(this).removeClass('inputError');
                }
                break;
            }
        }
    });



    function isEmpty(str) {
        return typeof str == 'string' && !str.trim() || typeof str == 'undefined' || str === null;
    }


    function  updateSearchCriteriaRecursive(condition){
        if(condition.op === "OR" || condition.op === "AND"){
            var queryView = "";
            $.each(condition.list, function(index, conditionList) {
                queryView = queryView + updateSearchCriteriaRecursive(conditionList);
            });
            if(queryView !== ""){
                if(condition.op === "OR"){
                    return '<div class="row formItem" style="background-color: #929292;"><div class="row ">ODER</div>' + queryView + "</div>";
                }else{
                    return '<div class="row formItem" style="background-color: #424242;"><div class="row ">UND</div>' + queryView + "</div>";
                }
            }
            return "";
        }else{
            // cover special cases of operator
            switch(condition.op) {
                case "CO":    // contains
                    return ('<div class="row formItem" style="background-color: #626262; text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+'</span><span style="color: white;"> ENTHÄLT </span><span style="color: #05bbfe;">'+condition.value+'</span></div>');
                    break;
                case "SW":    // starts with
                    return ('<div class="row formItem" style="background-color: #626262; text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+'</span><span style="color: white;"> ENTHÄLT </span><span style="color: #05bbfe;">'+condition.value+'</span></div>');
                    break;
                case "NE":    // not empty
                    return ('<div class="row formItem" style="background-color: #626262;  text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+'</span><span style="color: white;"> IST VORHANDEN '+' </span></div>');
                    break;
                case "EM":    // empty
                    return ('<div class="row formItem" style="background-color: #626262;  text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+'</span><span style="color: white;"> IST NICHT VORHANDEN '+' </span></div>');
                    break;
                case "EQ": // equals

                    if(isEmpty(condition.def)){
                        return ('<div class="row formItem" style="background-color: #626262;  text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+'</span><span style="color: white;"> = </span><span style="color: #05bbfe;">'+condition.value+'</span></div>');

                    }else{
                        return ('<div class="row formItem" style="background-color: #626262;  text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+'</span><span style="color: white;"> = </span><span style="color: #05bbfe;">'+condition.def+'</span></div>');
                    }
                    break;
                case "GT": //greater than
                    if (condition.type === "Date"){

                        var date = new Date(parseInt(condition.value, 10));
                        return ('<div class="row formItem" style="background-color: #626262;  text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+' > </span><span style="color: #05bbfe;">'+ date.getFullYear() +' </span></div>');
                    }else{
                        return ('<div class="row formItem" style="background-color: #626262;  text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+' > </span><span style="color: #05bbfe;">'+condition.value+' </span></div>');
                    }
                    break;
                case "LT": // less than
                    if (condition.type === "Date"){

                        var date = new Date(parseInt(condition.value, 10));
                        return ('<div class="row formItem" style="background-color: #626262;  text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+' < </span><span style="color: #05bbfe;">'+date.getFullYear() +' </span></div>');
                    }else{
                        return ('<div class="row formItem" style="background-color: #626262;  text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+' < </span><span style="color: #05bbfe;">'+condition.value+' </span></div>');
                    }
                    break;
                case "GE": // greater equals
                    if (condition.type === "Date"){

                        var date = new Date(parseInt(condition.value, 10));
                        return ('<div class="row formItem" style="background-color: #626262;  text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+' >= </span><span style="color: #05bbfe;">'+date.getFullYear() +' </span></div>');
                    }else{
                        return ('<div class="row formItem" style="background-color: #626262;  text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+' >= </span><span style="color: #05bbfe;">'+condition.value+' </span></div>');
                    }
                    break;
                case "LE": // less equals
                    if (condition.type === "Date"){

                        var date = new Date(parseInt(condition.value, 10));
                        return ('<div class="row formItem" style="background-color: #626262;  text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+' <= </span><span style="color: #05bbfe;">'+date.getFullYear() +' </span></div>');
                    }else{
                        return ('<div class="row formItem" style="background-color: #626262;  text-shadow: 1px -1px 3px #323232;"><span>'+condition.name+' <= </span><span style="color: #05bbfe;">'+condition.value+' </span></div>');
                    }
                    break;
                default:
                    log.error("JSON TO XML: The right case for $filter.op couldn't be found")
            }
        }
    }


    function updateSearchCriteriaContainer() {
        $('.queryResultChartContent').hide();
        $('.chartArrow').each(function () {
            rotateElement($(this), 0);
        });
        var chart = $('#chart').parent();
        $('#chart').parent().detach();
        chart.insertAfter($("#decentralsearch").parent());

        rotateElement($('#searchcriteria').children('.chartArrow'), 90);
        $('#searchcriteria').next().show();

        $('.resultDiv').html("");

        $(''+updateSearchCriteriaRecursive(serialize())+'').appendTo('.resultDiv');

    }


});
