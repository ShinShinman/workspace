<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#x00A0;">
	<!ENTITY copy   "&#169;">
	<!ENTITY ndash "&#8211;">
	<!ENTITY thinsp "&#8201;">
	<!ENTITY amp "&#038;">
	<!ENTITY hellip "&#8230;">
	<!ENTITY bull "&#8226;">
	<!ENTITY lsaqua "&#8249;">
	<!ENTITY rsaqua "&#8250;">
	<!ENTITY larr "&#8592;">
	<!ENTITY rarr "&#8594;">
	<!ENTITY lsaquo "&#8249;">
	<!ENTITY rsaquo "&#8250;">
	<!ENTITY percent "&#37;">
	<!ENTITY gt "&#62;">
]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:include href="../utilities/_image-header.xsl"/>
<xsl:include href="../utilities/_connection-brick.xsl"/>
<xsl:include href="../utilities/_string-replace.xsl"/>

<xsl:template match="data">
	<xsl:call-template name="collection" />
	<!-- <xsl:choose>
		<xsl:when test="$signature">
			<xsl:if test="collection-item/error">
				<script>
					window.location.replace('<xsl:value-of select="$root"/>/error/');
				</script>
			</xsl:if>
			<xsl:apply-templates select="connection-item" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="collection" />
		</xsl:otherwise>
	</xsl:choose> -->
</xsl:template>

<xsl:template name="collection">
	<xsl:call-template name="image-header">
		<xsl:with-param name="parent-node" select="collection-header-images" />
	</xsl:call-template>
	<section class="coll ">
		<header>
			<h1><a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/"><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></a></h1>
			<ul class="inline-list">
				<xsl:apply-templates select="//collection-nav/page" />
			</ul>
		</header>
		<article class="collection-search">
			<h1><xsl:value-of select="plh-page/page/page/item[@lang = //current-language/@handle]" /></h1>
			<form class="search-form" action="">
				<input class="search-field" type="text" name="keywords" autofocus="" autocomplete="off" placeholder="Wyszukaj">
					<xsl:attribute name="value">
						<xsl:apply-templates select="//params/search" />
					</xsl:attribute>
				</input>
				<input type="submit" value="&rarr;" class="icon"/>
				<!-- <input type="hidden" name="sections" value="kolekcja" /> -->
				<ul class="suggester">
					</ul>
			</form>
			<xsl:call-template name="count-results">
				<!-- <xsl:with-param name="count" select="string(count(//connection-test/item))" /> -->
				<xsl:with-param name="count" select="//collection-solr-search/response/result/@numFound" />
			</xsl:call-template>
		</article>
	</section>
	<section>
		<xsl:apply-templates select="connection-test/error[node() = 'No records found.']" />
		<xsl:if test="//collection-solr-search/response/result/@numFound = 0">
			<xsl:call-template name="no-results" />
		</xsl:if>
		<div class="bricks-container search-results">
			<!-- <xsl:apply-templates select="connection-test/item" /> -->

			<xsl:apply-templates select="collection-solr-search/response/result/doc" />
		</div>
	</section>
</xsl:template>

<!-- BRICK -->
<xsl:template match="collection-solr-search/response/result/doc">
	<article class="brick">
		<a href="{$root}/{//current-language/@handle}/{//plh-page/page/item[@lang = //current-language/@handle]/@handle}/{*[@name='sygnatura_slug']/str}/">
			<h1 class="donthyphenate">
				<xsl:value-of select="*[@name='nazwa_obiektu']" />
			</h1>
			<h2 class="donthyphenate"><xsl:apply-templates select="*[@name='autorzy']/str" /></h2>
			<p><xsl:value-of select="*[@name='datowanie']" /></p>
			<xsl:apply-templates select="images" />
		</a>
	</article>
</xsl:template>

