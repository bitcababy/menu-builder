(function() {

  $(document).ready(function($) {
    $("#hmenu-1").dcMegaMenu({
      rowItems: "3",
      speed: 0,
      effect: "slide",
      event: "click",
      fullWidth: true
    });
    $("#hmenu-2").dcMegaMenu({
      rowItems: "1",
      speed: "fast",
      effect: "fade",
      event: "click"
    });
    $("#hmenu-3").dcMegaMenu({
      rowItems: "2",
      speed: "fast",
      effect: "fade"
    });
    $("#hmenu-4").dcMegaMenu({
      rowItems: "3",
      speed: "fast",
      effect: "fade"
    });
    $("#hmenu-5").dcMegaMenu({
      rowItems: "4",
      speed: "fast",
      effect: "fade"
    });
    $("#hmenu-6").dcMegaMenu({
      rowItems: "3",
      speed: "slow",
      effect: "slide",
      event: "click",
      fullWidth: true
    });
    $("#hmenu-7").dcMegaMenu({
      rowItems: "3",
      speed: "fast",
      effect: "slide"
    });
    $("#hmenu-8").dcMegaMenu({
      rowItems: "3",
      speed: "fast",
      effect: "fade"
    });
    return $("#hmenu-9").dcMegaMenu({
      rowItems: "3",
      speed: "fast",
      effect: "fade"
    });
  });

}).call(this);
