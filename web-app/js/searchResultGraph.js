/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

/*jslint browser: true */
/*global $, createLink, RGraph*/

$(function () {
    "use strict";


    /*
     * function     : setResultChart
     * parameters   : data => ["items": ["item1, item2"], "values": ["value1", "value2"]]
     * description  : draws the chart with the received data
     * return       : none
     */
    function setResultChart(data, entityType) {
        var YMax = getYMax(data.values);
        RGraph.Reset($('#resultBar')[0]);

        var maximum = RGraph.array_max(data.values);

        var bar3 = new RGraph.Bar({
            id: 'resultBar',
            data: data.values,
            options: {
                noyaxis: true,
                ylabels: false,
                labelsOffsety: 5,
                textAngle: 35,
                gutterLeft: 50,
                gutterBottom: 100,
                backgroundGrid: false,
                colors: ['#7CB5EC','#BEFDAF'],
                keyRounded: true,
                keyBackground: '#C8C8C8',
                textAccessible: false,
                labelsAbove: true,

            }
        }).draw();

        var scale = RGraph.getScale2(bar3, {
            max: maximum
        });
        var maximum = scale.max;


        var bar2 = new RGraph.Bar({
            id: 'resultBar',
            data: data.values,
            options: {
                labels: data.items,
                noyaxis: true,
                ylabels: false,
                hmargin: 8,
                labelsOffsety: 5,
                textAngle: 35,
                gutterLeft: 50,
                gutterBottom: 100,
                backgroundGrid: false,
                colors: ['#05A0FF', '#D2EFFF'],
                keyRounded: true,
                keyPosition: 'gutter',
                keyBackground: '#C8C8C8',
                labelsAbove: true,
                grouping: 'stacked',
                textAccessible: false,
            }
        }).draw();

        new RGraph.Drawing.YAxis({
            id: 'resultBar',
            x: bar2.gutterLeft,
            options: {
                max: bar2.max,
                title: entityType,
                gutterBottom: 100,
                textSize: 8,
                colors: ['black'],
                textAccessible: false,
            }
        }).draw();
    }


    function getYMax(values){
        var max=0;
        for(var index = 0; index < values.length; ++index) {
            if(max <= values[index]){
                max = values[index];
            }
        }
        if (max == 0){
            return 10;
        }
        return max;
    }

    /*
     * get LoVs for an attribute, from the DOM
     */
    function getLovForAttribute(attribute) {
        var lov = [];
        $('.groupContainer:first .values-' + attribute).each(function () {
            lov.push($(this).text());
        });
        return lov;
    }

    /*
     * get type of an attribute, from the DOM
     */
    function getTypeForAttribute(attribute) {
        return $('.propertyOptionContainer').filter('[data-key=' + attribute + ']').data('type');
    }


    /*
     * function     : ajaxRequestGraphic
     * parameters   : none (event)
     * description  : triggers all functions needed for the query being processed and processes the results:
     *      - adds/removes a class to the run query button => background changes from .png to animated .gif
     *      - triggers the serialize function to get the query pattern
     *      - makes a ajax request to the search controller´s function result - sends query and entityType
     *      - receives query data
     *      - displays query result container
     *      - displays hits in query result container
     *      - triggers setResultChart function to insert results into chart
     * return       : none
     */
    function ajaxRequestGraphic(event, query) {
        if (event) {
            event.preventDefault();
        }
        var timeBefore = new Date(),
            xAxisValue,
            entityType,
            entityTypeText;
        $('.btnRunQuery').addClass('btnRunQueryRunning');
        xAxisValue = $('.resultBarXAxis').val();
        entityType = $('.resultBarEntityType').val();
        entityTypeText = $('.resultBarEntityType option:selected').text();

        displayPatientResults(query, xAxisValue, entityType, entityTypeText, timeBefore);
        displayStatisticsChart(query, xAxisValue, entityType, entityTypeText, timeBefore);

    }

    function displayPatientResults (query, xAxisValue, entityType, entityTypeText, timeBefore){

        $.when(patientsResult(query,xAxisValue,entityType), samplesResult(query,xAxisValue,entityType), patientsTotal(query,xAxisValue,entityType), samplesTotal(query,xAxisValue,entityType)).done(function(a1, a2, a3, a4){

            if(a1[2].status === 200 && a2[2].status === 200 && a3[2].status === 200 && a4[2].status === 200){


                $('.queryResultContainer').show();

                var timeAfter = new Date();

                $('#patHits').html(a1[0].hits.Patient);
                $('#patPosHits').html(a3[0].hits.PatientPos);
                $('#sampleHits').html(a2[0].hits.Biomaterial);
                $('#samplePosHits').html(a4[0].hits.BiomaterialPos);

                $('#pat').show();
                if($.trim(a2[0].hits.Biomaterial) !== "") {
                    $('#sam').show();
                }else{
                    $('#sam').hide();
                }
                $('.queryResultTime').html('(' + (timeAfter.getTime() - timeBefore.getTime()) + ' ms)');


            }
            // the code here will be executed when all four ajax requests resolve.
            // a1, a2, a3 and a4 are lists of length 3 containing the response text,
            // status, and jqXHR object for each of the four ajax calls respectively.
        });
    }

    function displayStatisticsChart (query, xAxisValue, entityType, entityTypeText, timeBefore){
        $.when(chartResult(query,xAxisValue,entityType)).done(function(myChartResult){
            $('.btnRunQuery').removeClass('btnRunQueryRunning');

            var chartData;

            $('.btnRunQuery').removeClass('btnRunQueryRunning');
            $('.queryResultContainer').show();

            chartData = {};
            chartData.values = [];
            chartData.valuesPossible = [];

            chartData.items = []; //getLovForAttribute(xAxisValue);
            for(var index = 0; index < myChartResult.chart.length; ++index) {
                chartData.items.push(myChartResult.chart[index].group);
                chartData.values.push(myChartResult.chart[index].def);
                // chartData.valuesPossible.push(data.chart[index].pos);
            }


            setResultChart(chartData, entityTypeText);
            var timeAfter = new Date();

            $('.queryResultTime').html('(' + (timeAfter.getTime() - timeBefore.getTime()) + ' ms)');

            $('.queryResultChartContent').hide();
            $('.chartArrow').each(function () {
                rotateElement($(this), 0);
            });
            var searchcriteria = $('#searchcriteria').parent();
            $('#searchcriteria').parent().detach();
            searchcriteria.insertAfter($('#decentralsearch').parent());
            rotateElement($('#chart').children('.chartArrow'), 90);
            $('#chart').next().show();


        });
    }

    /*
    function displayStatisticsChart (query, xAxisValue, entityType, entityTypeText, timeBefore){
        $.when(chartResult(query,xAxisValue,entityType)).done(function(a1){
            $('.btnRunQuery').removeClass('btnRunQueryRunning');
            if(a1[2].status === 200){
                var chartData;

                $('.btnRunQuery').removeClass('btnRunQueryRunning');
                $('.queryResultContainer').show();

                chartData = {};
                chartData.values = [];
                chartData.valuesPossible = [];

                chartData.items = []; //getLovForAttribute(xAxisValue);
                for(var index = 0; index < a1[0].chart.length; ++index) {
                    chartData.items.push(a1[0].chart[index].group);
                    chartData.values.push(a1[0].chart[index].def);
                    // chartData.valuesPossible.push(data.chart[index].pos);
                }


                setResultChart(chartData, entityTypeText);
                var timeAfter = new Date();

                $('.queryResultTime').html('(' + (timeAfter.getTime() - timeBefore.getTime()) + ' ms)');

                $('.queryResultChartContent').hide();
                $('.chartArrow').each(function () {
                    rotateElement($(this), 0);
                });
                var searchcriteria = $('#searchcriteria').parent();
                $('#searchcriteria').parent().detach();
                searchcriteria.insertAfter($('#decentralsearch').parent());
                rotateElement($('#chart').children('.chartArrow'), 90);
                $('#chart').next().show();
            }

        });
    }
*/

    function samplesTotal(query,xAxisValue,entityType){
        return $.ajax({
            url: createLink('search', 'samplesTotal'),
            type: 'POST',
            dataType: 'json',
            data: {query: query, groupBy: xAxisValue, entityType: entityType.toLowerCase()}
    });
    }

    function patientsTotal(query,xAxisValue,entityType){
        return $.ajax({
            url: createLink('search', 'patientsTotal'),
            type: 'POST',
            dataType: 'json',
            data: {query: query, groupBy: xAxisValue, entityType: entityType.toLowerCase()}
    });
    }

    function chartResult(query,xAxisValue,entityType){
        return $.ajax({
            url: createLink('search', 'chartResult'),
            type: 'POST',
            dataType: 'json',
            data: {query: query, groupBy: xAxisValue, entityType: entityType.toLowerCase()}
    });
    }

    function samplesResult(query,xAxisValue,entityType){
        return $.ajax({
            url: createLink('search', 'samplesResult'),
            type: 'POST',
            dataType: 'json',
            data: {query: query, groupBy: xAxisValue, entityType: entityType.toLowerCase()}
    });
    }

    function patientsResult(query,xAxisValue,entityType){
        return $.ajax({
            url: createLink('search', 'patientsResult'),
            type: 'POST',
            dataType: 'json',
            data: {query: query, groupBy: xAxisValue, entityType: entityType.toLowerCase()}
    });
    }

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
     * element(event)   : .queryResultClose (click)
     * description      : closes the chart result container
     */
    $('#left-content').on('click', '.queryResultClose', function () {
        $('.queryResultContainer').hide();
    });


    /*
     * element(event)   : .listResultResultContainerClose (click)
     * description      : closes the list result container
     */
    $('#content').on('click', '.listResultResultContainerClose', function () {
        $('.listResultContainer').hide();
        $('.queryResultChartContainer').show();
    });


    /*
     * element(event)   : .btnRunQuery (click)
     * description      : triggers the ajaxRequestGraphic function
     */
    $('.btnRunQuery').click(function (event) {
        var query = JSON.stringify(serialize()),
            // save the currently selected entity type and query string in a closure
            runAjaxRequestGraphic = function () {
                ajaxRequestGraphic(event, query);
            };
        // add the closure to the change handler for the grouping selection
        // for the graph, remove previously attached closure
        $('.resultBarXAxis').off('change');
        $('.resultBarXAxis').change(function () {
            runAjaxRequestGraphic();
        });
        $('.resultBarEntityType').off('change');
        $('.resultBarEntityType').change(function () {
            runAjaxRequestGraphic();
        });
        runAjaxRequestGraphic();
    });


    /*
     * element(event)   : .btnRunQuery (click)
     * description      : triggers the ajaxRequestGraphic function
     */
    $('#decentralsearch').click(function (event) {
        $('.currently-loading').show();
        $('#decentralsearch').click(false);
        var query = JSON.stringify(serialize());
        // save the currently selected entity type and query string in a closure
                $.ajax({
                    url: createLink('search', 'sendQuery'),
                    type: 'POST',
                    dataType: 'json',
                    data: {query: query},
                    error: function (data) {
                        $('.currently-loading').hide();
                        $('#decentralsearch').click(true);
                        console.log ( 'error - query not valid or no access to DC Search' );
                    },
                    success: function (data) {
                        $('.currently-loading').hide();
                        $('#decentralsearch').click(true);
                        window.location.href = data.url;
                    }
                });
    });



});
