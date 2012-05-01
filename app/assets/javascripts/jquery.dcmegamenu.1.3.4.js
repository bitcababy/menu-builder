(function() {

  (function($) {
    return $.fn.dcMegaMenu = function(options) {
      var $dcMegaMenuObj, defaults;
      defaults = {
        classParent: "dc-mega",
        classContainer: "sub-container",
        classSubParent: "mega-hdr",
        classSubLink: "mega-hdr",
        classWidget: "dc-extra",
        rowItems: 3,
        speed: "fast",
        effect: "fade",
        event: "hover",
        fullWidth: false,
        onLoad: function() {},
        beforeOpen: function() {},
        beforeClose: function() {}
      };
      options = $.extend(defaults, options);
      $dcMegaMenuObj = this;
      return $dcMegaMenuObj.each(function(options) {
        var clContainer, clParent, clSubLink, clSubParent, clWidget, megaAction, megaActionClose, megaOut, megaOver, megaReset, megaSetup;
        megaOver = function() {
          var subNav;
          subNav = $(".sub", this);
          $(this).addClass("mega-hover");
          if (defaults.effect === "fade") {
            $(subNav).fadeIn(defaults.speed);
          }
          if (defaults.effect === "slide") {
            $(subNav).show(defaults.speed);
          }
          return defaults.beforeOpen.call(this);
        };
        megaAction = function(obj) {
          var subNav;
          subNav = $(".sub", obj);
          $(obj).addClass("mega-hover");
          if (defaults.effect === "fade") {
            $(subNav).fadeIn(defaults.speed);
          }
          if (defaults.effect === "slide") {
            $(subNav).show(defaults.speed);
          }
          return defaults.beforeOpen.call(this);
        };
        megaOut = function() {
          var subNav;
          subNav = $(".sub", this);
          $(this).removeClass("mega-hover");
          $(subNav).hide();
          return defaults.beforeClose.call(this);
        };
        megaActionClose = function(obj) {
          var subNav;
          subNav = $(".sub", obj);
          $(obj).removeClass("mega-hover");
          $(subNav).hide();
          return defaults.beforeClose.call(this);
        };
        megaReset = function() {
          $("li", $dcMegaMenuObj).removeClass("mega-hover");
          return $(".sub", $dcMegaMenuObj).hide();
        };
        megaSetup = function() {
          var $arrow, clParentLi, config, menuHeight, menuWidth;
          $arrow = "<span class=\"dc-mega-icon\"></span>";
          clParentLi = clParent + "-li";
          menuWidth = $dcMegaMenuObj.outerWidth();
          $("> li", $dcMegaMenuObj).each(function() {
            var $mainSub, $primaryLink, cpad, fw, hdrs, i, inneriw, iw, ml, mr, params, pl, pos, pr, pw, rowItems, rowSize, subLeft, subw, totiw, totw;
            $mainSub = $("> ul", this);
            $primaryLink = $("> a", this);
            if ($mainSub.length) {
              $primaryLink.addClass(clParent).append($arrow);
              $mainSub.addClass("sub").wrap("<div class=\"" + clContainer + "\" />");
              pos = $(this).position();
              pl = pos.left;
              if ($("ul", $mainSub).length) {
                $(this).addClass(clParentLi);
                $("." + clContainer, this).addClass("mega");
                $("> li", $mainSub).each(function() {
                  if (!$(this).hasClass(clWidget)) {
                    $(this).addClass("mega-unit");
                    if ($("> ul", this).length) {
                      $(this).addClass(clSubParent);
                      return $("> a", this).addClass(clSubParent + "-a");
                    } else {
                      $(this).addClass(clSubLink);
                      return $("> a", this).addClass(clSubLink + "-a");
                    }
                  }
                });
                hdrs = $(".mega-unit", this);
                rowSize = parseInt(defaults.rowItems);
                i = 0;
                while (i < hdrs.length) {
                  hdrs.slice(i, i + rowSize).wrapAll("<div class=\"row\" />");
                  i += rowSize;
                }
                $mainSub.show();
                pw = $(this).width();
                pr = pl + pw;
                mr = menuWidth - pr;
                subw = $mainSub.outerWidth();
                totw = $mainSub.parent("." + clContainer).outerWidth();
                cpad = totw - subw;
                if (defaults.fullWidth === true) {
                  fw = menuWidth - cpad;
                  $mainSub.parent("." + clContainer).css({
                    width: fw + "px"
                  });
                  $dcMegaMenuObj.addClass("full-width");
                }
                iw = $(".mega-unit", $mainSub).outerWidth(true);
                rowItems = $(".row:eq(0) .mega-unit", $mainSub).length;
                inneriw = iw * rowItems;
                totiw = inneriw + cpad;
                $(".row", this).each(function() {
                  var maxValue;
                  $(".mega-unit:last", this).addClass("last");
                  maxValue = undefined;
                  $(".mega-unit > a", this).each(function() {
                    var val;
                    val = parseInt($(this).height());
                    if (maxValue === undefined || maxValue < val) {
                      return maxValue = val;
                    }
                  });
                  $(".mega-unit > a", this).css("height", maxValue + "px");
                  return $(this).css("width", inneriw + "px");
                });
                if (defaults.fullWidth === true) {
                  params = {
                    left: 0
                  };
                } else {
                  ml = (mr < ml ? ml + ml - mr : (totiw - pw) / 2);
                  subLeft = pl - ml;
                  params = {
                    left: pl + "px",
                    marginLeft: -ml + "px"
                  };
                  if (subLeft < 0) {
                    params = {
                      left: 0
                    };
                  } else {
                    if (mr < ml) {
                      params = {
                        right: 0
                      };
                    }
                  }
                }
                $("." + clContainer, this).css(params);
                $(".row", $mainSub).each(function() {
                  var rh;
                  rh = $(this).height();
                  $(".mega-unit", this).css({
                    height: rh + "px"
                  });
                  return $(this).parent(".row").css({
                    height: rh + "px"
                  });
                });
                return $mainSub.hide();
              } else {
                return $("." + clContainer, this).addClass("non-mega").css("left", pl + "px");
              }
            }
          });
          menuHeight = $("> li > a", $dcMegaMenuObj).outerHeight(true);
          $("." + clContainer, $dcMegaMenuObj).css({
            top: menuHeight + "px"
          }).css("z-index", "1000");
          if (defaults.event === "hover") {
            config = {
              sensitivity: 2,
              interval: 100,
              over: megaOver,
              timeout: 400,
              out: megaOut
            };
            $("li", $dcMegaMenuObj).hoverIntent(config);
          }
          if (defaults.event === "click") {
            $("body").mouseup(function(e) {
              if (!$(e.target).parents(".mega-hover").length) {
                return megaReset();
              }
            });
            $("> li > a." + clParent, $dcMegaMenuObj).click(function(e) {
              var $parentLi;
              $parentLi = $(this).parent();
              if ($parentLi.hasClass("mega-hover")) {
                megaActionClose($parentLi);
              } else {
                megaAction($parentLi);
              }
              return e.preventDefault();
            });
          }
          return defaults.onLoad.call(this);
        };
        clSubParent = defaults.classSubParent;
        clSubLink = defaults.classSubLink;
        clParent = defaults.classParent;
        clContainer = defaults.classContainer;
        clWidget = defaults.classWidget;
        return megaSetup();
      });
    };
  })(jQuery);

}).call(this);
