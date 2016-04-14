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
	<xsl:apply-templates select="bip/entry" />
</xsl:template>

<xsl:template match="bip/entry">
	<section class="biuletyn">
		<header>
			<img src="{$workspace}/images/bip_logo.png" />
			<h1><xsl:value-of select="title" /></h1>
			<ul class="inline-list">
				<li><a href="javascript:void(0)" class="active">Ważne dokumenty</a></li>
				<li><a href="javascript:void(0)" class="active">Struktura organizacyjna</a></li>
				<li><a href="javascript:void(0)" class="active">Przetargi</a></li>
				<!--
				<li><a href="{$root}/{$current-path}/{//dictionary/entry/word[@handle-pl = 'materialy-do-pobrania']/@handle}"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'materialy-do-pobrania']" /></a></li>
			-->
			</ul>
		</header>
		<article>
			<xsl:copy-of select="article/node()" />
		</article>
	</section>
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:value-of select="concat($root, '/', //current-language/@handle, '/')" />
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'white'});
		});
	</script>
</xsl:template>

</xsl:stylesheet>