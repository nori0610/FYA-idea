// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// page to top
$(function() {
    var topBtn = $('#page-top');
    topBtn.hide();
    //スクロールが100に達したらボタン表示
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            topBtn.fadeIn();
        } else {
            topBtn.fadeOut();
        }
    });
    //スクロールしてトップ
    topBtn.click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        return false;
    });
});

// footer
$(function() {
    var winWidth = $('body').outerWidth(true);
    var footer = $('#footer');
    var slide = $('#slide');
    //画面下位置を取得
    var bottomPos = $(document).height() - $(window).height() -500;
    var showFlug = false;

    // ウィンドウより小さかったら開く
    panelOpen();
    //slideを画面右外へ配置
    $('#slide').css('margin-left', winWidth+'px');
    $(window).scroll(function () {
        panelOpen();
    });
    //閉じるボタン
    $('#close').click(function(){
        footer.hide();
    });
    //ウィンドウリサイズしたらwidth変更
    $(window).resize(function(){
        winWidth = $('body').outerWidth(true);
        bottomPos = $(document).height() - $(window).height() - 500;
    });

    function panelOpen() {
        if ($(this).scrollTop() >= bottomPos) {
            if (showFlug == false) {
                showFlug = true;
                slide.stop().animate({'marginLeft' : '0px'}, 200);
            }
        } else {
            if (showFlug) {
                showFlug = false;
                slide.stop().animate({'marginLeft' : winWidth+'px'}, 200);
            }
        }
    }
});
