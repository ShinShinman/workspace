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
	<xsl:apply-templates select="news" />
</xsl:template>

<xsl:template match="exhibition/entry">
	<header class="offset" style="background-image: url({$workspace}{main-image/@path}/{main-image/filename}); height: {main-image/meta/@height}px">
	</header>
	<section class="post">
		<header class="donthyphenate">
			<h1><xsl:value-of select="title" /></h1>
			<h2><xsl:value-of select="subtitle" /></h2>
			<h3 class="date"><xsl:value-of select="date" /></h3>
			<ul class="category-list">
				<xsl:apply-templates select="category/item" />
			</ul>
		</header>
		<article>
			<xsl:copy-of select="article/node()" />
			<!--<xsl:apply-templates select="article//*" />-->
		</article>
	</section>
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
			<xsl:apply-templates select="./entry[not(@id = //exhibition/entry/@id)]" />
		</div>
	</section>
</xsl:template>

<xsl:template match="news/entry">
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