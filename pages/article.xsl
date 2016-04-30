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

<!--<xsl:include href="../utilities/master.xsl"/>-->
<xsl:import href="../utilities/master.xsl" />
<xsl:include href="../utilities/_news.xsl"/>

<xsl:template match="data">
	<xsl:apply-templates select="exhibition/entry" />
	<xsl:apply-templates select="event/entry" />
	<xsl:call-template name="news" />
</xsl:template>

<xsl:template match="exhibition/entry">
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
			<h3 class="date"><xsl:copy-of select="date/p/node()" /></h3>
			
			<xsl:apply-templates select="tags" />
			<!--
			<ul class="tag-list">
				<li class="label">Tagi:</li>
				<li class="tag"><a href="javascript:void(0)">#madeInEurope</a></li>
				<li class="tag"><a href="javascript:void(0)">#meisVanDerRohe</a></li>
				<li class="tag"><a href="javascript:void(0)">#architekturaWspółczesna</a></li>
			</ul>
			-->

			<xsl:apply-templates select="linked-event" />

		</header>
		<article>
			
			<xsl:choose>
				<xsl:when test="//exhibition/entry/category/item/@handle = 'one-project-gallery'">
					<xsl:copy-of select="//exhibitions-gjp/entry/article/node()" />
				</xsl:when>
			</xsl:choose>

			<xsl:copy-of select="./article/node()" />
			<!--<xsl:apply-templates select="article//*" />-->
		</article>
	</section>
</xsl:template>

<xsl:template match="event/entry">
	<xsl:choose>
		<xsl:when test="main-image">
			<header class="offset" style="background-image: url({$workspace}{main-image/@path}/{main-image/filename}); height: {main-image/meta/@height}px" />
		</xsl:when>
		<xsl:otherwise>
			<header class="offset" />
		</xsl:otherwise>
	</xsl:choose>
	<section class="post">
		<header class="donthyphenate">
			<ul class="category-list">
				<li><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'wydarzenia']" /></li>
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
	<li class="event"><a href="{$root}/{title/@lang}/{//dictionary//word[@handle-pl = 'artykul']/@handle}/{title/@handle}"><xsl:value-of select="title" /></a></li>
</xsl:template>

<xsl:template match="article//*">
	<xsl:element name="{name()}">
		<xsl:apply-templates select="* | @* | text()" />
	</xsl:element>
</xsl:template>

<xsl:template match="category/item">
	<li><a href="#"><xsl:value-of select="exhib-category" /></a></li>
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:choose>
		<xsl:when test="//exhibition/entry">
			<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', //dictionary/entry/word[@handle-pl = 'wystawy']/@handle)" />
		</xsl:when>
	<xsl:otherwise>
		<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', //dictionary/entry/word[@handle-pl = 'wydarzenia']/@handle)" />
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'transparent'});
			MA.api.setNavBackground('.offset')
		});
	</script>
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/en/article/{//exhibition/entry/title/@handle-en}{//event/entry/title/@handle-en}" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/pl/artykul/{//exhibition/entry/title/@handle-pl}{//event/entry/title/@handle-pl}" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>