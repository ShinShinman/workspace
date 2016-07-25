(function() {
  var MA, getHashFilter;

  MA = (function() {
    var apiTest, closeMenu, grid, gridItem, isScrolledIntoView, isotopeSetup, mainMenu, menuToggle, menuTrigger, openMenu, searchForm, searchToggle, searchTrigger, setNavBackground, stickyNavSetup;

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
      mainMenuOpened: false,
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

    openMenu = function() {
      var target, targetHeight, trigger;
      target = MA.settings.mainMenu;
      trigger = MA.settings.menuTrigger;
      MA.settings.mainMenuOpened = true;
      target.show().parent().data('state', 'extended').addClass('extended').css('height', '100vh');
      stickyNavSetup({
        color: 'white',
        backgroundColor: 'black'
      });
      targetHeight = $(window).height() - 150;
      trigger.text('X');
      target.css('height', targetHeight).perfectScrollbar({
        suppressScorllX: true
      });
    };

    closeMenu = function() {
      var target, trigger;
      target = MA.settings.mainMenu;
      trigger = MA.settings.menuTrigger;
      MA.settings.mainMenuOpened = false;
      target.parent().data('state', 'collapsed');
      target.hide().parent().removeClass('extended').css('height', 'auto');
      stickyNavSetup({
        color: 'black',
        backgroundColor: 'transparent'
      });
      trigger.text('G');
    };

    menuToggle = function(trigger, target) {
      return trigger.click(function() {
        var mainMenuState;
        mainMenuState = target.parent().data('state');
        if (mainMenuState === 'collapsed') {
          return openMenu();
        } else {
          return closeMenu();
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

    setNavBackground = function(offsetElement) {
      var dirCount, direction, offset;
      offset = $(offsetElement).height() - 125;
      dirCount = [0, 0];
      direction = '';
      $(window).scroll(function() {
        dirCount.pop();
        dirCount.push($(window).scrollTop());
        dirCount.reverse();
        direction = dirCount[0] > dirCount[1] ? 'down' : 'up';
        if ($(window).scrollTop() < offset && !MA.settings.mainMenuOpened) {
          stickyNavSetup({
            backgroundColor: 'transparent'
          });
        }
        if ($(window).scrollTop() >= offset && !MA.settings.mainMenuOpened) {
          return stickyNavSetup({
            backgroundColor: 'white'
          });
        }
      });
    };

    MA.prototype.setupHighlight = function() {
      var items;
      MA.settings.highlightOn = true;
      items = $('.owl-carousel .item').length;
      $('.owl-carousel').owlCarousel({
        loop: items > 1,
        items: 1,
        dots: true,
        smartSpeed: 1000,
        autoplay: true,
        autoplayTimeout: 7000,
        smartSpeed: 800
      });
      stickyNavSetup({
        backgroundColor: 'transparent'
      });
      $('.slide-down a').click(function() {
        var hlHeight;
        hlHeight = $('.owl-carousel').height() - 125;
        console.log('Click!');
        return $('html, body').animate({
          scrollTop: hlHeight
        }, 800);
      });
      setNavBackground('.owl-carousel');

      /*
      		hlHeight = $('.owl-carousel').height()
      		MA.settings.highlightVisible = true
      		dirCount = [0, 0]
      		direction = ''
      
      		$(window).scroll ->
      			dirCount.pop()
      			dirCount.push($(window).scrollTop())
      			dirCount.reverse()
      			direction = if dirCount[0] > dirCount[1] then 'down' else 'up'
      			console.log direction
      
      			 * Highligt in!
      			if $(window).scrollTop() < hlHeight and not MA.settings.highlightVisible
      				MA.settings.highlightVisible = true
      				stickyNavSetup({
      					backgroundColor: 'transparent'
      					})
      				console.log 'Highligt in!'
      
      			 * Highligt out!
      			if $(window).scrollTop() >= hlHeight and MA.settings.highlightVisible
      				MA.settings.highlightVisible = false
      				stickyNavSetup({
      					backgroundColor: 'white'
      					})
      				console.log 'Highligt out!'
       */
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

    apiTest = function() {
      return console.log('Public API available!');
    };

    MA.prototype.api = {
      apiTest: apiTest,
      openMenu: openMenu,
      closeMenu: closeMenu,
      setNavBackground: setNavBackground
    };

    MA.prototype.init = function() {
      searchToggle(searchTrigger, searchForm);
      menuToggle(menuTrigger, mainMenu);
      isotopeSetup(grid, gridItem);
      Hyphenator.config({
        orphancontrol: 2,
        defaultlanguage: 'pl',
        minwordlength: 8
      });
      Hyphenator.run();
      return console.log('MA initiated.');
    };

    return MA;

  })();

  window.MA = new MA();

  getHashFilter = function() {
    var hash, hashFilter, matches;
    hash = location.hash;
    matches = location.hash.match(/filter=([^&]+)/i);
    hashFilter = matches && matches[1];
    return hashFilter && decodeURIComponent(hashFilter);
  };

  $(function() {
    var clear, filterTriggers, filters, onHashchange, showAll, wBtn, wMore;
    console.log('DOM is ready!');
    window.MA.init();
    filters = $('.filters li');
    filterTriggers = $('.filters li a:not(.clear-filter)');
    clear = $('.filters li a.clear-filter');
    showAll = $('.filters li.show-all');
    clear.click(function(e) {
      e.preventDefault();
      filters.removeClass('inactive-filter');
      $(this).hide();
      history.pushState('', document.title, window.location.pathname);
      return $('.bricks-container').isotope({
        filter: '*'
      });
    });
    showAll.click(function(e) {
      e.preventDefault();
      filters.removeClass('inactive-filter');
      history.pushState('', document.title, window.location.pathname);
      return $('.bricks-container').isotope({
        filter: '*'
      });
    });
    filterTriggers.click(function(e) {
      e.preventDefault();
      filters.addClass('inactive-filter');
      $(this).parent().removeClass('inactive-filter');
      filters.find('.clear-filter').hide();
      $(this).parent().find('.clear-filter').show();
      return location.hash = 'filter=' + encodeURIComponent($(this).data('filter'));

      /*
      		$('.bricks-container').isotope({
      				filter: '.' + $(@).data('filter')
      			})
       */
    });
    onHashchange = function() {
      var hashFilter;
      hashFilter = getHashFilter();
      if (!hashFilter) {
        return;
      }
      filters.addClass('inactive-filter');
      filters.parent().find('.' + hashFilter).removeClass('inactive-filter').find('.clear-filter').show();
      return $('.bricks-container').isotope({
        filter: '.' + hashFilter
      });
    };
    $(window).on('hashchange', onHashchange);
    onHashchange();
    wBtn = $('.kids-n-parents a.workshop');
    wMore = $('.kids-n-parents .more');
    return wBtn.click(function(e) {
      e.preventDefault();
      return wMore.slideToggle();
    });
  });


  /*
  $( function() {
  
    var $container = $('.isotope');
  
    // bind filter button click
    var $filters = $('#filters').on( 'click', 'button', function() {
      var filterAttr = $( this ).attr('data-filter');
      // set filter in hash
      location.hash = 'filter=' + encodeURIComponent( filterAttr );
    });
  
    var isIsotopeInit = false;
  
    function onHashchange() {
      var hashFilter = getHashFilter();
      if ( !hashFilter && isIsotopeInit ) {
        return;
      }
      isIsotopeInit = true;
      // filter isotope
      $container.isotope({
        itemSelector: '.element-item',
        filter: hashFilter
      });
      // set selected class on button
      if ( hashFilter ) {
        $filters.find('.is-checked').removeClass('is-checked');
        $filters.find('[data-filter="' + hashFilter + '"]').addClass('is-checked');
      }
    }
  
    $(window).on( 'hashchange', onHashchange );
    // trigger event handler to init Isotope
    onHashchange();
  });
   */

}).call(this);
