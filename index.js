'use strict';

var INFINITE_SCROLL_TEST = (function() {

    var $infoCardList = '.js-info-card-list',
        $loadingImg   = '.js-loading-img',
        start         = 0,
        limit         = 5,
        hasReachedMax = false,
        isInitialLoad = true;

    var handleLoadInfoCards = function() {

        if (hasReachedMax) {
            return;
        }

        $.ajax({
            url: 'api/get-conf-data.php',
            method: 'POST',
            dataType: 'json',
            data: {
                getData: 1,
                start: start,
                limit: limit,
            },
            beforeSend: function() {
                if (!isInitialLoad) {
                    $($loadingImg).show();
                }
                isInitialLoad = false;
            },
            success: function(data) {
                if (data.status === 'success') {
                    $($infoCardList).append(data.res);
                } else if (data.status === 'max-reached') {
                    hasReachedMax = true;
                }
            },
            complete: function() {
                $($loadingImg).hide();
            }
        })
    };

    var handleWindowScroll = function() {
        // $(document).height() -> HTML document height
        // $(window).height() -> viewport height
        // If window.scrollTop() equals the difference between the document and viewport height,
        // then we've scrolled to the bottom. Make a loadInfoCards request.

        // Using Math.ceil on scrollTop() to get a matching or exact value to the diff between the document and viewport height.
        // This is cos scrollTop happens to return a float on Chrome.
        if (Math.ceil($(window).scrollTop()) == ($(document).height() - $(window).height())) {
            if (hasReachedMax) {
                return;
            }
            start += limit;
            handleLoadInfoCards();
        }
    };

    var handleDocReady = function() {
        $(document).ready(function() {
            handleLoadInfoCards();
            $(window).scroll(handleWindowScroll)
        });
    }

    return {
        init: function() {
            handleDocReady();
        },
    };

}());

INFINITE_SCROLL_TEST.init();

