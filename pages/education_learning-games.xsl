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
<xsl:include href="../utilities/_edu-brick.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$title">
			<xsl:apply-templates select="edu-game/entry" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="edu-educational-games/entry" />
		</xsl:otherwise>
	</xsl:choose>
	<xsl:apply-templates select="edu-games" />
</xsl:template>

<xsl:template match="edu-game/entry">
	<section class="single-game">
		<header>
			<h1><xsl:value-of select="title/p" /></h1>
		</header>
		<article>
			<xsl:copy-of select="article/node()" />
		</article>
	</section>
</xsl:template>

<xsl:template match="edu-educational-games/entry">
	<section class="edu">
		<header>
			<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}"><h1><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></h1></a>
			<ul class="inline-list">
				<xsl:apply-templates select="//edu-nav/page" />
			</ul>
		</header>
		<article>
			<h1><xsl:copy-of select="title/p/node()" /></h1>
			<xsl:copy-of select="article/node()" />
		</article>
	</section>
</xsl:template>

<xsl:template match="edu-nav/page">
	<li>
		<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = 'pl']/@handle}/{item[@lang = 'pl']/@handle}">
			<xsl:value-of select="item[@lang = //fl-languages/current-language/@handle]" />
		</a>
	</li>
</xsl:template>

<xsl:template match="edu-games">
	<section class="edu-items">
		<header>
			<h1><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'gry']" /></h1>
			<ul class="edu-categories filters">
				<li class="label"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'filtry']" />:</li>
				<xsl:apply-templates select="//edu-games-categories/entry" />
			</ul>
		</header>
		<div class="bricks-container">
			<xsl:apply-templates select="./entry[not(@id = //edu-game/entry/@id)]" />
		</div>
	</section>
</xsl:template>

<xsl:template match="edu-games-categories/entry">
	<li class="{category/@handle-pl}"><a href="javascript:void(0)" data-filter="{category/@handle}"><xsl:value-of select="category" /></a><a href="javascript:void(0)" class="clear-filter icons">X</a></li>
</xsl:template>

<xsl:template match="edu-games/entry">
	<xsl:call-template name="edu-brick" />
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:value-of select="concat($root, '/', //current-language/@handle, '/')" />
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/en/education/" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/pl/edukacja/" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'white'});
		});
	</script>
</xsl:template>

</xsl:stylesheet>