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
					</xsl:attribute>
				</input>
				<input type="submit" value="&rarr;" class="icon"/>
				<ul class="suggester">
					</ul>
			</form>
			<xsl:call-template name="count-results" />
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

<xsl:template name="count-results">
	<xsl:variable name="search-url" select="concat($root, '/', //current-language/@handle, '/', //plh-page/page/item[@lang = //current-language/@handle]/@handle, '/', //plh-page/page/page/item[@lang = //current-language/@handle]/@handle)" />

	<xsl:choose>
		<xsl:when test="not(//params/url-q)">
			<p class="results-found">
				<xsl:apply-templates select="collection-search-links/entry">
					<xsl:with-param name="search-url" select="$search-url" />
				</xsl:apply-templates>
			</p>
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

<xsl:template match="collection-search-links/entry">
	<xsl:param name="search-url" />
	<xsl:choose>
		<xsl:when test="search-term">
			<a href="{$search-url}?q={search-term}"><xsl:value-of select="link-text" /></a>
		</xsl:when>
		<xsl:otherwise>
		<xsl:text> </xsl:text><xsl:value-of select="link-text" />
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

			<!-- Zapisuje pozycję scrollTop przy opuszczaniu strony -->
			const startIndex = '<xsl:value-of select="//params/url-start" />'
			$(window).unload(function() {
				sessionStorage.setItem('scrollPosition', $(window).scrollTop())
				sessionStorage.setItem('startIndex', (startIndex != '') ? startIndex : '0')
			})

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
