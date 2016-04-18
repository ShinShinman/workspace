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

<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/_edu-brick.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$title">
			<xsl:apply-templates select="edu-lesson/entry" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="edu-header/entry" />
		</xsl:otherwise>
	</xsl:choose>
	<xsl:apply-templates select="edu-lessons" />
</xsl:template>

<xsl:template match="edu-lesson/entry">
	<section class="single-lesson">
		<header class="donthyphenate">
			<h1><xsl:value-of select="title" /></h1>
			<p class="edu-categories"><span class="{category/item/category/@handle}"><xsl:value-of select="category/item/category" /></span></p>
		</header>
		<article>
			<xsl:copy-of select="article/node()" />
		</article>
	</section>
</xsl:template>

<xsl:template match="edu-header/entry">
	<section class="edu">
		<header>
			<h1><xsl:value-of select="title" /></h1>
			<ul class="inline-list">
				<li><a href="javascript:void(0)" class="active">Lekcje muzealne</a></li>
				<li><a href="{$root}/{//plh-page/page/item[@lang = //current-language/@handle]/@handle}/{//dictionary/entry/word[@handle-pl = 'materialy-do-pobrania']/@handle}"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'materialy-do-pobrania']" /></a></li>
				<li><a href="{$root}/{//plh-page/page/item[@lang = //current-language/@handle]/@handle}/{//dictionary/entry/word[@handle-pl = 'gry']/@handle}"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'gry']" /></a></li>
			</ul>
		</header>
		<article>
			<xsl:copy-of select="article/node()" />
		</article>
	</section>
</xsl:template>

<xsl:template match="edu-lessons">
	<section class="edu-items">
		<header>
			<h1><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'lekcje-muzealne-i-wyklady-dla-mlodziezy']" /></h1>
			<ul class="edu-categories">
				<li class="label"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'filtry']" />:</li>
				<xsl:apply-templates select="//edu-categories/entry" />
			</ul>
		</header>
		<div class="bricks-container">
			<xsl:apply-templates select="./entry[not(@id = //edu-lesson/entry/@id)]" />
		</div>
	</section>
</xsl:template>

<xsl:template match="edu-categories/entry">
	<li class="{category/@handle-pl}"><a href="javascript:void(0)" data-filter="{category/@handle}"><xsl:value-of select="category" /></a><a href="javascript:void(0)" class="clear-filter icons">X</a></li>
</xsl:template>

<xsl:template match="edu-lessons/entry">
	<xsl:call-template name="edu-brick" />
</xsl:template>

<xsl:template match="news">
	<section class="news">
		<h1><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'aktualnosci']" /></h1>
		<div class="bricks-container">
			<xsl:apply-templates select="./entry" />
		</div>
	</section>
</xsl:template>

<xsl:template match="news/entry">
	<xsl:call-template name="brick" />
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:choose>
		<xsl:when test="$title">
			<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', 'edukacja/lekcje-muzealne')" />	
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="concat($root, '/', //current-language/@handle, '/')" />			
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