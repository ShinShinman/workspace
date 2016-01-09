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
</xsl:template>

<xsl:template match="exhibition/entry">
	<header style="background-image: url({$workspace}{main-image/@path}/{main-image/filename}); height: {main-image/meta/@height}px">
	</header>
	<section>
		<header class="donthyphenate">
			<h1><xsl:value-of select="title" /></h1>
			<h2><xsl:value-of select="subtitle" /></h2>
			<h3 class="date"><xsl:value-of select="date" /></h3>
			<ul class="category-list">
				<xsl:apply-templates select="category/item" />
			</ul>
		</header>
		<article>
			<xsl:copy-of select="article" />
		</article>
	</section>
</xsl:template>

<xsl:template match="category/item">
	<li><a href="#"><xsl:value-of select="." /></a></li>
	<li><a href="#"><xsl:value-of select="." /></a></li>
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'transparent'});
		});
	</script>
</xsl:template>

</xsl:stylesheet>