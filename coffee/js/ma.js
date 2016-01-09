(function() {
  var MA;

  MA = (function() {
    var grid, gridItem, isScrolledIntoView, isotopeSetup, mainMenu, menuToggle, menuTrigger, searchForm, searchToggle, searchTrigger, setNavBackground, stickyNavSetup;

    function MA() {}

    searchForm = $('#search-form');

    searchTrigger = $('.search-trigger');

    menuTrigger = $('.menu-trigger');

    mainMenu = $('.main-menu');

    grid = $('.bricks-container');

    gridItem = '.brick';

    MA.settings = {
      stickyNav: $('.sticky-nav'),
      searchForm: $('#search-form'),
      searchTrigger: $('.search-trigger'),
      menuTrigger: $('.menu-trigger'),
      mainMenu: $('.main-menu'),
      grid: $('.bricks-container'),
      gridItem: '.brick',
      highlightOn: false,
      highlightVisible: false
    };

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
          stickyNavSetup({
            color: 'white',
            backgroundColor: 'black'
          });
          targetHeight = $(window).height() - target.offset().top - 24;
          trigger.text('X');
          return target.css('height', targetHeight).perfectScrollbar({
            suppressScorllX: true
          });
        } else {
          target.parent().data('state', 'collapsed');
          target.hide().parent().removeClass('extended').css('height', 'auto');
          stickyNavSetup({
            color: 'black',
            backgroundColor: MA.settings.highlightVisible ? 'transparent' : 'white'
          });
          trigger.text('G');
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

    setNavBackground = function(action, highlightOn) {
      var backgroundColor;
      if (action === 'expanded') {
        backgroundColor = 'black';
      }
      if (action === 'collapsed' && !highlightOn) {
        backgroundColor = 'white';
      }
      if (action === 'collapsed' && highlightOn) {
        backgroundColor = 'transparent';
      }
      return MA.settings.stickyNav.css('background-color', backgroundColor);
    };

    stickyNavSetup = function(options) {
      var settings;
      settings = $.extend({
        color: 'black',
        backgroundColor: 'white'
      }, options);
      return MA.settings.stickyNav.css({
        'color': settings.color,
        'backgroundColor': settings.backgroundColor
      });
    };

    MA.prototype.setupHighlight = function() {
      var dirCount, direction, hlHeight;
      MA.settings.highlightOn = true;
      $('.highlight').owlCarousel({
        loop: true,
        items: 1,
        dots: true,
        smartSpeed: 1000,
        autoplay: true,
        autoplayTimeout: 7000
      });
      stickyNavSetup({
        backgroundColor: 'transparent'
      });
      hlHeight = $('.highlight').height();
      MA.settings.highlightVisible = true;
      dirCount = [0, 0];
      direction = '';
      $(window).scroll(function() {
        dirCount.pop();
        dirCount.push($(window).scrollTop());
        dirCount.reverse();
        direction = dirCount[0] > dirCount[1] ? 'down' : 'up';
        console.log($(window).scrollTop() < hlHeight);

        /*
        			if MA.settings.highlightVisible and direction == 'down'
        				console.log 'act'
        				MA.settings.highlightVisible = false
        				$('html, body').animate({
        					scrollTop: hlHeight
        				})
        
        			if not MA.settings.highlightVisible and direction == 'down'
        				MA.settings.highlightVisible = true
        				$('html, body').animate({
        					scrollTop: 0
        				})
         */
        if ($(window).scrollTop() < hlHeight && !MA.settings.highlightVisible) {
          MA.settings.highlightVisible = true;
          stickyNavSetup({
            backgroundColor: 'transparent'
          });
          console.log('Highligt in!');
        }
        if ($(window).scrollTop() >= hlHeight && MA.settings.highlightVisible) {
          MA.settings.highlightVisible = false;
          stickyNavSetup({
            backgroundColor: 'white'
          });
          return console.log('Highligt out!');
        }
      });
    };

    isScrolledIntoView = function(elem) {
      var $elem, $window, docViewBottom, docViewTop, elemBottom, elemTop;
      $elem = $(elem);
      $window = $(window);
      docViewTop = $window.scrollTop();
      docViewBottom = docViewTop + $window.height();
      elemTop = $elem.offset().top;
      elemBottom = elemTop + $elem.height();
      return (elemBottom <= docViewBottom) && (elemTop >= docViewTop);
    };

    MA.prototype.stickyNavSetup = function(options) {
      var settings;
      settings = $.extend({
        color: 'black',
        backgroundColor: 'white'
      }, options);
      return MA.settings.stickyNav.css({
        'color': settings.color,
        'backgroundColor': settings.backgroundColor
      });
    };

    MA.prototype.init = function() {
      searchToggle(searchTrigger, searchForm);
      menuToggle(menuTrigger, mainMenu);
      isotopeSetup(grid, gridItem);
      Hyphenator.config({
        orphancontrol: 2
      });
      Hyphenator.run();
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
