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
<xsl:include href="../utilities/_fc-link.xsl" />
<xsl:include href="../utilities/_collections-brick.xsl"/>
<xsl:include href="../utilities/_edu-brick.xsl"/>
<xsl:include href="../utilities/_bookshop-brick.xsl" />

<xsl:template match="data">
	<!--
	<section class="search">
		<header>
			<form action="{$current-url}" method="get" accept-charset="UTF-8" enctype="multipart/form-data" autocomplete="off">
				<h1><input type="text" name="keywords" placeholder="Wyszukaj" /></h1>
				<input type="hidden" name="sort" value="score-recency" />
				<input type="hidden" name="per-page" value="10" />
				<input type="hidden" name="sections" value="bookshop-items,wystawy,kolekcje,events,lessons,edu-workshops,edu-lectures,lessons-aid,edu-games" />
			</form>
		</header>
	</section>
	-->
	<section class="results">
		<nav class="big-nav">
			<h1>Wyniki wyszukiwania</h1>
		</nav>
		<div class="bricks-container">
			<xsl:apply-templates select="search-exhibitions/entry" />
			<xsl:apply-templates select="search-events/entry" />
			<xsl:apply-templates select="search-museum-collections/entry" />
			<xsl:apply-templates select="search-edu-lessons/entry" />
			<xsl:apply-templates select="search-edu-workshops/entry" />
			<xsl:apply-templates select="search-edu-lectures/entry" />
			<xsl:apply-templates select="search-edu-lessons-aid/entry" />
			<xsl:apply-templates select="search-edu-games/entry" />
			<xsl:apply-templates select="search-bookshop-items/entry" />
		</div>
	</section>
</xsl:template>

<xsl:template match="search-bookshop-items/entry">
	<xsl:call-template name="bookshop-brick" />
</xsl:template>

<xsl:template match="search-exhibitions/entry">
	<xsl:call-template name="brick" />
</xsl:template>

<xsl:template match="search-events/entry">
	<xsl:call-template name="brick" />
</xsl:template>

<xsl:template match="search-museum-collections/entry">
	<xsl:call-template name="collections-brick" />
</xsl:template>

<xsl:template match="search-edu-lessons/entry">
	<xsl:call-template name="edu-brick" />
</xsl:template>

<xsl:template match="search-edu-workshops/entry">
	<xsl:call-template name="edu-brick" />
</xsl:template>

<xsl:template match="search-edu-lectures/entry">
	<xsl:call-template name="edu-brick" />
</xsl:template>

<xsl:template match="search-edu-lessons-aid/entry">
	<xsl:call-template name="edu-brick" />
</xsl:template>

<xsl:template match="search-edu-games/entry">
	<xsl:call-template name="edu-brick" />
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:value-of select="concat($root, '/', //current-language/@handle, '/')" />
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'white'});

			var lazyImgs = $("img.lazy");
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
