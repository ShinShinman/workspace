<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="collections-brick">
		<xsl:param name="lang" select="//fl-languages/current-language/@language" />

		<article class="brick">
			<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{//plh-page/page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{title/@handle}/">
				<h1 class="donthyphenate"><xsl:value-of select="title" /></h1>
				<xsl:apply-templates select="subtitle" />
				<xsl:copy-of select="lead/node()" />
				<xsl:apply-templates select="cover-image" />
			</a>
		</article>

	</xsl:template>

	<xsl:template match="entry/subtitle">
		<h2><xsl:value-of select="." /></h2>
	</xsl:template>

	<xsl:template match="cover-image">
		<img src="{$root}/image/post-thumbnail{@path}/{filename}" />
	</xsl:template>

</xsl:stylesheet>