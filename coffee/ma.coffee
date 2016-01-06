class MA
	# Menu vars
	searchForm = $('#search-form')
	searchTrigger = $('.search-trigger')
	menuTrigger = $('.menu-trigger')
	mainMenu = $('.main-menu')

	# Isotope grid vars
	grid = $('.bricks-container')
	gridItem = '.brick'


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
				targetHeight = $(window).height() - target.offset().top - 24
				trigger.text('x')
				$('body').css('position', 'fixed')
				target.css('height', targetHeight).perfectScrollbar({
					suppressScorllX: true
				})		

			else
				target.parent().data('state', 'collapsed')
				target.hide().parent().removeClass('extended').css('height', 'auto')
				trigger.text('m')
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

	# Public methods

	# Initialize
	init: ->
		searchToggle(searchTrigger, searchForm)
		menuToggle(menuTrigger, mainMenu)
		isotopeSetup(grid, gridItem)
		console.log ('MA initiated.')


window.MA = new MA()

# jQuery
$ ->
	console.log('DOM is ready!')
	window.MA.init()