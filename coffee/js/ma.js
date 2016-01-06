(function() {
  var MA;

  MA = (function() {
    var grid, gridItem, isotopeSetup, mainMenu, menuToggle, menuTrigger, searchForm, searchToggle, searchTrigger;

    function MA() {}

    searchForm = $('#search-form');

    searchTrigger = $('.search-trigger');

    menuTrigger = $('.menu-trigger');

    mainMenu = $('.main-menu');

    grid = $('.bricks-container');

    gridItem = '.brick';

    searchToggle = function(trigger, target) {
      return trigger.click(function() {
        return target.css('opacity', function(i, opacity) {
          if (opacity > 0) {
            return 0;
          } else {
            return 1;
          }
        });
      });
    };

    menuToggle = function(trigger, target) {
      return trigger.click(function() {
        var mainMenuState, targetHeight;
        mainMenuState = target.parent().data('state');
        if (mainMenuState === 'collapsed') {
          target.show().parent().data('state', 'extended').addClass('extended').css('height', '100vh');
          targetHeight = $(window).height() - target.offset().top - 24;
          trigger.text('x');
          $('body').css('position', 'fixed');
          return target.css('height', targetHeight).perfectScrollbar({
            suppressScorllX: true
          });
        } else {
          target.parent().data('state', 'collapsed');
          target.hide().parent().removeClass('extended').css('height', 'auto');
          trigger.text('m');
          return $('body').css('position', 'static');
        }
      });
    };

    isotopeSetup = function(target, item) {
      return $(window).load(function() {
        return grid.isotope({
          itemSelector: item,
          masonry: {
            gutter: 15
          }
        });
      });
    };

    MA.prototype.init = function() {
      searchToggle(searchTrigger, searchForm);
      menuToggle(menuTrigger, mainMenu);
      isotopeSetup(grid, gridItem);
      return console.log('MA initiated.');
    };

    return MA;

  })();

  window.MA = new MA();

  $(function() {
    console.log('DOM is ready!');
    return window.MA.init();
  });

}).call(this);
