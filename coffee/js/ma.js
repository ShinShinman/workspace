(function() {
  var MA;

  MA = (function() {
    var apiTest, baseURL, closeMenu, currentSuggest, directusURL, env, grid, gridItem, isScrolledIntoView, isotopeSetup, listSuggest, loadLazyImages, mainMenu, menuToggle, menuTrigger, numFound, openMenu, pagination, polishPlural, printSuggestions, removePL, rows, searchForm, searchToggle, searchTrigger, setNavBackground, start, stickyNavSetup, suggest, suggesterURL, template, tunelSOLR, ziomy;

    class MA {
      setupHighlight() {
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
        // autoplayHoverPause: true
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
      }

      stickyNavSetup(options) {
        var settings;
        settings = $.extend({
          //defaults
          color: 'black',
          backgroundColor: 'white'
        }, options);
        return MA.settings.stickyNav.css({
          'color': settings.color,
          'backgroundColor': settings.backgroundColor
        });
      }

      iS(options) {
        var clear, filterIsotope, filterTriggers, filters, getHashFilter, onHashchange, qSOn, settings, showAll, updateLegend;
        settings = $.extend({
          //defaults
          grid: MA.settings.grid,
          item: MA.settings.gridItem,
          slider: false,
          sliderItem: $('.slider'),
          sliderRange: [1965, 2016],
          quickSearch: false,
          quickSearchField: $('.filters .search input[type = search]')
        }, options);
        settings.grid.isotope({
          itemSelector: settings.gridItem,
          masonry: {
            gutter: 15
          }
        });
        //filtrowanie przyciskami
        getHashFilter = function() {
          var hash, hashFilter, matches;
          hash = location.hash;
          // get filter=filterName
          matches = location.hash.match(/filter=([^&]+)/i);
          hashFilter = matches && matches[1];
          return hashFilter && decodeURIComponent(hashFilter);
        };
        filters = $('.filters li');
        filterTriggers = $('.filters li a:not(.clear-filter)');
        clear = $('.filters li a.clear-filter');
        showAll = $('.filters li.show-all');
        clear.click(function(e) {
          e.preventDefault();
          filters.removeClass('inactive-filter');
          $(this).hide();
          history.pushState('', document.title, window.location.pathname);
          return settings.grid.isotope({
            filter: '*'
          });
        });
        showAll.click(function(e) {
          e.preventDefault();
          filters.removeClass('inactive-filter');
          history.pushState('', document.title, window.location.pathname);
          settings.grid.isotope({
            filter: '*'
          });
          if (settings.slider) {
            settings.sliderItem.slider('values', [settings.sliderRange[0], settings.sliderRange[1]]);
            return updateLegend(settings.sliderRange[0], settings.sliderRange[1]);
          }
        });
        filterTriggers.click(function(e) {
          e.preventDefault();
          filters.addClass('inactive-filter');
          $(this).parent().removeClass('inactive-filter');
          filters.find('.clear-filter').hide();
          $(this).parent().find('.clear-filter').show();
          return location.hash = 'filter=' + encodeURIComponent($(this).data('filter'));
        });
        onHashchange = function() {
          var hashFilter;
          hashFilter = getHashFilter();
          if (!hashFilter) {
            return;
          }
          // filter isotope
          filters.addClass('inactive-filter');
          filters.parent().find('.' + hashFilter).removeClass('inactive-filter').find('.clear-filter').show();
          return settings.grid.isotope({
            filter: '.' + hashFilter
          });
        };
        $(window).on('hashchange', onHashchange);
        // trigger event handler to init Isotope
        onHashchange();
        //filtrowanie sliderem
        updateLegend = function(sYear, eYear) {
          return $('.legend span').text(' ' + sYear + '–' + eYear);
        };
        filterIsotope = function(sYear, eYear) {
          var value;
          settings.quickSearchField.val('');
          value = $('.brick').filter(function(index) {
            var $this, matcharr, year;
            $this = $(this);
            matcharr = $this.attr('class').match(/brick\s([0-9]*)/);
            if (matcharr) {
              year = parseInt(matcharr[1]);
              if (year >= sYear && year <= eYear) {
                return true;
              } else {
                return false;
              }
            } else {
              return false;
            }
          });
          return settings.grid.isotope({
            filter: value
          });
        };
        if (settings.slider) {
          $('.slider').slider({
            range: true,
            min: settings.sliderRange[0],
            max: settings.sliderRange[1],
            values: [settings.sliderRange[0], settings.sliderRange[1]],
            stop: function(e, ui) {
              filterIsotope(ui.values[0], ui.values[1]);
              return updateLegend(ui.values[0], ui.values[1]);
            }
          }).slider('pips', {
            step: 5
          }).slider('float');
          updateLegend($('.slider').slider('values', 0), $('.slider').slider('values', 1));
        }
        //filtrowanie przez QuickSearch
        qSOn = function() { //QuickSearhOn
          var clearBtn, debounce, form, qsRegex;
          // QuickSearch
          form = $('.filters .search form');
          clearBtn = $('.filters .search input[type = reset]');
          qsRegex = void 0;
          debounce = function(fn, threshold) {
            var debounced, timeout, treshold;
            timeout = void 0;
            treshold = treshold | 100;
            return debounced = function() {
              var _this, args, delayed;
              clearTimeout(timeout);
              args = arguments;
              _this = this;
              delayed = function() {
                fn.apply(_this, args);
              };
              timeout = setTimeout(delayed, threshold);
            };
          };
          return settings.quickSearchField.keyup(debounce(function() {
            var qsRegExp, searchStr, tmp;
            tmp = settings.quickSearchField.val().split(' ');
            $.each(tmp, function(i, v) {
              return tmp[i] = '(?=.*' + v + ')';
            });
            searchStr = tmp.join('');
            qsRegExp = new RegExp(searchStr + '.*', 'gi');
            return settings.grid.isotope({
              filter: function() {
                return $(this).text().match(qsRegExp);
              }
            });
          }, 200));
        };
        if (settings.quickSearch) {
          qSOn();
          $('.filters .search form').on('reset', function(e) {
            setTimeout(function() {
              settings.grid.isotope({
                filter: '*'
              });
              if (settings.slider) {
                settings.sliderItem.slider('values', [settings.sliderRange[0], settings.sliderRange[1]]);
                updateLegend(settings.sliderRange[0], settings.sliderRange[1]);
              }
            });
          });
          settings.quickSearchField.focus(function() {
            settings.sliderItem.slider('values', [settings.sliderRange[0], settings.sliderRange[1]]);
            return updateLegend(settings.sliderRange[0], settings.sliderRange[1]);
          });
          console.log('Quick Search is on');
        }
      }

      iSl(options) { //ta metoda nie jest uzywana, przeniosłem ją do MA.iS(), do usunięcia
        var filterIsotope, settings, updateLegend;
        settings = $.extend({
          //defaults
          grid: MA.settings.grid,
          slider: $('.slider'),
          sliderRange: [1965, 2016]
        }, options);
        updateLegend = function(sYear, eYear) {
          return $('.legend span').text(' ' + sYear + '–' + eYear);
        };
        filterIsotope = function(sYear, eYear) {
          var value;
          value = $('.brick').filter(function(index) {
            var $this, matcharr, year;
            $this = $(this);
            matcharr = $this.attr('class').match(/brick\s([0-9]*)/);
            if (matcharr) {
              year = parseInt(matcharr[1]);
              if (year >= sYear && year <= eYear) {
                return true;
              } else {
                return false;
              }
            } else {
              return false;
            }
          });
          return $('.bricks-container').isotope({
            filter: value
          });
        };
        return $.getScript('../../../workspace/js/jquery-ui.min.js', function() {
          return $.getScript('../../../workspace/js/jquery-ui-slider-pips.min.js', function() {
            $('.slider').slider({
              range: true,
              min: settings.sliderRange[0],
              max: settings.sliderRange[1],
              values: [settings.sliderRange[0], settings.sliderRange[1]],
              stop: function(e, ui) {
                filterIsotope(ui.values[0], ui.values[1]);
                return updateLegend(ui.values[0], ui.values[1]);
              }
            }).slider('pips', {
              step: 5
            }).slider('float');
            return updateLegend($('.slider').slider('values', 0), $('.slider').slider('values', 1));
          });
        });
      }

      getCountryCode(lang, url) {
        var apiKey;
        apiKey = "7955c4b5554ea1387dad070d0ae194279a717795137ac2b3b1f884f4";
        $.ajax({
          url: `https://api.ipdata.co/country_code?api-key=${apiKey}`,
          type: 'GET',
          dataType: 'text',
          error: function(jqXHR, textStatus, errorThrown) {
            return console.log(`AJAX Error: ${textStatus}`);
          },
          success: function(data, textStatus, jqXHR) {
            //console.log "Successful AJAX call: #{data}"
            if (data !== 'PL' && lang !== 'en') {
              return window.location.replace(`${url}`);
            }
          }
        });
      }

      getCurrentLimit() {
        var apiKey;
        apiKey = "7955c4b5554ea1387dad070d0ae194279a717795137ac2b3b1f884f4";
        $.ajax({
          url: `https://api.ipdata.co/count?api-key=${apiKey}`,
          type: "GET",
          dataType: "text",
          error: function(jqXHR, textStatus, errorThrown) {
            return console.log(`AJAX Error: ${textStatus}`);
          },
          success: function(data, textStatus, jqXHR) {
            return console.log(`Dziś użyto usługi ${data} razy. Dziś możesz z niej skorzystać jeszcze ${1500 - data} razy.`);
          }
        });
      }

      // askSOLR – dodaje do kontenera Isotope nowe kafle
      askSOLR(q, start = 0) {
        var lastPage, loader, url;
        loader = $('div.load7');
        if (q === '') {
          return;
        }
        url = `${tunelSOLR[env]}?link=ma_collection/select&q=${q}&start=${start}&rows=${rows}`;
        lastPage = '';
        loader.show();
        // start += rows
        fetch(url).then(async function(response) {
          var resJSON;
          resJSON = (await response.json());
          numFound = resJSON.response.numFound;
          lastPage = Math.ceil(numFound / rows);
          $('p.results-found .number').text(`Znaleziono ${polishPlural(numFound)}`).removeClass('loading');
          pagination(start, lastPage, q);
          return resJSON.response.docs.forEach(async function(doc, i) {
            return MA.settings.grid.isotope('insert', (await template(doc)));
          });
        }).then(function() {
          loader.hide();
          $('div.pagination').show();
          loadLazyImages('img.lazy');
          //  scroluje do pozycji zapisanej przy opuszczaniu strony
          // patrz JS w collection_search.xsl
          if (parseInt(sessionStorage.getItem('startIndex')) === start) {
            return window.scroll({
              top: sessionStorage.getItem('scrollPosition'),
              behavior: 'smooth'
            });
          }
        }).catch(function(error) {
          return console.error(error);
        });
      }

      sugg(trg) {
        return trg.keyup(function(e) {
          if (!$(this).val()) {
            MA.settings.suggester.hide();
            return;
          }
          switch (e.which) {
            case 38:
              if (currentSuggest !== -1) {
                listSuggest[currentSuggest].classList.remove('highlight');
              }
              if (currentSuggest > 0) {
                currentSuggest--;
              } else {
                currentSuggest = listSuggest.length - 1;
              }
              return listSuggest[currentSuggest].classList.add('highlight');
            case 40:
              if (currentSuggest !== -1) {
                listSuggest[currentSuggest].classList.remove('highlight');
              }
              if (currentSuggest < listSuggest.length - 1) {
                currentSuggest++;
              } else {
                currentSuggest = 0;
              }
              return listSuggest[currentSuggest].classList.add('highlight');
            case 13:
              return trg.val(listSuggest[currentSuggest].firstChild.textContent).submit();
            default:
              return suggest(encodeURIComponent($(this).val()));
          }
        });
      }

      // Initialize
      init() {
        searchToggle(searchTrigger, searchForm);
        menuToggle(menuTrigger, mainMenu);
        //isotopeSetup(grid, gridItem) # poprawić --> nie na wszystkich stronach
        Hyphenator.config({
          orphancontrol: 2,
          defaultlanguage: 'pl',
          minwordlength: 8
        });
        return Hyphenator.run();
      }

    };

    // Menu vars
    searchForm = $('#search-form');

    searchTrigger = $('.search-trigger');

    menuTrigger = $('.menu-trigger');

    mainMenu = $('.main-menu');

    // Isotope grid vars
    grid = $('.bricks-container');

    gridItem = '.brick';

    // Scope problems
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
      highlightVisible: false,
      currentLanguage: window.location.pathname.includes('/pl/') ? 'pl' : 'en',
      suggester: $('ul.suggester')
    };

    // Private methods
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
      // backgroundColor: if MA.settings.highlightVisible then 'transparent' else 'white'
      trigger.text('g');
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
        //defaults
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
        // Highligt in!
        if ($(window).scrollTop() < offset && !MA.settings.mainMenuOpened) {
          stickyNavSetup({
            backgroundColor: 'transparent'
          });
        }
        // Highligt out!
        if ($(window).scrollTop() >= offset && !MA.settings.mainMenuOpened) {
          return stickyNavSetup({
            backgroundColor: 'white'
          });
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

    /* COLLECTION SOLR */
    // Ustala środowisko: local albo live
    env = window.location.origin.includes('ma.wroc.pl') ? "live" : "local";

    // remove hanging single letters
    ziomy = function(string) {
      return string.replace(/\s\b(a|i|o|u|w|z|A|I|O|U|W|Z|we|ul\.)\b\s/gi, ' $1&nbsp;');
    };

    // usuwa polskie znaki
    removePL = function(string, map) {
      var currentMap, tempArray;
      currentMap = $.extend({
        ą: 'a',
        ć: 'c',
        ę: 'e',
        ł: 'l',
        ń: 'n',
        ó: 'o',
        ś: 's',
        ż: 'z',
        ź: 'z'
      }, map);
      tempArray = string.toLowerCase().split('');
      tempArray.forEach(function(el, i) {
        if (currentMap[el]) {
          return tempArray[i] = currentMap[el];
        }
      });
      return tempArray.join('');
    };

    //	templete kafelka Isotope

    // ustala adres strony /solr-search
    // użycie: baseURL[env]
    baseURL = {
      local: `${window.location.origin}/ma.wroc.pl`,
      live: `${window.location.origin}`
    };

    // ustala adres tunelu php (tunelSOLR[env])
    tunelSOLR = {
      local: `${baseURL[env]}/workspace/tS.local.php`,
      live: `${baseURL[env]}/workspace/tS.php`
    };

    //ustawienia kolejki pobierania
    start = 0;

    rows = 30;

    numFound = 0;

    directusURL = {
      local: 'http://127.0.0.1:4081',
      live: 'http://156.17.251.36:59190'
    };

    // loadImage = (src) ->
    // 	new Promise( (resolve, reject) ->
    // 		img = new Image()
    // 		img.onload = () -> resolve(img)
    // 		img.onerror = () -> reject
    // 		img.src = src
    // 	)

    // Ładuje w tel obrazki
    loadLazyImages = function(selector) {
      var elements;
      elements = document.querySelectorAll(selector);
      return elements.forEach(function(el) {
        var tempImg;
        tempImg = new Image();
        tempImg.onload = function() {
          return el.src = el.dataset.original;
        };
        return tempImg.src = el.dataset.original;
      });
    };

    template = function(ob) {
      var autorzy, datowanie, img, imgHeight, link, nazwa, nazwaObiektu, obrazID, ratio;
      nazwa = {
        pl: ob.nazwa_obiektu ? ziomy(ob.nazwa_obiektu) : '',
        en: ob.nazwa_obiektu_tlumaczenie ? ob.nazwa_obiektu_tlumaczenie : ''
      };
      nazwaObiektu = nazwa[MA.settings.currentLanguage];
      autorzy = ob.autorzy ? ob.autorzy.join(', ') : '';
      datowanie = ob.datowanie ? ob.datowanie : '';
      obrazID = ob.obraz_asset_url ? `${ob.obraz_asset_url[0]}?key=brick-thumbnail` : '';
      ratio = ob.obraz_width ? ob.obraz_width[0] / 320 : 0;
      imgHeight = ob.obraz_height ? Math.floor(ob.obraz_height[0] / ratio) : 0;
      link = {
        pl: `${baseURL[env]}/pl/kolekcja/obiekt/${ob.sygnatura_slug}/`,
        en: `${baseURL[env]}/en/collection/item/${ob.sygnatura_slug}/`
      };
      img = obrazID ? `<img\n	class="lazy"\n  width="320"\n  height="${imgHeight}"\n  src="${baseURL[env]}/workspace/images/blank.gif"\n	data-original = "http://ma.wroc.pl/workspace/t.php?link=${obrazID}"\n  alt="${autorzy}, ${nazwaObiektu}"\n/>` : "";
      return $(`<article class="brick">\n	<a href="${link[MA.settings.currentLanguage]}">\n		<h1 class="donthyphenate">${nazwaObiektu}</h1>\n		<h2 class="donthyphenate">${autorzy}</h2>\n    <p>${datowanie}</p>\n		${img}\n	</a>\n</article>`);
    };

    // odmina słowa obiekt
    polishPlural = function(value) {
      var pluralGenitive, pluralNominativ, singularNominativ;
      singularNominativ = 'obiekt';
      pluralNominativ = 'obiekty';
      pluralGenitive = 'obiektów';
      if (value === 1) {
        return `${value} ${singularNominativ}`;
      } else if (value % 10 >= 2 && value % 10 <= 4 && (value % 100 < 10 || value % 100 >= 20)) {
        return `${value} ${pluralNominativ}`;
      } else {
        return `${value} ${pluralGenitive}`;
      }
    };

    // pagination
    pagination = function(start, lastPage, q) {
      var i, j, newPage, pagMax, pagStart, page, paginationList, ref, ref1, url, xItems;
      q = q === '*' ? '' : q;
      paginationList = $('ul.pagination__list');
      page = start / rows + 1;
      pagStart = page - 3;
      pagMax = (page + 3) > lastPage ? lastPage : page + 3;
      url = window.location.origin + window.location.pathname;
      xItems = [];
      for (i = j = ref = pagStart, ref1 = pagMax; (ref <= ref1 ? j <= ref1 : j >= ref1); i = ref <= ref1 ? ++j : --j) {
        if (i < 1) {
          newPage = Math.abs(i) + pagMax + 1;
          if (newPage >= lastPage) {
            continue;
          }
          xItems.unshift(`<li><a href='${url}?q=${q}&start=${(newPage - 1) * 30}'>${newPage}</a></li>`);
        } else if (i === page) {
          paginationList.append(`<li><a class='active' href='${url}?q=${q}&start=${(i - 1) * 30}'>${i}</a></li>`);
        } else {
          paginationList.append(`<li><a href='${url}?q=${q}&start=${(i - 1) * 30}'>${i}</a></li>`);
        }
      }
      if (page > 4) {
        paginationList.prepend(`<li><a href='${url}?q=${q}&start=0'>1</a></li><li class='inactive'>…</li>`);
      }
      paginationList.append(xItems);
      if (pagMax !== lastPage) {
        paginationList.append(`<li class='inactive'>…</li><li><a href='${url}?q=${q}&start=${(lastPage - 1) * 30}'>${lastPage}</a></li>`);
      }
      if (page !== 1) {
        paginationList.prepend(`<li><a class='prev-page button' href='${url}?q=${q}&start=${(page - 2) * 30}'>POPRZEDNIA</a></li>`);
      }
      if (page !== lastPage) {
        return paginationList.append(`<li><a class='next-page button' href='${url}?q=${q}&start=${page * 30}'>NASTĘPNA</a></li>`);
      }
    };

    // suggester
    suggesterURL = `${baseURL[env]}/collection/collection-search-suggestions/`;

    currentSuggest = -1;

    listSuggest = null;

    // wyświetla podpowiedzi do wyszukiwania
    printSuggestions = function(suggestions) {
      var tempURL;
      tempURL = {
        pl: `${baseURL[env]}/pl/kolekcja/wyszukiwarka?q=`,
        en: `${baseURL[env]}/en/collection/search?q=`
      };
      MA.settings.suggester.empty();
      suggestions.forEach(function(item) {
        var url;
        if (typeof item === 'number') {
          return;
        }
        item = '"' + item.replace(/[„”"']/g, '') + '"';
        url = tempURL[MA.settings.currentLanguage] + encodeURIComponent(item);
        return MA.settings.suggester.append(`<li><a href='${url}'>${item}</a></li>`);
      });
      currentSuggest = -1;
      return listSuggest = document.querySelectorAll('ul.suggester li');
    };

    // pobiera podpowiedzi do wyszukiwania
    suggest = function(q) {
      var url;
      url = `${tunelSOLR[env]}?link=ma_collection/terms&terms.limit=10&terms.fl=autocomplete&terms.regex.flag=case_insensitive&terms.regex=.*${decodeURI(q).replace(/\s/g, '.')}.*`;
      return fetch(url).then(async function(res) {
        var resJSON;
        resJSON = (await res.json());
        // console.log resJSON.terms.autocomplete
        if (resJSON.terms.autocomplete.length > 0) {
          MA.settings.suggester.show();
          return printSuggestions(resJSON.terms.autocomplete);
        }
      }).catch(function(err) {
        return console.error(err);
      });
    };

    apiTest = function() {
      return console.log('Public API available!');
    };

    // Public API
    MA.prototype.api = {
      apiTest: apiTest,
      openMenu: openMenu,
      closeMenu: closeMenu,
      setNavBackground: setNavBackground,
      isotopeSetup: isotopeSetup,
      grid: MA.settings.grid,
      removePL: removePL,
      polishPlural: polishPlural
    };

    return MA;

  }).call(this);

  window.MA = new MA();

  // jQuery
  $(function() {
    var wBtn, wMore;
    window.MA.init();
    // kids-n-parents -> Warsztaty
    wBtn = $('.kids-n-parents a.workshop');
    wMore = $('.kids-n-parents .more');
    return wBtn.click(function(e) {
      e.preventDefault();
      return wMore.slideToggle();
    });
  });

}).call(this);

//# sourceMappingURL=ma.js.map
