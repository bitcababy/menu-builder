#
# DC Mega Menu - jQuery mega menu
# Copyright (c) 2011 Design Chemical
#
# Dual licensed under the MIT and GPL licenses:
# 	http://www.opensource.org/licenses/mit-license.php
# 	http://www.gnu.org/licenses/gpl.html
#
#

(($) ->
  $.fn.dcMegaMenu = (options) ->
    defaults =
      direction: "horizontal"
      classParent: "megamenu"
      classContainer: "submenu"
      classSubParent: "hmenu-hdr"
      classSubLink: "hmenu-hdr"
      classWidget: "extra"
      rowItems: 3
      speed: "fast"
      effect: "fade"
      event: "hover"
      mbarIcon: false
      fullWidth: false

      onLoad: ->

      beforeOpen: ->

      beforeClose: ->

    options = $.extend(defaults, options)
    $menuObj = this

    $menuObj.each (options) ->
      megaOver = ->
        subNav = $(".sub", this)
        $(this).addClass "selected"
        $(subNav).fadeIn defaults.speed  if defaults.effect is "fade"
        $(subNav).show defaults.speed  if defaults.effect is "slide"
        defaults.beforeOpen.call this

      megaAction = (obj) ->
        subNav = $(".sub", obj)
        $(obj).addClass "selected"
        $(subNav).fadeIn defaults.speed  if defaults.effect is "fade"
        $(subNav).show defaults.speed  if defaults.effect is "slide"
        defaults.beforeOpen.call this

      megaOut = ->
        subNav = $(".sub", this)
        $(this).removeClass "selected"
        $(subNav).hide()
        defaults.beforeClose.call this

      megaActionClose = (obj) ->
        subNav = $(".sub", obj)
        $(obj).removeClass "selected"
        $(subNav).hide()
        defaults.beforeClose.call this

      megaReset = ->
        $("li", $menuObj).removeClass "selected"
        $(".sub", $menuObj).hide()

      megaSetup = ->
        # $arrow = ""
        $arrow = "<span class=\"mbar-icon\"></span>" #if mbarIcon
        clParentLi = clParent + "-li"
        menuWidth = $menuObj.outerWidth()

				# For each menubar item
        $("> li", $menuObj).each ->
					# The item's submenu list
          $mainSub = $("> ul", this)
          $primaryLink = $("> a", this)

					# It has items
          if $mainSub.length
            $primaryLink.addClass(clParent).append $arrow

						# Add 'sub' class and wrap the whole thing in a div
            $mainSub.addClass("sub").wrap "<div class=\"" + clContainer + "\" />"
	
            pos = $(this).position()
            pl = pos.left

            if $("ul", $mainSub).length
              $(this).addClass clParentLi
              $("." + clContainer, this).addClass "mega"
              $("> li", $mainSub).each ->
                unless $(this).hasClass(clWidget)
                  $(this).addClass "mega-unit"
                  if $("> ul", this).length
                    $(this).addClass clSubParent
                    $("> a", this).addClass clSubParent + "-a"
                  else
                    $(this).addClass clSubLink
                    $("> a", this).addClass clSubLink + "-a"

              hdrs = $(".mega-unit", this)
              rowSize = parseInt(defaults.rowItems)
              i = 0

              while i < hdrs.length
                hdrs.slice(i, i + rowSize).wrapAll "<div class=\"row\" />"
                i += rowSize
              $mainSub.show()

              pw = $(this).width()
              pr = pl + pw
              mr = menuWidth - pr
              subw = $mainSub.outerWidth()
              totw = $mainSub.parent("." + clContainer).outerWidth()
              cpad = totw - subw

              if defaults.fullWidth is true
                fw = menuWidth - cpad

                $mainSub.parent("." + clContainer).css width: fw + "px"
                $menuObj.addClass "full-width"

              iw = $(".mega-unit", $mainSub).outerWidth(true)
              rowItems = $(".row:eq(0) .mega-unit", $mainSub).length
              inneriw = iw * rowItems
              totiw = inneriw + cpad
              $(".row", this).each ->
                $(".mega-unit:last", this).addClass "last"
                maxValue = `undefined`
                $(".mega-unit > a", this).each ->
                  val = parseInt($(this).height())
                  maxValue = val  if maxValue is `undefined` or maxValue < val

                $(".mega-unit > a", this).css "height", maxValue + "px"
                $(this).css "width", inneriw + "px"

              if defaults.fullWidth is true
                params = left: 0
              else
                ml = (if mr < ml then ml + ml - mr else (totiw - pw) / 2)
                subLeft = pl - ml
                params =
                  left: pl + "px"
                  marginLeft: -ml + "px"

                if subLeft < 0
                  params = left: 0
                else params = right: 0  if mr < ml
              $("." + clContainer, this).css params
              $(".row", $mainSub).each ->
                rh = $(this).height()
                $(".mega-unit", this).css height: rh + "px"
                $(this).parent(".row").css height: rh + "px"

              $mainSub.hide()
            else
              $("." + clContainer, this).addClass("non-mega").css "left", pl + "px"
              $mainSub.hide()
			      
        menuHeight = $("> li > a", $menuObj).outerHeight(true)
        $("." + clContainer, $menuObj).css(top: menuHeight + "px").css "z-index", "1000"
        if defaults.event is "hover"
          config =
            sensitivity: 2
            interval: 100
            over: megaOver
            timeout: 400
            out: megaOut

          $("li", $menuObj).hoverIntent config

        if defaults.event is "click"
          $("body").mouseup (e) ->
            megaReset() unless $(e.target).parents(".selected").length

          $("> li > a." + clParent, $menuObj).click (e) ->
            $parentLi = $(this).parent()
            if $parentLi.hasClass("selected")
              megaActionClose $parentLi
            else
              megaAction $parentLi
            e.preventDefault()

        defaults.onLoad.call this

      clSubParent = defaults.classSubParent
      clSubLink = defaults.classSubLink
      clParent = defaults.classParent
      clContainer = defaults.classContainer
      clWidget = defaults.classWidget
      megaSetup()
) jQuery