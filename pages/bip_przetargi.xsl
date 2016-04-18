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
	<section class="tenders">
		<header>
			<img src="{$workspace}/images/bip_logo.png" />
			<h1>Biuletyn Informacji Publicznej</h1>
			<ul class="inline-list">
				<xsl:apply-templates select="//bip-nav/page" />
			</ul>
		</header>
		<article>
			<h1>Aktualne przetargi</h1>
		</article>
		<xsl:apply-templates select="bip-tenders/entry" />
	</section>
</xsl:template>

<xsl:template match="bip-nav/page">
	<xsl:choose>
		<xsl:when test="@handle = $current-page">
			<li><a href="javascript:void(0)" class="active"><xsl:value-of select="name" /></a></li>
		</xsl:when>
		<xsl:otherwise>
			<li><a href="{$root}/{//fl-languages/current-language/@handle}/bip/{@handle}"><xsl:value-of select="name" /></a></li>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="bip-tenders/entry">
		<article>
			<h2 class="donthyphenate"><xsl:value-of select="title" /></h2>
			<xsl:copy-of select="lead/node()" />
			<xsl:apply-templates select="documents" />
		</article>
</xsl:template>

<xsl:template match="documents">
	<h3>Dokumenty do pobrania</h3>
	<ul>
		<xsl:apply-templates select="file" />
	</ul>
</xsl:template>

<xsl:template match="documents/file">
	<li><a href="{$workspace}/bip/{filename}"><xsl:value-of select="filename" /></a></li>
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