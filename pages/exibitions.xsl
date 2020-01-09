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

<xsl:template match="data">
	<section class="exhibitions">
		<nav class="big-nav">
			<h1 class="donthyphenate"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'wystawy']" />
<!-- 			<xsl:text> /</xsl:text>
			<a href="{//dictionary/entry/word[@handle-pl = 'archiwum-wystaw']/@handle}/"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'archiwum-wystaw']" /></a> -->
		</h1>
	</nav>
	<ul class="inline-list filters">
		<xsl:apply-templates select="//exhibitions-categories/entry[@wystawy > 0]" />
		<li class="show-all"><a href="javascript:void(0)"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'wszystkie']" /></a></li>
	</ul>
		<div class="bricks-container">
			<xsl:apply-templates select="exhibitions/entry" />
		</div>
	</section>
</xsl:template>

<xsl:template match="exhibitions-categories/entry">
	<li class="{exhib-category/@handle}"><a href="javascript:void(0)" data-filter="{exhib-category/@handle}"><xsl:value-of select="exhib-category" /></a><!--<a href="javascript:void(0)" class="clear-filter icons">X</a>--></li>
</xsl:template>

<xsl:template match="exhibitions/entry">
	<xsl:call-template name="brick" />
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(window).load(function() {
			MA.iS();
		});
	</script>
</xsl:template>

</xsl:stylesheet>