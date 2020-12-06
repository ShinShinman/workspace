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
				<input class="search-field" type="text" name="keywords" autofocus="" autocomplete="off" placeholder="Wyszukaj">
					<xsl:attribute name="value">
						<xsl:apply-templates select="//params/search" />
					</xsl:attribute>
				</input>
				<input type="submit" value="&rarr;" class="icon"/>
				<ul class="suggester">
					</ul>
			</form>
			<xsl:call-template name="count-results">
				<xsl:with-param name="count" select="//collection-solr-search/response/result/@numFound" />
			</xsl:call-template>
		</article>
	</section>
	<section>
		<xsl:if test="//collection-solr-search/response/result/@numFound = 0 and $search">
			<xsl:call-template name="no-results" />
		</xsl:if>
		<div class="bricks-container search-results">
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
			<!-- <p class="results-found">Udostępniamy ponad 1&nbsp;000 obiektów następujących architektów: <a href="{$current-url}/autorzy:Wiktoria+Frydecka/">Wiktoria Frydecka</a>, <a href="{$current-url}/autorzy:Andrzej+Frydecki/">Andrzej Frydecki</a>, <a href="{$current-url}/autorzy:Maria+Molicka/">Maria Molicka</a>, <a href="{$current-url}/autorzy:Witold+Molicki/">Witold Molicki</a>, <a href="{$current-url}/autorzy:Tadeusz+Teodorowicz-Todorowski/">Tadeusz Teodorowicz-Todorowski</a></p> -->
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

			$(window).scroll(function() {
				if($(window).scrollTop() + $(window).height() <xsl:text disable-output-escaping="yes">&gt;</xsl:text>= $(document).height() - 1) {
					MA.askSOLR('<xsl:value-of select="$search" />')
				}
			})

			$('.search-form').submit(function(e) {
				e.preventDefault();
				window.location.href = `<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', //plh-page/page/item[@lang = //current-language/@handle]/@handle, '/', //plh-page/page/page/item[@lang = //current-language/@handle]/@handle)" />/${encodeURIComponent($('input.search-field').val())}/`;
			})

			MA.sugg($('input.search-field'))
		});

		$(window).load(function() {
			MA.iS();
			MA.askSOLR('<xsl:value-of select="$search" />');
		});
	</script>
	<xsl:call-template name="collection-header-js" />
</xsl:template>

</xsl:stylesheet>
