class MA
	# Menu vars
	searchForm = $('#search-form')
	searchTrigger = $('.search-trigger')
	menuTrigger = $('.menu-trigger')
	mainMenu = $('.main-menu')

	# Isotope grid vars
	grid = $('.bricks-container')
	gridItem = '.brick'

	# Scope problems
	@settings =
		stickyNav: $('.sticky-nav')
		searchForm: $('#search-form')
		searchTrigger: $('.search-trigger')
		menuTrigger: $('.menu-trigger')
		mainMenu: $('.main-menu')
		mainMenuOpened: false
		grid: $('.bricks-container')
		gridItem: '.brick'
		highlightOn: false
		highlightVisible: false


	# Private methods

	searchToggle = (trigger, target) -> 
		trigger.click ->
			target.css('opacity', (i, opacity) ->
				if opacity > 0 then 0 else 1
			)

	openMenu = ->
		target = MA.settings.mainMenu
		trigger = MA.settings.menuTrigger
		MA.settings.mainMenuOpened = true
		target.show().parent().data('state', 'extended').addClass('extended').css('height', '100vh')
		stickyNavSetup({
			color: 'white',
			backgroundColor: 'black'
		})
		targetHeight = $(window).height() - 150
		trigger.text('X')
		target.css('height', targetHeight).perfectScrollbar({
			suppressScorllX: true
		})
		return

	closeMenu = ->
		target = MA.settings.mainMenu
		trigger = MA.settings.menuTrigger
		MA.settings.mainMenuOpened = false
		target.parent().data('state', 'collapsed')
		target.hide().parent().removeClass('extended').css('height', 'auto')
		stickyNavSetup({
			color: 'black',
			backgroundColor: 'transparent'
			# backgroundColor: if MA.settings.highlightVisible then 'transparent' else 'white'
			})
		trigger.text('g')
		return

	menuToggle = (trigger, target) ->
		trigger.click ->
			mainMenuState = target.parent().data('state')
			if mainMenuState == 'collapsed'
				openMenu()
			else
				closeMenu()

	isotopeSetup = (target, item) ->
		$(window).load( ->
			grid.isotope({
				itemSelector: item,
				masonry: {
					gutter: 15
				}
			});
		)

	stickyNavSetup = (options) ->
		settings = $.extend( {
			#defaults
			color: 'black',
			backgroundColor: 'white'
		}, options )

		MA.settings.stickyNav.css( {
			'color': settings.color
			'backgroundColor': settings.backgroundColor
		} )

	setNavBackground = (offsetElement) ->
		offset = $(offsetElement).height() - 125
		dirCount = [0, 0]
		direction = ''

		$(window).scroll ->
			dirCount.pop()
			dirCount.push($(window).scrollTop())
			dirCount.reverse()
			direction = if dirCount[0] > dirCount[1] then 'down' else 'up'

		# Highligt in!
			if $(window).scrollTop() < offset and  not MA.settings.mainMenuOpened
				stickyNavSetup({
					backgroundColor: 'transparent'
					})

			# Highligt out!
			if $(window).scrollTop() >= offset and  not MA.settings.mainMenuOpened
				stickyNavSetup({
					backgroundColor: 'white'
					})
		return


	setupHighlight: ->
		MA.settings.highlightOn = true
		items = $('.owl-carousel .item').length
		$('.owl-carousel').owlCarousel({
			loop: items > 1,
			items: 1,
			dots: true,
			smartSpeed: 1000,
			autoplay: true,
			autoplayTimeout: 7000,
			smartSpeed: 800
			# autoplayHoverPause: true
		})
		stickyNavSetup({
			backgroundColor: 'transparent'
		})

		$('.slide-down a').click ->
			hlHeight = $('.owl-carousel').height() - 125
			console.log 'Click!'
			$('html, body').animate({
				scrollTop: hlHeight
			}, 800)

		setNavBackground('.owl-carousel')

		###
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

			# Highligt in!
			if $(window).scrollTop() < hlHeight and not MA.settings.highlightVisible
				MA.settings.highlightVisible = true
				stickyNavSetup({
					backgroundColor: 'transparent'
					})
				console.log 'Highligt in!'

			# Highligt out!
			if $(window).scrollTop() >= hlHeight and MA.settings.highlightVisible
				MA.settings.highlightVisible = false
				stickyNavSetup({
					backgroundColor: 'white'
					})
				console.log 'Highligt out!'
		###

		return

	isScrolledIntoView = (elem) ->
		$elem = $(elem);
		$window = $(window);

		docViewTop = $window.scrollTop();
		docViewBottom = docViewTop + $window.height();

		elemTop = $elem.offset().top;
		elemBottom = elemTop + $elem.height();

		return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));


	
	# Public methods
	stickyNavSetup: (options) ->
		settings = $.extend( {
			#defaults
			color: 'black',
			backgroundColor: 'white'
		}, options )

		MA.settings.stickyNav.css( {
			'color': settings.color
			'backgroundColor': settings.backgroundColor
		} )
	


	apiTest = ->
  	console.log 'Public API available!'

	# Public API
	api:
		apiTest: apiTest
		openMenu: openMenu
		closeMenu: closeMenu
		setNavBackground: setNavBackground

	# Initialize
	init: ->
		searchToggle(searchTrigger, searchForm)
		menuToggle(menuTrigger, mainMenu)
		isotopeSetup(grid, gridItem) # poprawić --> nie na wszystkich stronach
		Hyphenator.config({
			orphancontrol: 2
			defaultlanguage: 'pl'
			minwordlength: 8
		})
		Hyphenator.run()
		console.log 'MA initiated.'


