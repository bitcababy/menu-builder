(($) ->
	megaMenuOver = ->
		dropDown = $(".megamenu_fullwidth", this)
		if hoverIntentEffect is "hover_fade"
			$(dropDown).fadeIn hoverIntentShow, hoverIntentEasing
			$(this).hover ->
				$(dropDown).fadeOut hoverIntentHide, hoverIntentEasing
		else if hoverIntentEffect is "hover_slide"
			$(dropDown).slideDown hoverIntentShow, hoverIntentEasing
			$(this).hover ->
				$(dropDown).slideUp hoverIntentHide, hoverIntentEasing
				foo
		else if hoverIntentEffect is "click_fade"
			$(this).click ->
				$(dropDown).fadeIn hoverIntentShow, hoverIntentEasing
				$(this).hover ->
					$(dropDown).fadeOut hoverIntentHide, hoverIntentEasing
		else if hoverIntentEffect is "click_slide"
			$(this).click ->
				$(dropDown).slideDown hoverIntentShow, hoverIntentEasing
				$(this).hover ->
					$(dropDown).slideUp hoverIntentHide, hoverIntentEasing

	megaMenuOut = ->
		dropDown = $(".megamenu_fullwidth", this)
		$(dropDown).hide()

	megaMenuTrigger = ->
		megaMenuBar = $(".megamenu_fixed")
		$(megaMenuBar).after "<a id=\"megamenu_trigger\" href=\"#\"></a>"
		if megamenuBarHide is 1
			$(megaMenuBar).hide 0
			$("#megamenu_trigger").toggleClass "active"
		$("#megamenu_trigger").click ->
			$(megaMenuBar).slideToggle 300
			$(this).toggleClass "active"
			false

	megaMenuClickOutside = ->
		$(document).click ->
			$(".megamenu").children("li").removeClass "active"
			$(".megamenu_fullwidth").hide 0

		$(".megamenu").click (event) ->
			event.stopPropagation()

	$.fn.megaMenuReloaded = (options) ->
		options = $.extend(
			menu_speed_show: 300
			menu_speed_hide: 200
			menu_speed_delay: 200
			menu_effect: "open_close_slide"
			menu_easing: "jswing"
			menu_click_outside: 0
			menu_show_onload: 0
			menubar_trigger: 0
			menubar_hide: 0
		, options)

		@each ->
			megaMenu = $(this)
			menuItem = $(megaMenu).children("li")
			menuDropDown = $(menuItem).children(".megamenu_fullwidth")
			menuDropDownScroller = $(".megamenu_scroller_container")
			$(menuDropDownScroller).nanoScroller()	if menuDropDownScroller.length > 0
			$(menuDropDown).css("left", "0").hide()
			if options.menubar_trigger is 1
				megamenuBarHide = options.menubar_hide
				megaMenuTrigger()
			megaMenuClickOutside()	if options.menu_click_outside is 1
			if Modernizr.touch
				$(menuItem).children("span").bind "touchstart", ->
					$this = $(this)
					$this.parent("li").siblings().removeClass("active").end().toggleClass "active"
					$this.parent("li").siblings().find(menuDropDown).slideUp options.menu_speed_hide
					$this.parent("li").find(menuDropDown).delay(options.menu_speed_delay).slideToggle(options.menu_speed_show).click (event) ->
						event.stopPropagation()
			else if options.menu_effect is "hover_fade" or options.menu_effect is "hover_slide" or options.menu_effect is "click_fade" or options.menu_effect is "click_slide"
				hoverIntentEffect = options.menu_effect
				hoverIntentEasing = options.menu_easing
				hoverIntentShow = options.menu_speed_show
				hoverIntentHide = options.menu_speed_hide
				hoverIntentConfig =
					sensitivity: 2
					interval: 100
					over: megaMenuOver
					timeout: 200
					out: megaMenuOut

				$(menuItem).hoverIntent hoverIntentConfig
			else if options.menu_effect is "open_close_fade"
				$(menuItem + ":nth-child(" + options.menu_show_onload + ")").children(".megamenu_fullwidth").show().parent(menuItem).toggleClass "active"
				$(menuItem).unbind "mouseenter mouseleave"
				$(menuItem).click ->
					$this = $(this)
					$this.siblings().removeClass("active").end().toggleClass "active"
					$this.siblings().find(menuDropDown).fadeOut options.menu_speed_hide, options.menu_easing
					$this.find(menuDropDown).delay(options.menu_speed_delay).fadeToggle(options.menu_speed_show, options.menu_easing).click (event) ->
						event.stopPropagation()
			else if options.menu_effect is "open_close_slide"
				$(menuItem + ":nth-child(" + options.menu_show_onload + ")").children(".megamenu_fullwidth").show().parent(menuItem).toggleClass "active"
				$(menuItem).unbind "mouseenter mouseleave"
				$(menuItem).click ->
					$this = $(this)
					$this.siblings().removeClass("active").end().toggleClass "active"
					$this.siblings().find(menuDropDown).slideUp options.menu_speed_hide, options.menu_easing
					$this.find(menuDropDown).delay(options.menu_speed_delay).slideToggle(options.menu_speed_show, options.menu_easing).click (event) ->
						event.stopPropagation()

	$.fn.megaMenuTabs = (el) ->
		@each ->
			menuTabs = $(this)
			menuTabsNav = menuTabs.find(".megamenu_tabs_nav")
			menuTabsNav.delegate "li > a", "click", ->
				menuTabsLinkCurrent = menuTabs.find("a.current").attr("href").substring(1)
				$menuTabsLink = $(this)
				menuTabsLinkID = $menuTabsLink.attr("href").substring(1)
				if (menuTabsLinkID isnt menuTabsLinkCurrent) and (menuTabs.find(":animated").length is 0)
					menuTabs.find(".megamenu_tabs_nav li a").removeClass "current"
					$menuTabsLink.addClass "current"
					menuTabs.find("#" + menuTabsLinkCurrent).fadeOut 300, ->
						menuTabs.find("#" + menuTabsLinkID).fadeIn 300
						newHeight = menuTabs.find("#" + menuTabsLinkID).height()
				false

	$.fn.simplecarousel = (params) ->
		$(".megamenu").append "<span class=\"megamenu_carousel_prev\"></span><span class=\"megamenu_carousel_next\"></span>"
		defaults =
			width: 960
			visible: 1
			next: $(".megamenu_carousel_next")
			prev: $(".megamenu_carousel_prev")
			current: 0
			items: 2
			slidespeed: 600

		config = $.extend(defaults, params)
		ul = $(this)
		width = config.width
		ul.wrap "<div class=\"megamenu_carousel_frame\"></div>"
		container = ul.parent(".megamenu_carousel_frame")
		ul.width config.items * config.width
		slide = (dir, click) ->
			if dir is "next"
				config.current += config.visible
				config.current = 0	if config.current >= config.items
			else if dir is "prev"
				config.current -= config.visible
				config.current = (if (config.visible is 1) then config.items - 1 else config.items - config.visible + (config.visible - (config.items % config.visible)))	if config.current < 0
			else
				config.current = dir
			ul.animate
				marginLeft: -1.0 * config.current * config.width
			, config.slidespeed

		unless config.next is false
			config.next.click ->
				slide "next", true
		unless config.prev is false
			config.prev.click ->
				slide "prev", true
) jQuery