<xsl:template match="*[@name='autorzy']/str">
	<xsl:value-of select="." />
	<xsl:if test="./following-sibling::*">
		<xsl:text>, </xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="collection-nav/page">
	<li>
		<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{item[@lang = //fl-languages/current-language/@handle]/@handle}/">
			<xsl:value-of select="item[@lang = //fl-languages/current-language/@handle]" />
		</a>
	</li>
</xsl:template>

<xsl:template match="params/search">
	<xsl:value-of select="translate(., '+', ' ')" />
</xsl:template>

<xsl:template name="count-results">
	<xsl:param name="count" />
	<xsl:variable name="last-digit">
		<xsl:value-of select="substring($count, string-length($count), 1)" />
	</xsl:variable>
	<xsl:variable name="grammar">
		<xsl:choose>
			<xsl:when test="$last-digit = '1'">
				<xsl:text>obiekt</xsl:text>
			</xsl:when>
			<xsl:when test="$last-digit = '2'">
				<xsl:text>obiekty</xsl:text>
			</xsl:when>
			<xsl:when test="$last-digit = '3'">
				<xsl:text>obiekty</xsl:text>
			</xsl:when>
			<xsl:when test="$last-digit = '4'">
				<xsl:text>obiekty</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>obiektów</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:choose>
		<xsl:when test="//collection-solr-search/response/result/@numFound = 0">
			<p class="results-found">Udostępniamy ponad 1&nbsp;000 obiektów następujących architektów: <a href="{$current-url}/autorzy:Wiktoria+Frydecka/">Wiktoria Frydecka</a>, <a href="{$current-url}/autorzy:Andrzej+Frydecki/">Andrzej Frydecki</a>, <a href="{$current-url}/autorzy:Maria+Molicka/">Maria Molicka</a>, <a href="{$current-url}/autorzy:Witold+Molicki/">Witold Molicki</a>, <a href="{$current-url}/autorzy:Tadeusz+Teodorowicz-Todorowski/">Tadeusz Teodorowicz-Todorowski</a></p>
<!--
			<p class="results-found">Udostępniamy ponad 1&nbsp;000 obiektów następujących architektów: Wiktoria Frydecka&nbsp;(1901–1992), Andrzej Frydecki&nbsp;(1903–1989), Maria Molicka&nbsp;(1931–2014), Witold Molicki&nbsp;(1930–2013), Tadeusz Teodorowicz-Todorowski&nbsp;(1907–2001)</p>
			 -->
		</xsl:when>
		<xsl:otherwise>
			<p class="results-found">Znaleziono <xsl:value-of select="concat($count, ' ', $grammar)" /></p>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="no-results">
	<xsl:choose>
		<xsl:when test="//current-language/@handle = 'pl'">
			<h1>Nie znaleziono wyników.</h1>
		</xsl:when>
		<xsl:otherwise>
			<h1>No records found.</h1>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- <xsl:template match="connection-test/error[. = 'No records found.']">
	<xsl:choose>
		<xsl:when test="//current-language/@handle = 'pl'">
			<h1>Nie znaleziono wyników.</h1>
		</xsl:when>
		<xsl:otherwise>
			<h1><xsl:value-of select="." /></h1>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template> -->

<!-- <xsl:template match="connection-test/item">
	<xsl:call-template name="connection-brick" />
</xsl:template> -->

<!-- <xsl:template match="connection-item">
	<section class="coll collection-item">
		<header>
			<h1><a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/"><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></a></h1>
			<ul class="inline-list">
				<xsl:apply-templates select="//collection-nav/page" />
			</ul>
		</header>
		<xsl:apply-templates select="item[1]" />
	</section>
	<xsl:if test="count(//collection-related-items/entry[not(signature = //collection-item/entry/signature)]) &gt; 0">
		<xsl:apply-templates select="//collection-related-items" />
	</xsl:if>
</xsl:template> -->

<!-- <xsl:template match="connection-item/item">
	<article>
		<xsl:call-template name="nazwa-obiektu">
			<xsl:with-param name="lang"><xsl:value-of select="//current-language/@handle" /></xsl:with-param>
		</xsl:call-template>
		<h2 class="donthyphenate"><xsl:value-of select="autorzy/item/autorzy/architekt" /></h2>
		<h3><xsl:value-of select="datowanie" /></h3>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<xsl:apply-templates select="images/file" />
			</div>
			<xsl:if test="count(images/file) > 1">
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</xsl:if>
		</div>
		<xsl:if test="count(images/file) > 1">
			<div class="swiper-pagination"><span class="bullet" /></div>
		</xsl:if>
		<ul class="project-description donthyphenate">
			<li><strong><xsl:value-of select="miejscowosc" /></strong></li>
			<li><xsl:value-of select="adres" /><xsl:apply-templates select="adres-cyrylica" /></li>
			<ul class="project-details">
				<li><xsl:call-template name="zawartosc-projektu">
					<xsl:with-param name="lang"><xsl:value-of select="//current-language/@handle" /></xsl:with-param>
				</xsl:call-template>
				</li>
				<li><xsl:call-template name="uwagi">
					<xsl:with-param name="lang"><xsl:value-of select="//current-language/@handle" /></xsl:with-param>
				</xsl:call-template>
				</li>
			</ul>
			<ul class="project-details">
				<li class="label"><span><xsl:value-of select="//dictionary//word[@handle-en = 'inventory-number']" /></span></li>
				<li class="signature"><xsl:value-of select="sygnatura" /></li>

				<xsl:choose>
					<xsl:when test="//current-language/@handle = 'pl'">
						<li><xsl:value-of select="tworzywo-link/item/tworzywo/tworzywo" /></li>
						<li><xsl:value-of select="technika-link/item/technika/technika" /></li>
					</xsl:when>
					<xsl:otherwise>
						<li><xsl:value-of select="tworzywo-link/item/tworzywo/tlumaczenie/item/tworzywo" /></li>
						<li><xsl:value-of select="technika-link/item/technika/tlumaczenie/item/technika" /></li>
					</xsl:otherwise>
				</xsl:choose>
				<li><xsl:value-of select="wymiary" /></li>
			</ul>
		</ul>
	</article>
</xsl:template> -->

<!-- <xsl:template name="nazwa-obiektu">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<h1 class="donthyphenate"><xsl:value-of select="nazwa-obiektu" /></h1>
		</xsl:when>
			<xsl:when test="$lang != 'pl'">
				<h1 class="donthyphenate"><xsl:value-of select="nazwa-obiektu-tlumaczenie/item[language = $lang]/nazwa-obiektu" /></h1>
			</xsl:when>
	</xsl:choose>
</xsl:template> -->

<!-- <xsl:template name="zawartosc-projektu">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<li><xsl:value-of select="zawartosc-projektu" /></li>
		</xsl:when>
			<xsl:when test="$lang != 'pl'">
				<li><xsl:value-of select="zawartosc-projektu-tlumaczenie/item[language = $lang]/zawartosc-projektu" /></li>
			</xsl:when>
	</xsl:choose>
</xsl:template> -->

<!-- <xsl:template name="uwagi">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<li><xsl:value-of select="uwagi" /></li>
		</xsl:when>
			<xsl:when test="$lang != 'pl'">
				<li><xsl:value-of select="uwagi-tlumaczenie/item[language = $lang]/uwagi" /></li>
			</xsl:when>
	</xsl:choose>
</xsl:template> -->


<xsl:template match="data" mode="ma-button">
	<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', //plh-page/page/item[@lang = //current-language/@handle]/@handle, '/')" />
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/{//plh-page/page/page/item[@lang != //current-language/@handle]/@handle}/" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/{//plh-page/page/page/item[@lang != //current-language/@handle]/@handle}/" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="js">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore-min.js" integrity="sha256-G7A4JrJjJlFqP0yamznwPjAApIKPkadeHfyIwiaa9e0=" crossorigin="anonymous"></script>
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'transparent'});
			MA.api.setNavBackground('.offset');

			var lazyImgs = $('img.lazy');
			lazyImgs.lazyload({
				threshold: 1000,
				failure_limit : 1000
			});

			<!-- var url = 'http://156.17.251.36:59190/ma-kolekcja/items/kolekcja'; -->
			<!-- var url = 'http://localhost:4081/ma-kolekcja/items/kolekcja'; -->
			<!-- var url = 'https://api.ipify.org?format=jsonp'; -->
			var url = '<xsl:value-of select="$root" />/collection/collection-search-suggestions/';

			const mapPL = {
				ą: 'a',
				ć: 'c',
				ę: 'e',
				ł: 'l',
				ń: 'n',
				ó: 'o',
				ś: 's',
				ź: 'z',
				ż: 'z'
			}

			function removePL(str) {
				let tempArray = str.toLowerCase().split('');
				tempArray.forEach(function(el, i) {
					if(mapPL[el]) tempArray[i] = mapPL[el];
				})
				return tempArray.join('');
			}

			<!-- $.getJSON(url)
			$.getJSON(url, function(data) {
				console.log(data);
			}) -->

			function ask(q) {
				qString = url + "?q=" + q;
				console.log(qString);
				$.ajax({
					url: qString,
					dataType: 'json',
					success: function(data) {
						console.log(data);
					},
					error: function(data) {
						console.log('ERROR');
						console.log(data);
					}
				});
			}

			window.ask = ask;

			var urlSOLR = '<xsl:value-of select="$root" />/collection/solr-search/';

			function askSOLR(q) {
				qString = urlSOLR + q + "/";
				console.log(qString);
				$.ajax({
					url: qString,
					dataType: 'json',
					success: function(data) {
						console.log(data);
						return data;
					},
					error: function(data) {
						console.log('ERROR');
						console.log(data);
					}
				});
			}

			window.askSOLR = askSOLR;

			const suggesterURL = 'http://localhost/ma.wroc.pl/collection/collection-search-suggestions/';

			async function suggest(q) {
				console.log(q);
				console.log(q.replace(' ', '.'));
				const qString = `${suggesterURL}?q=${removePL(decodeURI(q).replace(/\s/g, '.'))}`;
				// let response = await fetch(qString);
				// let data = await response.json();
				console.log(qString);
				fetch(qString)
					.then(async function(response) {
						let resJSON = await response.json();
						$('ul.suggester').show();
						printSuggestions(resJSON);
					})
					.catch(function(error) {console.error(error);})
			}

			let currentSuggest = -1;
			let listSuggest;
			function printSuggestions(suggestions) {
				const baseUrl = `<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', //plh-page/page/item[@lang=//current-language/@handle]/@handle, '/connection/')" />`;
				const suggestionsArray = suggestions.autocomplete;
				$('.suggester').empty();
				suggestionsArray.forEach(function(i) {
					const url = baseUrl + encodeURIComponent(i) + '/';
					$('.suggester').append('<li><a href="' + url + `">${i}</a></li>`);
				})
				currentSuggest = -1;
				listSuggest = document.querySelectorAll('ul.suggester li');
			}

			window.suggest = suggest;

			// (async function yyy() {
			// 	let res = await fetch(suggesterURL + '?q=mar');
			// 	console.log(await res.json());
			//
			// }());


			<!-- $('.search-results').append(`
			<article class="brick">
				<h1>Yszt</h1>
			</article>
			`) -->

			$('.search-form').submit(function(e) {
				e.preventDefault();
				window.location.href = `<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', //plh-page/page/item[@lang = //current-language/@handle]/@handle, '/', //plh-page/page/page/item[@lang = //current-language/@handle]/@handle)" />/${encodeURIComponent($('input.search-field').val())}/`;
			})



			$('input.search-field').keyup(function(e) {
				<!-- ask($(this).val()); -->
				if (!$(this).val()) {
					$('ul.suggester').hide();
					return
				}
				// if(e.which === 13) return;
				switch(e.which) {
					case 38:
						if(currentSuggest != -1) listSuggest[currentSuggest].classList.remove('highlight');
						if(currentSuggest <xsl:text disable-output-escaping="yes">&#62;</xsl:text> 0) currentSuggest--;
						else currentSuggest = listSuggest.length - 1;
						listSuggest[currentSuggest].classList.add('highlight');
						break;
					case 40:
						if(currentSuggest != -1) listSuggest[currentSuggest].classList.remove('highlight');
						if(currentSuggest <xsl:text disable-output-escaping="yes">&lt;</xsl:text> listSuggest.length - 1) currentSuggest++;
						else currentSuggest = 0;
						listSuggest[currentSuggest].classList.add('highlight');
						break;
					case 13:
						$('input.search-field').val(listSuggest[currentSuggest].firstChild.textContent).submit();
						break;
					default:
						suggest(encodeURIComponent($(this).val()));
				}
			});
		});


		$(window).load(function() {
			MA.iS();
		});
	</script>
</xsl:template>

</xsl:stylesheet>
