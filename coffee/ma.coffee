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

	menuToggle = (trigger, target) ->
		trigger.click ->
			mainMenuState = target.parent().data('state')
			if mainMenuState == 'collapsed'
				target.show().parent().data('state', 'extended').addClass('extended').css('height', '100vh')
				stickyNavSetup({
					color: 'white',
					backgroundColor: 'black'
				})
				targetHeight = $(window).height() - target.offset().top - 24
				trigger.text('X')
				#disable scroll
				# $('body').css('position', 'fixed')
				target.css('height', targetHeight).perfectScrollbar({
					suppressScorllX: true
				})		
			else
				target.parent().data('state', 'collapsed')
				target.hide().parent().removeClass('extended').css('height', 'auto')
				stickyNavSetup({
					color: 'black',
					backgroundColor: if MA.settings.highlightVisible then 'transparent' else 'white'
					})
				trigger.text('G')
				$('body').css('position', 'static')

	isotopeSetup = (target, item) ->
		$(window).load( ->
			grid.isotope({
				itemSelector: item,
				masonry: {
					gutter: 15
				}
			});
		)

	setNavBackground = (action, highlightOn) ->
		backgroundColor = 'black' if action is 'expanded'
		backgroundColor = 'white' if action is 'collapsed' and not highlightOn
		backgroundColor = 'transparent' if action is 'collapsed' and highlightOn
		MA.settings.stickyNav.css('background-color', backgroundColor)

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

	setupHighlight: ->
		MA.settings.highlightOn = true
		$('.highlight').owlCarousel({
			loop: true,
			items: 1,
			dots: true,
			smartSpeed: 1000,
			autoplay: true,
			autoplayTimeout: 7000
			# autoplayHoverPause: true
		})
		stickyNavSetup({
			backgroundColor: 'transparent'
		})

		hlHeight = $('.highlight').height()
		MA.settings.highlightVisible = true
		dirCount = [0, 0]
		direction = ''

		$(window).scroll ->
			dirCount.pop()
			dirCount.push($(window).scrollTop())
			dirCount.reverse()
			direction = if dirCount[0] > dirCount[1] then 'down' else 'up'
			console.log $(window).scrollTop() < hlHeight

			###
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
			###

			if $(window).scrollTop() < hlHeight and not MA.settings.highlightVisible
				MA.settings.highlightVisible = true
				stickyNavSetup({
					backgroundColor: 'transparent'
					})
				console.log 'Highligt in!'

			if $(window).scrollTop() >= hlHeight and MA.settings.highlightVisible
				MA.settings.highlightVisible = false
				stickyNavSetup({
					backgroundColor: 'white'
					})
				console.log 'Highligt out!'
		
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
	
	# Initialize
	init: ->
		searchToggle(searchTrigger, searchForm)
		menuToggle(menuTrigger, mainMenu)
		isotopeSetup(grid, gridItem)
		Hyphenator.config({orphancontrol: 2})
		Hyphenator.run()
		console.log 'MA initiated.'


window.MA = new MA()

# jQuery
$ ->
	console.log 'DOM is ready!'
	window.MA.init()