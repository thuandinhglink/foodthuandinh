jQuery(document).on('ready', function($) {
    "use strict";
    // Loader
    $(window).on('load', function() {
        $('.loader').fadeOut('slow', function() {
            $(this).remove();
        });
    });
    // Header Fixed on Scroll
    $(window).on('scroll', function() {
        if ($(window).scrollTop() > 100) {
            $("#header").addClass('header-fixed');
        } else {
            $("#header").removeClass('header-fixed');
        }
    });
    // Navbar Hover Menu
    $('.dropdown').hover(function() {
        $(this).find('.dropdown-menu').first().stop(true, true).slideDown(150);
        $(this).find('.dropdown-menu').parent('.nav-item.dropdown').addClass("dropdown-active");
    }, function() {
        $(this).find('.dropdown-menu').first().stop(true, true).slideUp(105);
        $(this).find('.dropdown-menu').parent('.nav-item.dropdown').removeClass("dropdown-active");
    });
    // Play Video
    $('#clickplay').on('click', function(event) {
        var vi = $("#videoinput").val();
        $("#vidframe").attr('src', vi);
        event.preventDefault();
    });
    // Carousels
    if ($('div').hasClass('owl-carousel')) {
        // Customer Says Carousel
        $('#customer-carousel').owlCarousel({
            items: 2,
            lazyLoad: !0,
            autoPlay: 3000,
            itemsDesktop: 1,
        });
        // Our Clients Carousel
        $('#clients-carousel').owlCarousel({
            items: 6,
            lazyLoad: !0,
            autoPlay: 3000,
            itemsDesktop: 1,
        });
        // who-we-are-carousel
        $('#who-we-are-carousel').owlCarousel({
            items: 1,
            lazyLoad: !0,
            autoPlay: 3000,
            itemsDesktop: 1,
        });
    };
    // Activate Isotope
    $(window).on('load', function() {
        var $container = $('.portfolio-items').isotope({
            itemSelector: '.item',
            masonry: {
                columnWidth: '.col-lg-4'
            }
        });
    });
    // Bind Filter Button Click
    var filters = $('.filters-group ul li');
    filters.on('click', function() {
        filters.removeClass('active');
        $(this).addClass('active');
        var filterValue = $(this).attr('data-filter');
        // Use filter if matches value
        $('.portfolio-items').isotope({
            filter: filterValue
        });
    });
    // Scroll to Back to Top Btn Show
    $(window).on('scroll', function() {
        if ($(window).scrollTop() > 400) {
            $(".backto-top-btn").addClass('backto-top-blk');
        } else {
            $(".backto-top-btn").removeClass('backto-top-blk');
        }
    });
    // Smooth Scrolling Using jQuery Easing
    $(".backto-top-btn a[href^='#']").on('click', function(e) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
        if (target.length) {
            $('html, body').animate({
                scrollTop: (target.offset().top - 72)
            }, 1000, "easeInOutExpo");
            return false;
        }
    });
}(jQuery)); // End jQuery