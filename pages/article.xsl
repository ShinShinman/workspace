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

<xsl:template match="data">
	<xsl:apply-templates select="exhibition/entry" />
	<xsl:apply-templates select="event/entry" />
	<xsl:apply-templates select="news" />
</xsl:template>

<xsl:template match="exhibition/entry">
	<header class="offset" style="background-image: url({$workspace}{main-image/@path}/{main-image/filename}); height: {main-image/meta/@height}px">
	</header>
	<section class="post">
		<header class="donthyphenate">
			<ul class="category-list">
				<xsl:apply-templates select="category/item" />
			</ul>
			<h1><xsl:value-of select="title" /></h1>
			<xsl:apply-templates select="subtitle" />
			<h3 class="date"><xsl:value-of select="date" /></h3>
			
			<xsl:apply-templates select="tags" />
			<!--<ul class="tag-list">
				<li class="label">Tagi:</li>
				<li class="tag"><a href="javascript:void(0)">#madeInEurope</a></li>
				<li class="tag"><a href="javascript:void(0)">#meisVanDerRohe</a></li>
				<li class="tag"><a href="javascript:void(0)">#architekturaWspółczesna</a></li>
			</ul>-->

			<xsl:apply-templates select="linked-event" />

		</header>
		<article>
			<xsl:copy-of select="article/node()" />
			<!--<xsl:apply-templates select="article//*" />-->
		</article>
	</section>
</xsl:template>

<xsl:template match="event/entry">
	<header class="offset" style="background-image: url({$workspace}{main-image/@path}/{main-image/filename}); height: {main-image/meta/@height}px">
	</header>
	<section class="post">
		<header class="donthyphenate">
			<ul class="category-list">
				<xsl:apply-templates select="category/item" />
			</ul>
			<h1><xsl:value-of select="title" /></h1>
			<xsl:apply-templates select="subtitle" />
			<h3 class="date"><xsl:value-of select="date" /></h3>
			
			<xsl:apply-templates select="tags" />
			<!--<ul class="tag-list">
				<li class="label">Tagi:</li>
				<li class="tag"><a href="javascript:void(0)">#madeInEurope</a></li>
				<li class="tag"><a href="javascript:void(0)">#meisVanDerRohe</a></li>
				<li class="tag"><a href="javascript:void(0)">#architekturaWspółczesna</a></li>
			</ul>-->

			<xsl:apply-templates select="linked-event" />

		</header>
		<article>
			<xsl:copy-of select="article/node()" />
			<!--<xsl:apply-templates select="article//*" />-->
		</article>
	</section>
</xsl:template>

<xsl:template match="subtitle">
	<h2><xsl:value-of select="." /></h2>
</xsl:template>

<xsl:template match="tags">
	<ul class="tag-list">
		<li class="label">Tagi:</li>
		<li class="tag"><a href="javascript:void(0)">#madeInEurope</a></li>
		<li class="tag"><a href="javascript:void(0)">#meisVanDerRohe</a></li>
		<li class="tag"><a href="javascript:void(0)">#architekturaWspółczesna</a></li>
		<!--<xsl:apply-templates select="category/item" />-->
	</ul>
</xsl:template>

<xsl:template match="linked-event">
	<ul class="event-list">
		<li class="label">Powiązane wydarzenia:</li>
		<xsl:apply-templates select="item" />
	</ul>
</xsl:template>

<xsl:template match="linked-event/item">
	<li class="event"><a href="{$root}/wydarzenia/{title/@handle}"><xsl:value-of select="title" /></a></li>
</xsl:template>

<xsl:template match="article//*">
	<xsl:element name="{name()}">
		<xsl:apply-templates select="* | @* | text()" />
	</xsl:element>
</xsl:template>

<xsl:template match="category/item">
	<li><a href="#"><xsl:value-of select="exhib-category" /></a></li>
</xsl:template>

<xsl:template match="news">
	<section class="news">
		<h1><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'aktualnosci']" /></h1>
		<div class="bricks-container">
			<xsl:apply-templates select="./entry/linked-articles/item[not(@id = //exhibition/entry/@id)]" />
		</div>
	</section>
</xsl:template>

<xsl:template match="news/entry">
	<xsl:call-template name="brick" />
</xsl:template>

<xsl:template match="news/entry/linked-articles/item[@section-handle = 'wystawy']">
	<xsl:variable name="id"><xsl:value-of select="./@id" /></xsl:variable>
	<xsl:apply-templates select="//news-exhibitions/entry[@id = $id]" />
</xsl:template>

<xsl:template match="news-exhibitions/entry">
	<xsl:call-template name="brick" />
</xsl:template>

<xsl:template match="news/entry/linked-articles/item[@section-handle = 'events']">
	<xsl:variable name="id"><xsl:value-of select="./@id" /></xsl:variable>
	<xsl:apply-templates select="//news-events/entry[@id = $id]" />
</xsl:template>

<xsl:template match="news-events/entry">
	<xsl:call-template name="brick" />
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', //dictionary/entry/word[@handle-pl = 'wystawy']/@handle)" />
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'transparent'});
			MA.api.setNavBackground('.offset')
		});
	</script>
</xsl:template>

</xsl:stylesheet>