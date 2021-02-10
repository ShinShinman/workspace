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
		</article>
	</section>
	<section>
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

<xsl:template match="collection-nav/page">
	<li>
		<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{item[@lang = //fl-languages/current-language/@handle]/@handle}/">
			<xsl:value-of select="item[@lang = //fl-languages/current-language/@handle]" />
		</a>
	</li>
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

			<!-- Zapisuje pozycję scrollTop przy opuszczaniu strony -->
			const startIndex = '<xsl:value-of select="//params/url-start" />'
			$(window).unload(function() {
				sessionStorage.setItem('scrollPosition', $(window).scrollTop())
				sessionStorage.setItem('startIndex', (startIndex != '') ? startIndex : '0')
			})

			var lazyImgs = $('img.lazy');
			lazyImgs.lazyload({
				threshold: 1000,
				failure_limit : 1000
			});

		});

		$(window).load(function() {
			MA.iS();
			MA.askSOLR('audiodeskrypcja.title:*', <xsl:value-of select="//params/url-start" />);
		});
	</script>
	<xsl:call-template name="collection-header-js" />
</xsl:template>

</xsl:stylesheet>
