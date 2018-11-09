/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

modules = {
    mdsearch {
        resource url: 'css/normalize-1.1.0.css'
        resource url: 'js/jquery-ui-1.10.3.custom/css/ui-darkness/jquery-ui-1.10.3.custom.min.css'
        resource url: 'css/main.css'
        resource url: 'css/home.css'
        resource url: '/css/login.less', attrs: [rel: 'stylesheet/less', type: 'css']
//, disposition: 'head', bundle:'bundle_mdsearch'
        resource url: 'css/navigation.less', attrs: [rel: 'stylesheet/less', type: 'css'], disposition: 'head'
        resource url: '/css/main.less', attrs: [rel: 'stylesheet/less', type: 'css'], disposition: 'head'
//, bundle:'bundle_mdsearch'
        resource url: '/css/search.less', attrs: [rel: 'stylesheet/less', type: 'css'], disposition: 'head'
//, bundle:'bundle_mdsearch'

        // there must be a css file at the end of the bundle,
        // otherwise less compilation doesn't work (according to http://grails.org/plugin/lesscss-resources)
        resource url: 'css/empty.css'

        resource url: 'js/jquery/jquery-1.9.1.js'
        resource url: 'js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js'
        resource url: 'js/jquery/jquery.i18n.properties-1.0.9.js'
        resource url: 'js/jquery/jquery.rotate-2.3.js'

        resource url: 'js/RGraph/libraries/RGraph.common.core.js'
        resource url: 'js/RGraph/libraries/RGraph.common.dynamic.js'   // needed for dynamic features (eg tooltips)
        resource url: 'js/RGraph/libraries/RGraph.common.annotate.js'  // needed for annotating
        resource url: 'js/RGraph/libraries/RGraph.common.context.js'   // needed for context menus
        resource url: 'js/RGraph/libraries/RGraph.common.effects.js'   // needed for visual effects
        resource url: 'js/RGraph/libraries/RGraph.common.key.js'       // needed for keys
        resource url: 'js/RGraph/libraries/RGraph.common.resizing.js'  // needed for resizing
        resource url: 'js/RGraph/libraries/RGraph.common.tooltips.js'  // needed for tooltips
        resource url: 'js/RGraph/libraries/RGraph.common.zoom.js'      // needed for zoom
        resource url: 'js/RGraph/libraries/RGraph.drawing.yaxis.js'    // needed for labeling the y-axis
        resource url: 'js/RGraph/libraries/RGraph.bar.js'              // needed for Bar charts

        resource url: 'js/application.js'

        resource url: 'js/overview.js'
        resource url: 'js/search.js'
        resource url: 'js/searchResultGraph.js'
        resource url: 'js/login.js'
        resource url: 'js/admin.js'
    }

    ie {
        dependsOn 'mdsearch'
        resource url: 'js/compat/html5shiv-3.6.2.js',
                wrapper: { s -> "<!--[if lt IE 9]>$s<![endif]-->" }
        resource url: 'js/compat/selectivizr-1.0.2.js',
                wrapper: { s -> "<!--[if lt IE 9]>$s<![endif]-->" }
    }

    ie_head {
        resource url: 'js/compat/excanvas-r3.js',
                wrapper: { s -> "<!--[if IE]>$s<![endif]-->" },
                disposition: 'head'
        resource url: 'js/compat/json2-2013-05-26.js',
                wrapper: { s -> "<!--[if IE]>$s<![endif]-->" },
                disposition: 'head'
    }
}
