/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

/*jslint browser: true */
/*global $*/

// functions for creating links with application name prepended
function path(path2) {
    "use strict";
    return $('meta[name=contextPath]').attr('content') + path2;
}

function createLink(controller, action, id) {
    "use strict";
    var path2 = '/' + controller;
    if (action !== undefined) {
        path2 += '/' + action;
        if (id !== undefined) {
            path2 += '/' + id;
        }
    }
    return path(path2);
}

// current controller
var controllerName = $('meta[name=controllerName]').attr('content');

// initialize i18n-plugin
$.i18n.properties({
    name: 'messages',
    path: path('/i18n/index/'),
    mode: 'map'
});

// prevent errors if console is not available
if (window.console === undefined) {
    window.console = {
        log: function () {
            "use strict";
        }
    };
}

// redefine alert() to log to console
window.alert = function () {
    "use strict";
    window.console.log(arguments);
};

// show login overlay if the user is logged out after timeout
$(function () {
    "use strict";
    if (controllerName !== 'home') {
        $(document).ajaxError(function (event, jqXHR, ajaxSettings, thrownError) {
            if (jqXHR.status === 401) {
                $('#loginOverlay').removeClass('isInvisible');
                $('.loginButton').removeClass('isInvisible');
            } else {
                $('#message-box').text('An error occurred, please try again later.');
            }
        });
    }
});

// enable jQueryUI tooltips
$(function () {
    "use strict";
    $('.tooltip').tooltip();
});
