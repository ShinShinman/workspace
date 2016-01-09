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
	<section class="{exhibitions/section/@handle}">
		<h1><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'wystawy']" /></h1>
		<div class="bricks-container">
			<xsl:apply-templates select="exhibitions/entry" />

			<!-- Skasować! -->
			<xsl:apply-templates select="exhibitions/entry" />
		</div>
	</section>

<!--
	<xsl:choose>
		<xsl:when test="$title">
			<xsl:call-template name="single-view" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="exhibitions" />
		</xsl:otherwise>
	</xsl:choose>
-->
</xsl:template>

<xsl:template name="exhibitions">
	<section class="{exhibitions/section/@handle}">
		<h1><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'wystawy']" /></h1>
		<div class="bricks-container">
			<xsl:apply-templates select="exhibitions/entry" />

			<!-- Skasować! -->
			<xsl:apply-templates select="exhibitions/entry" />
		</div>
	</section>
</xsl:template>

<xsl:template match="exhibitions/entry">
	<xsl:call-template name="brick" />
</xsl:template>

<xsl:template name="single-view">
	<xsl:apply-templates select="exhibition/entry" />
</xsl:template>

<xsl:template match="exhibition/entry">
	<header style="background-image: url({$workspace}{main-image/@path}/{main-image/filename}); height: {main-image/meta/@height}px">
	</header>
	<section>
		<h1><xsl:value-of select="title" /></h1>
		<h2><xsl:value-of select="subtitle" /></h2>
	</section>
</xsl:template>

</xsl:stylesheet>