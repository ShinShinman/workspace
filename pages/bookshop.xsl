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
<xsl:include href="../utilities/_bookshop-nav.xsl" />
<xsl:include href="../utilities/_bookshop-brick.xsl" />

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$title">
			<xsl:apply-templates select="bookshop-book/entry" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="bookshop" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="bookshop-book/entry">
	<section class="single-book">
		<header class="donthyphenate">
			<ul class="category-list">
				<li><xsl:value-of select="category/item/bookshop-category" /></li>
			</ul>
			<h1><xsl:value-of select="title" /></h1>
			<h2><xsl:value-of select="subtitle" /></h2>
			<p class="author"><xsl:value-of select="author/p" /></p>
			<a href="#" class="button"><xsl:value-of select="prize" /></a>
		</header>
		<article>
			<xsl:copy-of select="article/node()" />
		</article>
	</section>
</xsl:template>

<xsl:template name="bookshop">
	<section class="bookshop-nav">
		<header>
			<xsl:call-template name="bookshop-nav" />
			<ul class="inline-list filters">
				<xsl:apply-templates select="bookshop-categories/entry" />
				<li class="show-all">
					<a href="javascript:void(0)"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'wszystkie']" /></a>
				</li>
			</ul>
		</header>
		<div class="bricks-container">
			<xsl:apply-templates select="bookshop-items/entry" />
		</div>
	</section>
</xsl:template>

<xsl:template match="bookshop-categories/entry">
	<li>
		<a href="javascript:void(0)" data-filter="{bookshop-category/@handle}"><xsl:value-of select="bookshop-category" /></a>
	</li>
</xsl:template>

<xsl:template match="bookshop-items/entry">
	<xsl:call-template name="bookshop-brick" />
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/en/events/" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/pl/wydarzenia/" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!--
<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'white'});
		});
	</script>
</xsl:template>
-->

</xsl:stylesheet>