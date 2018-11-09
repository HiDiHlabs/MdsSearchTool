/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

/*jslint browser: true */
/*global $*/

$(function () {
    "use strict";

    var button = $('button#update'),
        text = $('#updateText');

    function failed() {
        button.prop( "disabled", false);
        text.html('Update failed.');
    }

    if (controllerName === 'admin') {
        button.click(function () {
            button.prop( "disabled", true);
            text.html('Updating...');

            $.ajax({
                url: createLink('admin', 'updateMetadata'),
                type: 'GET',
                dataType: 'json',
                error: function () {
                    failed();
                },
                success: function (data) {
                    if(data.successful === true) {
                        button.prop( "disabled", false);
                        text.html('Update successful.');
                    } else {
                        failed();
                    }
                }
            });
        });
    }
});
