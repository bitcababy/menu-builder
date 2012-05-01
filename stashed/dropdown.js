(function() {

  $(document).ready(function($) {
    $("#mega-menu-1").dcMegaMenu({
      rowItems: "3",
      speed: 0,
      effect: "slide",
      event: "click",
      fullWidth: true
    });
    $("#mega-menu-2").dcMegaMenu({
      rowItems: "1",
      speed: "fast",
      effect: "fade",
      event: "click"
    });
    $("#mega-menu-3").dcMegaMenu({
      rowItems: "2",
      speed: "fast",
      effect: "fade"
    });
    $("#mega-menu-4").dcMegaMenu({
      rowItems: "3",
      speed: "fast",
      effect: "fade"
    });
    $("#mega-menu-5").dcMegaMenu({
      rowItems: "4",
      speed: "fast",
      effect: "fade"
    });
    $("#mega-menu-6").dcMegaMenu({
      rowItems: "3",
      speed: "slow",
      effect: "slide",
      event: "click",
      fullWidth: true
    });
    $("#mega-menu-7").dcMegaMenu({
      rowItems: "3",
      speed: "fast",
      effect: "slide"
    });
    $("#mega-menu-8").dcMegaMenu({
      rowItems: "3",
      speed: "fast",
      effect: "fade"
    });
    return $("#mega-menu-9").dcMegaMenu({
      rowItems: "3",
      speed: "fast",
      effect: "fade"
    });
  });

}).call(this);
