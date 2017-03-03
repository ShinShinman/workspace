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

	iS: (options) ->
		settings = $.extend
			#defaults
			grid: MA.settings.grid
			item: MA.settings.gridItem
			slider: false
			sliderItem: $('.slider')
			sliderRange: [1965, 2016]
			, options

		settings.grid.isotope
			itemSelector: settings.gridItem,
			masonry:
				gutter: 15

		#filtrowanie przyciskami
		getHashFilter = ->
			hash = location.hash
			# get filter=filterName
			matches = location.hash.match(/filter=([^&]+)/i)
			hashFilter = matches and matches[1]
			hashFilter and decodeURIComponent(hashFilter)

		filters = $('.filters li')
		filterTriggers = $('.filters li a:not(.clear-filter)')

		clear = $('.filters li a.clear-filter')
		showAll = $('.filters li.show-all')

		clear.click (e) ->
			e.preventDefault()
			filters.removeClass 'inactive-filter'
			$(@).hide()
			history.pushState '', document.title, window.location.pathname
			settings.grid.isotope
				filter: '*'

		showAll.click (e) ->
			e.preventDefault()
			filters.removeClass 'inactive-filter'
			history.pushState '', document.title, window.location.pathname
			settings.grid.isotope
				filter: '*'

		filterTriggers.click (e) ->
			e.preventDefault()
			filters.addClass 'inactive-filter'
			$(@).parent().removeClass 'inactive-filter'
			filters.find('.clear-filter').hide()
			$(@).parent().find('.clear-filter').show()
			location.hash = 'filter=' + encodeURIComponent $(@).data('filter')

		onHashchange = ->
			hashFilter = getHashFilter()
			if !hashFilter
				return
			# filter isotope
			filters.addClass 'inactive-filter'
			filters.parent().find('.' + hashFilter).removeClass('inactive-filter').find('.clear-filter').show()
			settings.grid.isotope
				filter: '.' + hashFilter

		$(window).on 'hashchange', onHashchange
		# trigger event handler to init Isotope
		onHashchange()

		#filtrowanie sliderem
		updateLegend = (sYear, eYear) ->
				$('.legend span').text(' ' + sYear + '–' + eYear)

		filterIsotope = (sYear, eYear) ->
			value = $('.brick').filter( (index) ->
				$this = $(this)
				matcharr = $this.attr('class').match(/brick\s([0-9]*)/)
				if matcharr
					year = parseInt(matcharr[1])
					if year >= sYear and year <= eYear then true else false
				else
					false
			)
			settings.grid.isotope({filter:value})

		if settings.slider
			$('.slider')
			.slider
				range: true
				min: settings.sliderRange[0]
				max: settings.sliderRange[1]
				values: [settings.sliderRange[0], settings.sliderRange[1]]
				stop: (e, ui) ->
					filterIsotope ui.values[0], ui.values[1]
					updateLegend ui.values[0], ui.values[1]
			.slider 'pips',
				step: 5
			.slider 'float'
			updateLegend $('.slider').slider('values', 0), $('.slider').slider('values', 1)

	iSl: (options) -> #ta metoda nie jest uzywana, przeniosłem ją do MA.iS(), do usunięcia
		settings = $.extend
			#defaults
			grid: MA.settings.grid
			slider: $('.slider')
			sliderRange: [1965, 2016]
			, options
		
		updateLegend = (sYear, eYear) ->
				$('.legend span').text(' ' + sYear + '–' + eYear)

		filterIsotope = (sYear, eYear) ->
			value = $('.brick').filter( (index) ->
				$this = $(this)
				matcharr = $this.attr('class').match(/brick\s([0-9]*)/)
				if matcharr
					year = parseInt(matcharr[1])
					if year >= sYear and year <= eYear then true else false
				else
					false
			)
			$('.bricks-container').isotope({filter:value})

		$.getScript '../../../workspace/js/jquery-ui.min.js', ->
			$.getScript '../../../workspace/js/jquery-ui-slider-pips.min.js', ->
				$('.slider')
				.slider
					range: true
					min: settings.sliderRange[0]
					max: settings.sliderRange[1]
					values: [settings.sliderRange[0], settings.sliderRange[1]]
					stop: (e, ui) ->
						filterIsotope ui.values[0], ui.values[1]
						updateLegend ui.values[0], ui.values[1]
				.slider 'pips',
					step: 5
				.slider 'float'
				updateLegend $('.slider').slider('values', 0), $('.slider').slider('values', 1)

	apiTest = ->
  	console.log 'Public API available!'

	# Public API
	api:
		apiTest: apiTest
		openMenu: openMenu
		closeMenu: closeMenu
		setNavBackground: setNavBackground
		isotopeSetup: isotopeSetup

	# Initialize
	init: ->
		searchToggle(searchTrigger, searchForm)
		menuToggle(menuTrigger, mainMenu)
		#isotopeSetup(grid, gridItem) # poprawić --> nie na wszystkich stronach
		Hyphenator.config({
			orphancontrol: 2
			defaultlanguage: 'pl'
			minwordlength: 8
		})
		Hyphenator.run()


window.MA = new MA()

# jQuery
$ ->
	window.MA.init()

	# kids-n-parents -> Warsztaty
	wBtn = $('.kids-n-parents a.workshop')
	wMore = $('.kids-n-parents .more')
	wBtn.click (e) ->
		e.preventDefault()
		wMore.slideToggle()
