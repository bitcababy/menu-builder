// Item Name : Mega Menu Reloaded
// Item URI : http://codecanyon.net/item/mega-menu-reloaded/1593152
// Author URI : http://codecanyon.net/user/Pixelworkshop/
// Version : 1.3

(function($) {

    function megaMenuOver() {

        var dropDown = $('.megamenu_fullwidth', this);

        if (hoverIntentEffect === 'hover_fade') {
            $(dropDown).fadeIn(hoverIntentShow, hoverIntentEasing);
            $(this).hover(function() {
                $(dropDown).fadeOut(hoverIntentHide, hoverIntentEasing);
            });
        }
        else if (hoverIntentEffect === 'hover_slide') {
            $(dropDown).slideDown(hoverIntentShow, hoverIntentEasing);
            $(this).hover(function() {
                $(dropDown).slideUp(hoverIntentHide, hoverIntentEasing);
            });
        }
        else if (hoverIntentEffect === 'click_fade') {
            $(this).click(function() {
                $(dropDown).fadeIn(hoverIntentShow, hoverIntentEasing);
                $(this).hover(function() {
                    $(dropDown).fadeOut(hoverIntentHide, hoverIntentEasing);
                });
            });
        }
        else if (hoverIntentEffect === 'click_slide') {
            $(this).click(function() {
                $(dropDown).slideDown(hoverIntentShow, hoverIntentEasing);
                $(this).hover(function() {
                    $(dropDown).slideUp(hoverIntentHide, hoverIntentEasing);
                });
            });
        }

    }

    function megaMenuOut() {
        var dropDown = $('.megamenu_fullwidth', this);
        $(dropDown).hide();
    }

    function megaMenuTrigger() {

        var megaMenuBar = $('.megamenu_fixed');

        $(megaMenuBar).after('<a id="megamenu_trigger" href="#"></a>');

        if (megamenuBarHide === 1) {
            $(megaMenuBar).hide(0);
            $('#megamenu_trigger').toggleClass("active");
        }

        $('#megamenu_trigger').click(function() {

            $(megaMenuBar).slideToggle(300);
            $(this).toggleClass("active");
            return false;

        });

    }

    function megaMenuClickOutside() {

        $(document).click(function() {
            $('.megamenu').children('li').removeClass('active');
            $('.megamenu_fullwidth').hide(0);
        });

        $('.megamenu').click(function(event) {
            event.stopPropagation();
        });

    }

    $.fn.megaMenuReloaded = function(settings) {


        var options = $.extend({
            menu_speed_show: 300,
            // Time (in milliseconds) to show a drop down
            menu_speed_hide: 200,
            // Time (in milliseconds) to hide a drop down
            menu_speed_delay: 200,
            // Time (in milliseconds) before showing a drop down
            menu_effect: 'open_close_slide',
            // Drop down effect, choose between 'hover_fade', 'hover_slide', 'click_fade', 'click_slide', 'open_close_fade', 'open_close_slide'
            menu_easing: 'jswing',
            // Easing Effect : 'easeInQuad', 'easeInElastic', etc.
            menu_click_outside: 0,
            // Clicks outside the drop down close it (1 = true, 0 = false)
            menu_show_onload: 0,
            // Drop down to show on page load (type the number of the drop down, 0 for none)
            menubar_trigger: 0,
            // Show the menu trigger (button to show / hide the menu bar), only for the fixed version of the menu (1 = show, 0 = hide)
            menubar_hide: 0
            // Hides the menu bar on load (1 = hide, 0 = show)
        },
        settings);


        return this.each(function() {


            var megaMenu = $(this),
            menuItem = $(megaMenu).children('li'),
            menuDropDown = $(menuItem).children('.megamenu_fullwidth');
            menuDropDownScroller = $('.megamenu_scroller_container');


            if ((menuDropDownScroller.length > 0)) {
                $(menuDropDownScroller).nanoScroller();
            }

            $(menuDropDown).css('left', '0').hide();

            if (options.menubar_trigger === 1) {
                megamenuBarHide = options.menubar_hide;
                megaMenuTrigger();
            }
            if (options.menu_click_outside === 1) {
                megaMenuClickOutside();
            }


            if (Modernizr.touch) {

                $(menuItem).children('span').bind('touchstart',
                function() {

                    var $this = $(this);
                    $this.parent('li').siblings().removeClass('active').end().toggleClass('active');
                    $this.parent('li').siblings().find(menuDropDown).slideUp(options.menu_speed_hide);
                    $this.parent('li').find(menuDropDown).delay(options.menu_speed_delay).slideToggle(options.menu_speed_show).click(function(event) {
                        event.stopPropagation();
                    });

                });

            }


            else if (options.menu_effect === 'hover_fade' || options.menu_effect === 'hover_slide' || options.menu_effect === 'click_fade' || options.menu_effect === 'click_slide') {

                hoverIntentEffect = options.menu_effect;
                hoverIntentEasing = options.menu_easing;
                hoverIntentShow = options.menu_speed_show;
                hoverIntentHide = options.menu_speed_hide;
                // HoverIntent Configuration
                var hoverIntentConfig = {
                    sensitivity: 2,
                    // number = sensitivity threshold (must be 1 or higher)
                    interval: 100,
                    // number = milliseconds for onMouseOver polling interval
                    over: megaMenuOver,
                    // function = onMouseOver callback (REQUIRED)
                    timeout: 200,
                    // number = milliseconds delay before onMouseOut
                    out: megaMenuOut
                    // function = onMouseOut callback (REQUIRED)
                };

                $(menuItem).hoverIntent(hoverIntentConfig);

            }


            else if (options.menu_effect == 'open_close_fade') {

                $(menuItem + ':nth-child(' + options.menu_show_onload + ')').children('.megamenu_fullwidth').show().parent(menuItem).toggleClass('active');
                $(menuItem).unbind('mouseenter mouseleave');

                $(menuItem).click(function() {

                    var $this = $(this);
                    $this.siblings().removeClass('active').end().toggleClass('active');
                    $this.siblings().find(menuDropDown).fadeOut(options.menu_speed_hide, options.menu_easing);
                    $this.find(menuDropDown).delay(options.menu_speed_delay).fadeToggle(options.menu_speed_show, options.menu_easing).click(function(event) {
                        event.stopPropagation();
                    });

                });

            }


            else if (options.menu_effect === 'open_close_slide') {

                $(menuItem + ':nth-child(' + options.menu_show_onload + ')').children('.megamenu_fullwidth').show().parent(menuItem).toggleClass('active');
                $(menuItem).unbind('mouseenter mouseleave');

                $(menuItem).click(function() {

                    var $this = $(this);
                    $this.siblings().removeClass('active').end().toggleClass('active');
                    $this.siblings().find(menuDropDown).slideUp(options.menu_speed_hide, options.menu_easing);
                    $this.find(menuDropDown).delay(options.menu_speed_delay).slideToggle(options.menu_speed_show, options.menu_easing).click(function(event) {
                        event.stopPropagation();
                    });

                });

            }


        });
        // End each
    };

    $.fn.megaMenuTabs = function(el) {

        return this.each(function() {

            var menuTabs = $(this);
            menuTabsNav = menuTabs.find(".megamenu_tabs_nav");

            menuTabsNav.delegate("li > a", "click",
            function() {

                var menuTabsLinkCurrent = menuTabs.find("a.current").attr("href").substring(1),

                $menuTabsLink = $(this),
                menuTabsLinkID = $menuTabsLink.attr("href").substring(1);

                if ((menuTabsLinkID != menuTabsLinkCurrent) && (menuTabs.find(":animated").length === 0)) {

                    menuTabs.find(".megamenu_tabs_nav li a").removeClass("current");
                    $menuTabsLink.addClass("current");

                    menuTabs.find("#" + menuTabsLinkCurrent).fadeOut(300,
                    function() {

                        menuTabs.find("#" + menuTabsLinkID).fadeIn(300);
                        var newHeight = menuTabs.find("#" + menuTabsLinkID).height();

                    });

                }

                return false;

            });

        });

    };

    /**
	 * Simple Carousel
	 * Copyright (c) 2010 Tobias Zeising, http://www.aditu.de
	 * Licensed under the MIT license
	 * 
	 * http://code.google.com/p/simple-carousel/
	 * Version 0.3
	 */
    $.fn.simplecarousel = function(params) {
        // set config
        $('.megamenu').append('<span class="megamenu_carousel_prev"></span><span class="megamenu_carousel_next"></span>');

        var defaults = {
            width: 960,
            visible: 1,
            next: $('.megamenu_carousel_next'),
            prev: $('.megamenu_carousel_prev'),
            current: 0,
            items: 2,
            slidespeed: 600
        };
        var config = $.extend(defaults, params);
        var ul = $(this);
        var width = config.width;

        ul.wrap('<div class="megamenu_carousel_frame"></div>');

        var container = ul.parent('.megamenu_carousel_frame');
        ul.width(config.items * config.width);

        var slide = function(dir, click) {

            if (dir == "next") {
                config.current += config.visible;
                if (config.current >= config.items)
                config.current = 0;
            } else if (dir == "prev") {
                config.current -= config.visible;
                if (config.current < 0)
                config.current = (config.visible == 1) ? config.items - 1: config.items - config.visible + (config.visible - (config.items % config.visible));
            } else {
                config.current = dir;
            }

            ul.animate({
                marginLeft: -1.0 * config.current * config.width
            },
            config.slidespeed);

        }

        if (config.next) {
            config.next.click(function() {
                slide('next', true);
            });
        }
				if (config.prev) {
            config.prev.click(function() {
                slide('prev', true);
            });
				}

    }

})(jQuery);

