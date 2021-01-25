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
		currentLanguage: if window.location.pathname.includes('/pl/') then 'pl' else 'en'
		suggester: $('ul.suggester')

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
			quickSearch: false
			quickSearchField: $('.filters .search input[type = search]')
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
			if settings.slider
						settings.sliderItem.slider 'values', [settings.sliderRange[0], settings.sliderRange[1]]
						updateLegend settings.sliderRange[0], settings.sliderRange[1]

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
			settings.quickSearchField.val('')
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

		#filtrowanie przez QuickSearch
		qSOn = () -> #QuickSearhOn
			# QuickSearch
			form = $ '.filters .search form'
			clearBtn = $ '.filters .search input[type = reset]'
			qsRegex = undefined

			debounce = (fn, threshold) ->
				timeout = undefined
				treshold = treshold | 100
				return debounced = () ->
					clearTimeout timeout
					args = arguments
					_this = this
					delayed = () ->
						fn.apply _this, args
						return
					timeout = setTimeout delayed, threshold
					return

			settings.quickSearchField.keyup debounce () ->
				tmp = settings.quickSearchField.val().split(' ')
				$.each tmp, (i, v) ->
					tmp[i] = '(?=.*' + v + ')'

				searchStr = tmp.join('')
				qsRegExp = new RegExp searchStr + '.*', 'gi'
				settings.grid.isotope
					filter: ->
						$(this).text().match(qsRegExp)
			, 200

		if settings.quickSearch
			qSOn()
			$('.filters .search form').on 'reset', (e) ->
				setTimeout ->
					settings.grid.isotope
						filter: '*'
					if settings.slider
						settings.sliderItem.slider 'values', [settings.sliderRange[0], settings.sliderRange[1]]
						updateLegend settings.sliderRange[0], settings.sliderRange[1]
					return
				return
			settings.quickSearchField.focus ->
				settings.sliderItem.slider 'values', [settings.sliderRange[0], settings.sliderRange[1]]
				updateLegend settings.sliderRange[0], settings.sliderRange[1]
			console.log 'Quick Search is on'
			return


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

	getCountryCode: (lang, url) ->
		apiKey = "7955c4b5554ea1387dad070d0ae194279a717795137ac2b3b1f884f4"
		$.ajax
			url: "https://api.ipdata.co/country_code?api-key=#{apiKey}"
			type: 'GET'
			dataType: 'text'
			error: (jqXHR, textStatus, errorThrown) ->
				console.log "AJAX Error: #{textStatus}"
			success: (data, textStatus, jqXHR) ->
				#console.log "Successful AJAX call: #{data}"
				if data isnt 'PL' and lang isnt 'en'
					window.location.replace "#{url}"
		return

	getCurrentLimit: ->
		apiKey = "7955c4b5554ea1387dad070d0ae194279a717795137ac2b3b1f884f4"
		$.ajax
			url: "https://api.ipdata.co/count?api-key=#{apiKey}"
			type: "GET"
			dataType: "text"
			error: (jqXHR, textStatus, errorThrown) ->
				console.log "AJAX Error: #{textStatus}"
			success: (data, textStatus, jqXHR) ->
				console.log "Dziś użyto usługi #{data} razy. Dziś możesz z niej skorzystać jeszcze #{1500-data} razy."
		return


	### COLLECTION SOLR ###

	# Ustala środowisko: local albo live
	env = if window.location.origin.includes('ma.wroc.pl') then "live" else "local"

	# remove hanging single letters
	ziomy = (string) ->
		return string.replace /\s\b(a|i|o|u|w|z|A|I|O|U|W|Z|we|ul\.)\b\s/gi, ' $1&nbsp;'

	# usuwa polskie znaki
	removePL = (string, map) ->
		currentMap = $.extend {
			ą: 'a'
			ć: 'c'
			ę: 'e'
			ł: 'l'
			ń: 'n'
			ó: 'o'
			ś: 's'
			ż: 'z'
			ź: 'z'
		}, map
		tempArray = string.toLowerCase().split('')
		tempArray.forEach (el, i) ->
			if currentMap[el]
				tempArray[i] = currentMap[el]
		return tempArray.join('')

	#	templete kafelka Isotope

	# ustala adres strony /solr-search
	# użycie: baseURL[env]
	baseURL =
		local: "#{window.location.origin}/ma.wroc.pl"
		live: "#{window.location.origin}"
	# ustala adres tunelu php (tunelSOLR[env])
	tunelSOLR =
		local: "#{baseURL[env]}/workspace/tS.local.php"
		live: "#{baseURL[env]}/workspace/tS.php"
	#ustawienia kolejki pobierania
	start = 0;
	rows = 30;
	numFound = 0;

	# ustala adres Directusa
	# użycie: directusURL[env]
	directusURL =
		local: 'http://127.0.0.1:4081'
		live: 'http://156.17.251.36:59190'

	# loadImage = (src) ->
	# 	new Promise( (resolve, reject) ->
	# 		img = new Image()
	# 		img.onload = () -> resolve(img)
	# 		img.onerror = () -> reject
	# 		img.src = src
	# 	)

	template = (ob) ->
		nazwa =
			pl: if ob.nazwa_obiektu then ziomy(ob.nazwa_obiektu) else ''
			en: if ob.nazwa_obiektu_tlumaczenie then ob.nazwa_obiektu_tlumaczenie else ''
		nazwaObiektu = nazwa[MA.settings.currentLanguage]
		autorzy = if ob.autorzy then ob.autorzy.join(', ') else ''
		datowanie = if ob.datowanie then ob.datowanie else ''
		obrazID = if ob.obraz_asset_url then "#{ob.obraz_asset_url[0]}?key=brick-thumbnail" else ''
		obraz = if ob.obraz_asset_url then await $.get "#{baseURL[env]}/collection/image/?img=#{obrazID}" else ""
		ratio = if ob.obraz_width then ob.obraz_width[0] / 320 else 0
		imgHeight = if ob.obraz_height then Math.floor( ob.obraz_height[0] / ratio ) else 0
		# console.log ob.sygnatura_slug
		link =
			pl: "#{baseURL[env]}/pl/kolekcja/obiekt/#{ob.sygnatura_slug}/"
			en: "#{baseURL[env]}/en/collection/item/#{ob.sygnatura_slug}/"
		img = if obraz then """
			<img
			  width="320"
			  height="#{imgHeight}"
			  data-blank="#{baseURL[env]}/workspace/images/blank.gif"
				src = "#{obraz}"
			  alt="#{autorzy}, #{nazwaObiektu}"
			/>
		""" else ""
		$("""
			<article class="brick">
				<a href="#{link[MA.settings.currentLanguage]}">
					<h1 class="donthyphenate">#{nazwaObiektu}</h1>
					<h2 class="donthyphenate">#{autorzy}</h2>
			    <p>#{datowanie}</p>
					#{img}
				</a>
			</article>
		""")

	# odmina słowa obiekt
	polishPlural = (value) ->
		singularNominativ = 'obiekt'
		pluralNominativ = 'obiekty'
		pluralGenitive = 'obiektów'
		if value == 1
			return "#{value} #{singularNominativ}"
		else if value % 10 >= 2 and value %10 <= 4 and (value % 100 < 10 or value % 100 >= 20)
			return "#{value} #{pluralNominativ}"
		else
			return "#{value} #{pluralGenitive}"

	# askSOLR – dodaje do kontenera Isotope nowe kafle
	askSOLR: (q, start = 0) ->
		loader = $('div.load7')
		if q == ''
			return
		url = "#{tunelSOLR[env]}?link=ma_collection/select&q=#{q}&start=#{start}&rows=#{rows}"
		lastPage = ''
		loader.show()
		# start += rows
		fetch url
			.then (response) ->
				resJSON = await response.json()
				numFound = resJSON.response.numFound
				lastPage = Math.ceil numFound / rows
				$('p.results-found .number').text("Znaleziono #{polishPlural(numFound)}").removeClass('loading')
				resJSON.response.docs.forEach (doc) ->
					MA.settings.grid.isotope('insert', await template(doc))
			.finally () ->
				pagination(start, lastPage, q)
				# timeout ze względu na dodawanie do Isotope
				setTimeout( () ->
						loader.hide()
						$('div.pagination').show()
					, 1000)
			.catch (error) ->
				console.error error
			return

	# pagination
	pagination = (start, lastPage, q) ->
		q = if q == '*' then '' else q
		paginationList = $('ul.pagination__list')
		page = start / rows + 1
		pagStart = page - 3
		pagMax = if (page + 3) > lastPage then lastPage else page + 3
		url =
			pl: "#{baseURL[env]}/pl/kolekcja/wyszukiwarka"
			en: "#{baseURL[env]}/en/collection/search"
		xItems = []
		console.log MA.settings.currentLanguage
		for i  in [pagStart..pagMax]
			if i < 1
				newPage = Math.abs(i) + pagMax + 1
				xItems.unshift "<li><a href='#{url[MA.settings.currentLanguage]}?q=#{q}&start=#{(newPage - 1) * 30}'>#{newPage}</a></li>"
			else if i == page then paginationList.append("<li><a class='active' href='#{url[MA.settings.currentLanguage]}?q=#{q}&start=#{(i - 1) * 30}'>#{i}</a></li>")
			else paginationList.append("<li><a href='#{url[MA.settings.currentLanguage]}?q=#{q}&start=#{(i - 1) * 30}'>#{i}</a></li>")
		if page > 4 then paginationList.prepend("<li><a href='#{url[MA.settings.currentLanguage]}?q=#{q}&start=0'>1</a></li><li class='inactive'>…</li>")
		paginationList.append(xItems)
		if pagMax != lastPage then paginationList.append("<li class='inactive'>…</li><li><a href='#{url[MA.settings.currentLanguage]}?q=#{q}&start=#{(lastPage - 1) * 30}'>#{lastPage}</a></li>")
		if page != 1 then paginationList.prepend("<li><a class='prev-page button' href='#{url[MA.settings.currentLanguage]}?q=#{q}&start=#{(page - 2) * 30}'>POPRZEDNIA</a></li>")
		if page != lastPage then paginationList.append("<li><a class='next-page button' href='#{url[MA.settings.currentLanguage]}?q=#{q}&start=#{(page * 30)}'>NASTĘPNA</a></li>")

	# suggester
	suggesterURL = "#{baseURL[env]}/collection/collection-search-suggestions/"
	currentSuggest = -1
	listSuggest = null

	# wyświetla podpowiedzi do wyszukiwania
	printSuggestions = (suggestions) ->
		tempURL =
			pl: "#{baseURL[env]}/pl/kolekcja/wyszukiwarka?q="
			en: "#{baseURL[env]}/en/collection/search?q="
		MA.settings.suggester.empty()
		suggestions.forEach (item) ->
			if typeof item == 'number' then return
			# console.log item
			item = item.replace(/[„”"']/g, '')
			url = tempURL[MA.settings.currentLanguage] + encodeURIComponent item
			MA.settings.suggester.append("<li><a href='#{url}'>#{item}</a></li>")
		currentSuggest = -1
		listSuggest = document.querySelectorAll('ul.suggester li')

	# pobiera podpowiedzi do wyszukiwania
	suggest = (q) ->
		url = "#{tunelSOLR[env]}?link=ma_collection/terms&terms.limit=10&terms.fl=autocomplete&terms.regex.flag=case_insensitive&terms.regex=.*#{decodeURI(q).replace(/\s/g, '.')}.*"
		# console.log url
		fetch url
			.then (res) ->
				resJSON = await res.json()
				# console.log resJSON.terms.autocomplete
				if resJSON.terms.autocomplete.length > 0
					MA.settings.suggester.show()
					printSuggestions resJSON.terms.autocomplete
			.catch (err) ->
				console.error err

	sugg: (trg) ->
		trg.keyup (e) ->
			if !$(this).val()
				MA.settings.suggester.hide()
				return
			switch e.which
				when 38
					if currentSuggest != -1 then listSuggest[currentSuggest].classList.remove 'highlight'
					if currentSuggest > 0 then currentSuggest--
					else currentSuggest = listSuggest.length - 1
					listSuggest[currentSuggest].classList.add 'highlight'
				when 40
					if currentSuggest != -1 then listSuggest[currentSuggest].classList.remove 'highlight'
					if currentSuggest < listSuggest.length - 1 then currentSuggest++
					else currentSuggest = 0
					listSuggest[currentSuggest].classList.add 'highlight'
				when 13
					trg.val(listSuggest[currentSuggest].firstChild.textContent).submit()
				else suggest encodeURIComponent $(this).val()


	apiTest = ->
		console.log 'Public API available!'

	# Public API
	api:
		apiTest: apiTest
		openMenu: openMenu
		closeMenu: closeMenu
		setNavBackground: setNavBackground
		isotopeSetup: isotopeSetup
		grid: MA.settings.grid
		removePL: removePL
		polishPlural: polishPlural

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
