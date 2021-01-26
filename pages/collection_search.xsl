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
<xsl:include href="../utilities/_collection-header.xsl"/>

<xsl:template match="data">
	<xsl:call-template name="collection" />
</xsl:template>

<xsl:template name="collection">
	<xsl:call-template name="image-header">
		<xsl:with-param name="parent-node" select="collection-header-images" />
	</xsl:call-template>
	<section class="coll ">
		<xsl:call-template name="collection-header" />
		<article class="collection-search">
			<h1><xsl:value-of select="plh-page/page/page/item[@lang = //current-language/@handle]" /></h1>
			<form class="search-form" action="">
				<input class="search-field" type="text" name="q" autofocus="" autocomplete="off" placeholder="Wyszukaj">
					<xsl:attribute name="value">
						<xsl:apply-templates select="//params/url-q" />
						<!-- <xsl:apply-templates select="//params/search" /> -->
						<!-- <xsl:text>iuysdiauyd</xsl:text> -->
					</xsl:attribute>
				</input>
				<input type="submit" value="&rarr;" class="icon"/>
				<ul class="suggester">
					</ul>
			</form>
			<xsl:call-template name="count-results">
				<!-- <xsl:with-param name="count" select="//collection-solr-search/response/result/@numFound" /> -->
			</xsl:call-template>
		</article>
	</section>
	<section>
		<!-- Info o braku wyników jeżeli numFound == 0 -->
		<!-- W tej chwili nieużywane, bo nie ma już parametru $search -->
		<!-- zamiast $search jest $url-q -->
		<!-- <xsl:if test="//collection-solr-search/response/result/@numFound = 0 and $search">
			<xsl:call-template name="no-results" />
		</xsl:if> -->
		<div class="bricks-container search-results">
		</div>
		<div class="load7">
			<p class="loader">Loading…</p>
		</div>
		<div class="pagination">
			<ul class="pagination__list">
			</ul>
		</div>
	</section>
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

<xsl:template match="params/search"> <!-- tego już nie używam do usunięia -->
	<xsl:value-of select="translate(., '+', ' ')" />
</xsl:template>

<xsl:template name="count-results">
	<xsl:param name="count" /> <!-- tego parametru już nie używam do usunięia -->
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

	<xsl:variable name="search-url" select="concat($root, '/', //current-language/@handle, '/', //plh-page/page/item[@lang = //current-language/@handle]/@handle, '/', //plh-page/page/page/item[@lang = //current-language/@handle]/@handle)" />

	<xsl:choose>
		<xsl:when test="not(//params/url-q)">
			 <p class="results-found"><a href='{$search-url}?q="MAt IIIb"'>Architektura międzywojenna</a>. <a href='{$search-url}?q="MAt IIIc"'>Architektura współczesna</a>. Autorzy udostępnionych prac: <a href="{$search-url}?q=Tadeusz%20Brzoza">Tadeusz Brzoza</a>, <a href="{$search-url}?q=Jacek%20Burzyński">Jacek Burzyński</a>, <a href="{$search-url}?q=Ewa%20Cieszyńska">Ewa Cieszyńska</a>, <a href="{$search-url}?q=Władysław%20Czerny">Władysław Czerny</a>, <a href="{$search-url}?q=Julian%20Duchowicz">Julian Duchowicz</a>, <a href="{$search-url}?q=Andrzej%20Frydecki">Andrzej Frydecki</a>, <a href="{$search-url}?q=Jan%20Głuszak%20Dagarama">Jan Głuszak "Dagarama”</a>, <a href="{$search-url}?q=Włodzimierz%20Gruszczyński">Włodzimierz Gruszczyński</a>, <a href="{$search-url}?q=Emil%20Kaliski">Emil Kaliski</a>, <a href="{$search-url}?q=Jan%20Koszczyc%20Witkiewicz">Jan Koszczyc Witkiewicz</a>, <a href="{$search-url}?q=Bohdan%20Lachert">Bohdan Lachert</a>, <a href="{$search-url}?q=Romuald%20Loegler">Romuald Loegler</a>, <a href="{$search-url}?q=Witold%20Lipiński">Witold Lipiński</a>, <a href="{$search-url}?q=Zygmunt%20Majerski">Zygmunt Majerski</a>, <a href="{$search-url}?q=Maciej%20Nowicki">Maciej Nowicki</a>, <a href="{$search-url}?q=Jerzy%20Mokrzyński">Jerzy Mokrzyński</a>, <a href="{$search-url}?q=Maria%20Molicka">Maria Molicka</a>, <a href="{$search-url}?q=Witold%20Molicki">Witold Molicki</a>, <a href="{$search-url}?q=Maria%20Muller">Maria Müller</a>, <a href="{$search-url}?q=Stefan%20Muller">Stefan Müller</a>, <a href="{$search-url}?q=Jerzy%20Sołtan">Jerzy Sołtan</a>, <a href="{$search-url}?q=Helena%20Syrkus">Helena Syrkus</a>, <a href="{$search-url}?q=Szymon%20Syrkus">Szymon Syrkus</a>, <a href="{$search-url}?q=Stefan%20Tworkowski">Stefan Tworkowski</a>, <a href="{$search-url}?q=Marian%20Sulikowski">Marian Sulikowski</a>, <a href="{$search-url}?q=Józef%20Szanajca">Józef Szanajca</a>, <a href="{$search-url}?q=Tadeusz%20Teodorowicz-Todorowski">Tadeusz Teodorowicz-Todorowski</a></p>
		</xsl:when>
		<xsl:otherwise>
			<p class="results-found"><span class="number loading">Znaleziono ___ obiektów</span></p>
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

			<!-- Doładowuje eyniki po skrolowaniu na doł strony
			$(window).scroll(function() {
				if($(window).scrollTop() + $(window).height() <xsl:text disable-output-escaping="yes">&gt;</xsl:text>= $(document).height() - 1) { -->
				<!-- MA.askSOLR('<xsl:value-of select="//params/url-q" />') -->
					<!-- firstRun();
				}
			}) -->

			$('.search-form').submit(function(e) {
				e.preventDefault();
				window.location.href = `<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', //plh-page/page/item[@lang = //current-language/@handle]/@handle, '/', //plh-page/page/page/item[@lang = //current-language/@handle]/@handle)" />?q=${encodeURIComponent($('input.search-field').val())}`;
			})

			MA.sugg($('input.search-field'))

			<!--
			Zapisuje pozycję scrollTop przy opuszczaniu strony
			$(window).unload(function() {
				sessionStorage.setItem('scrollPosition', $(window).scrollTop())
			})
			-->

		});

		<!-- // można przenieść do klasy MA  -->
		<!-- // i wywoływać MA.firstRun('<xsl:value-of select="//params/url-q" />') -->
		function firstRun() {
			if('<xsl:value-of select="//params/url-q" />' == '') {
				MA.askSOLR('*', <xsl:value-of select="//params/url-start" />);
			} else {
				MA.askSOLR('<xsl:value-of select="//params/url-q" />', <xsl:value-of select="//params/url-start" />);
			}
		}

		$(window).load(function() {
			MA.iS();
			firstRun();
		});
	</script>
	<xsl:call-template name="collection-header-js" />
</xsl:template>

</xsl:stylesheet>