window.MA = new MA()

getHashFilter = ->
  hash = location.hash
  # get filter=filterName
  matches = location.hash.match(/filter=([^&]+)/i)
  hashFilter = matches and matches[1]
  hashFilter and decodeURIComponent(hashFilter)



# jQuery
$ ->
	console.log 'DOM is ready!'
	window.MA.init()

	filters = $('.filters li')
	filterTriggers = $('.filters li a:not(.clear-filter)')

	clear = $('.filters li a.clear-filter')
	showAll = $('.filters li.show-all')
	
	clear.click (e) ->
		e.preventDefault()
		filters.removeClass('inactive-filter')
		$(@).hide()
		history.pushState '', document.title, window.location.pathname
		$('.bricks-container').isotope({
				filter: '*'
			})

	showAll.click (e) ->
		e.preventDefault()
		filters.removeClass('inactive-filter')
		history.pushState '', document.title, window.location.pathname
		$('.bricks-container').isotope({
				filter: '*'
			})

	filterTriggers.click (e) ->
		e.preventDefault()
		filters.addClass('inactive-filter')
		$(@).parent().removeClass('inactive-filter')
		filters.find('.clear-filter').hide()
		$(@).parent().find('.clear-filter').show()
		location.hash = 'filter=' + encodeURIComponent( $(@).data('filter') )
		###
		$('.bricks-container').isotope({
				filter: '.' + $(@).data('filter')
			})
		###

	onHashchange = ->
		hashFilter = getHashFilter()
		if !hashFilter
		  return
		# filter isotope
		filters.addClass('inactive-filter')
		filters.parent().find('.' + hashFilter).removeClass('inactive-filter').find('.clear-filter').show()
		$('.bricks-container').isotope
			filter: '.' + hashFilter

	$(window).on 'hashchange', onHashchange
	# trigger event handler to init Isotope
	onHashchange()

	# kids-n-parents -> Warsztaty
	wBtn = $('.kids-n-parents a.workshop')
	wMore = $('.kids-n-parents .more')
	wBtn.click (e) ->
		e.preventDefault()
		wMore.slideToggle()



###
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
###