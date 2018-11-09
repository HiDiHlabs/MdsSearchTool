/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

/*jslint browser: true */
/*global $, createLink */

$(function () {
    "use strict";
    var select = $('div.cloud select.search');

    select.val('');

    select.change(function (event) {
        window.location = createLink('search', 'index', $(event.target).val());
    });

});
