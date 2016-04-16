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
	<xsl:apply-templates select="edu-one-aid/entry" />
	<xsl:apply-templates select="edu-aid" />
</xsl:template>

<xsl:template match="edu-one-aid/entry">
	<section class="single-aid">
		<header class="donthyphenate">
			<h1><xsl:value-of select="title" /></h1>
			<p class="edu-categories"><span class="{category/item/category/@handle}"><xsl:value-of select="category/item/category" /></span></p>
		</header>
		<article>
			<xsl:copy-of select="article/node()" />
			<ul>
				<xsl:apply-templates select="files" />
			</ul>
		</article>
	</section>
</xsl:template>

<xsl:template match="files">
	<h2>Pliki do pobrania</h2>
	<xsl:apply-templates select="./file" />
</xsl:template>

<xsl:template match="files/file">
	<li><a href="{$workspace}/{@path}/{filename}" target="_blank"><xsl:value-of select="filename" /></a></li>
</xsl:template>

<xsl:template match="edu-aid">
	<section class="edu-items">
		<header>
			<h1><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'materialy-do-pobrania']" /></h1>
			<ul class="edu-categories">
				<li class="label"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'filtry']" />:</li>
				<xsl:apply-templates select="//edu-aid-categories/entry" />
			</ul>
		</header>
		<div class="bricks-container">
			<xsl:apply-templates select="./entry[not(@id = //edu-one-aid/entry/@id)]" />
		</div>
	</section>
</xsl:template>

<xsl:template match="edu-aid-categories/entry">
	<li class="{category/@handle}"><a href="javascript:void(0)" data-filter="{category/@handle}"><xsl:value-of select="category" /></a><a href="javascript:void(0)" class="clear-filter icons">X</a></li>
</xsl:template>

<xsl:template match="edu-aid/entry">
	<xsl:call-template name="edu-brick" />
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', //dictionary/entry/word[@handle-en = $root-page], '/materialy-do-pobrania/')" />
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'white'});
		});
	</script>
</xsl:template>

</xsl:stylesheet>
