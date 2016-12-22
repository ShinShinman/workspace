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
<xsl:import href="../utilities/_collections-brick.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$title">
			<xsl:apply-templates select="museum-collection/entry" />
		</xsl:when>
		<xsl:otherwise>
				<xsl:apply-templates select="museum-collection-text/entry" />
		</xsl:otherwise>
	</xsl:choose>
	<xsl:apply-templates select="museum-collections" />
</xsl:template>

<xsl:template match="museum-collection/entry">
	<xsl:choose>
		<xsl:when test="main-image">
			<header class="offset" style="background-image: url({$root}/image/post-header{main-image/@path}/{main-image/filename}); height: {main-image/meta/@height}px" />
		</xsl:when>
		<xsl:otherwise>
			<header class="offset" />
		</xsl:otherwise>
	</xsl:choose>

	<section class="post">
		<header class="donthyphenate">
			<ul class="category-list">
				<xsl:apply-templates select="category/item" />
			</ul>
			<h1><xsl:value-of select="title" /></h1>
			<xsl:apply-templates select="subtitle" />
		</header>
		<article>
			<xsl:copy-of select="./article/node()" />
		</article>
	</section>
</xsl:template>

<xsl:template match="museum-collection-text/entry">
	<section class="museum">
		<header>
			<h1><a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}"><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></a></h1>
			<ul class="inline-list">
				<xsl:apply-templates select="//museum-nav/page" />
			</ul>
		</header>
		<article>
			<h1><xsl:value-of select="title/p" /></h1>
			<xsl:copy-of select="article/node()" />
		</article>
	</section>
</xsl:template>

<xsl:template match="museum-nav/page">
	<li>
		<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{item[@lang = //fl-languages/current-language/@handle]/@handle}">
			<xsl:value-of select="item[@lang = //fl-languages/current-language/@handle]" />
		</a>
	</li>
</xsl:template>

<xsl:template match="museum-collections">
	<section class="collection-items">
		<header>
			<h1><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'kolekcje']" /></h1>
		</header>
		<div class="bricks-container">
			<xsl:apply-templates select="./entry[title/@handle != $title]" />
		</div>
	</section>
</xsl:template>

<xsl:template match="museum-collections/entry">
	<xsl:call-template name="collections-brick" />
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
			MA.stickyNavSetup({backgroundColor: 'transparent'});
			MA.api.setNavBackground('.offset');
		});
		$(window).load(function() {
			MA.iS();
		})
	</script>
</xsl:template>

</xsl:stylesheet>