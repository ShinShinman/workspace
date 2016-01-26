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
<xsl:include href="../utilities/_highlight.xsl" />

<xsl:template match="data">

	<xsl:apply-templates select="highlight/entry" />

	<xsl:apply-templates select="info-banner/entry" />	

	<section class="news">
		<h1 id="aktualnosci"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'aktualnosci']" /></h1>
		<div class="bricks-container">
			<xsl:apply-templates select="news/entry/linked-articles/item" />
		</div>
	</section>

</xsl:template>

<xsl:template match="highlight/entry">
	<xsl:call-template name="highlight" />
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

<xsl:template match="info-banner/entry">
	<section class="info-banner">
		<xsl:copy-of select="msg/node()" />
	</section>
</xsl:template>

<xsl:template match="data" mode="js">
	<xsl:apply-templates select="highlight/entry" mode="js" />
</xsl:template>

</xsl:stylesheet>