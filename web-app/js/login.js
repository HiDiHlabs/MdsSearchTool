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

    function login() {
        $('body').addClass('isWaiting');
        var loginRequest = $.post(createLink('j_spring_security_check'), $('#login-form').serialize());
        loginRequest.done(function (data, textStatus, jqXHR) {
            window.location = createLink('search');
        });
        loginRequest.fail(function (jqXHR, textStatus, errorThrown) {
            if (jqXHR.status === 401) {
                $('#password').val('');
                $('#message-box').text($.i18n.prop('login.authenticationFailed'));
            } else {
                $('#message-box').text($.i18n.prop('login.error'));
            }
            $('body').removeClass('isWaiting');
        });
    }

    $('#login-form').on('submit', function (event) {
        event.preventDefault();
        login();
    });

    $('.login-button-box').on('click', function (event) {
        event.preventDefault();
        login();
    });


    $(function(){
        $('input').keydown(function(e){
            if (e.keyCode == 13) {
                $(this).parents('form').submit();
                return false;
            }
        });
    });
});
