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
	<!ENTITY gt "&#37;">
]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:include href="../utilities/_image-header.xsl"/>
<xsl:include href="../utilities/_collection-brick.xsl"/>

<xsl:template match="data">
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
				<input class="search-field" type="text" name="keywords" autofocus="" placeholder="Wyszukaj">
					<xsl:attribute name="value">
						<xsl:apply-templates select="//params/url-keywords" />
					</xsl:attribute>
				</input>
				<input type="submit" value="&rarr;" class="icon"/>
				<input type="hidden" name="sections" value="kolekcja" />
			</form>
			<xsl:call-template name="count-results">
				<xsl:with-param name="count" select="string(count(//collection-search/entry))" />
			</xsl:call-template>
		</article>
	</section>
	<section>
		<xsl:apply-templates select="collection-search/error[node() = 'No records found.']" />
		<div class="bricks-container search-results">
			<xsl:apply-templates select="collection-search/entry" />
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

<xsl:template match="params/url-keywords">
	<xsl:value-of select="." />
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
		<xsl:when test="collection-search/error">
			<p class="results-found">Udostępniamy ponad 1&nbsp;000 obiektów następujących architektów: <a href="{$current-url}/?keywords=Wiktoria+Frydecka">Wiktoria Frydecka</a>, <a href="{$current-url}/?keywords=Andrzej+Frydecki">Andrzej Frydecki</a>, <a href="{$current-url}/?keywords=Maria+Molicka">Maria Molicka</a>, <a href="{$current-url}/?keywords=Witold+Molicki">Witold Molicki</a>, <a href="{$current-url}/?keywords=Tadeusz+Teodorowicz-Todorowski">Tadeusz Teodorowicz-Todorowski</a></p>
<!-- 
			<p class="results-found">Udostępniamy ponad 1&nbsp;000 obiektów następujących architektów: Wiktoria Frydecka&nbsp;(1901–1992), Andrzej Frydecki&nbsp;(1903–1989), Maria Molicka&nbsp;(1931–2014), Witold Molicki&nbsp;(1930–2013), Tadeusz Teodorowicz-Todorowski&nbsp;(1907–2001)</p>
			 -->
		</xsl:when>
		<xsl:otherwise>
			<p class="results-found">Znaleziono <xsl:value-of select="concat(count(//collection-search/entry), ' ', $grammar)" /></p>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="collection-search/error[. = 'No records found.']">
	<xsl:choose>
		<xsl:when test="//current-language/@handle = 'pl'">
			<h1>Nie znaleziono wyników.</h1>
		</xsl:when>
		<xsl:otherwise>
			<h1><xsl:value-of select="." /></h1>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="collection-search/entry">
	<xsl:call-template name="collection-brick" />
</xsl:template>

<xsl:template match="images">
	<xsl:variable name="ratio">
		<xsl:value-of select="file/meta/@width div 320" />
	</xsl:variable>
	<!-- Wersja dla jQuery-lazyload [https://appelsiini.net/projects/lazyload/v1/] -->
	<img class="lazy"
			 width="320"
			 height="{floor(file/meta/@height div $ratio)}"
			 alt="{../authors}, {../object-name}"
			 data-original="{$root}/image/post-thumbnail{file/@path}/{file/filename}" />

<!-- Wersja dla vanilla-lazyload [https://github.com/verlok/lazyload] -->
<!-- 
	<img class="lazy"
			 width="320"
			 height="{floor(file/meta/@height div $ratio)}"
			 style="width: 320px; height: {floor(file/meta/@height div $ratio)}px"
			 data-src="{$root}/image/post-thumbnail{file/@path}/{file/filename}"
			 data-srcset="{$root}/image/post-thumbnail{file/@path}/{file/filename},
			 							{$root}/image/1/640/0{file/@path}/{file/filename} 2x,
			 							{$root}/image/1/960/0{file/@path}/{file/filename} 3x"
			 alt="{../authors}, {../object-name}" />
 -->
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
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'transparent'});
			MA.api.setNavBackground('.offset');

			var lazyImgs = $('img.lazy');
			lazyImgs.lazyload({
				threshold: 1000,
				failure_limit : 1000
			});
		});
		
		$(window).load(function() {
			MA.iS();
		});
	</script>
</xsl:template>

</xsl:stylesheet>
