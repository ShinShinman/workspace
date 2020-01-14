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
<xsl:include href="../utilities/_image-header.xsl"/>

<xsl:template match="data">

	<xsl:call-template name="image-header">
		<xsl:with-param name="parent-node" select="ab-header-images" />
	</xsl:call-template>

<!-- 	<xsl:choose>
		<xsl:when test="ab-header-images/entry">
			<xsl:apply-templates select="ab-header-images/entry" />
		</xsl:when>
		<xsl:otherwise>
			<header class="offset" />
		</xsl:otherwise>
	</xsl:choose> -->
	
	<section class="archive-digitizing">
		<xsl:apply-templates select="ab-digitalizacja/entry" />
	</section>
</xsl:template>

<xsl:template match="ab-header-images/entry">
	<header class="offset" style="background-image: url({$root}/image/post-header{image/@path}/{image/filename}); height: {image/meta/@height}px" />
</xsl:template>

<xsl:template match="ab-digitalizacja/entry">
		<header>
			<h1><a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{//ab-nav/page[@handle = 'search']/item[@lang = //fl-languages/current-language/@handle]/@handle}/"><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></a></h1>
			<ul class="inline-list">
				<xsl:apply-templates select="//ab-nav/page" />
			</ul>
		</header>
		<article>
			<h1><xsl:value-of select="title/p" /></h1>
			<xsl:copy-of select="article/node()" />
		</article>
</xsl:template>

<xsl:template match="ab-nav/page">
	<li>
		<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{item[@lang = //fl-languages/current-language/@handle]/@handle}">
			<xsl:value-of select="item[@lang = //fl-languages/current-language/@handle]" />
		</a>
	</li>
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:value-of select="concat($root, '/', //current-language/@handle, '/')" />
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/{//plh-page/page/page/item[@lang != //current-language/@handle]/@handle}/" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/{//plh-page/page/page/item[@lang != //current-language/@handle]/@handle}/" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'transparent'});
			MA.api.setNavBackground('.offset');
		});
	</script>
</xsl:template>

</xsl:stylesheet>