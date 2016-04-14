<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="edu-brick">
		<xsl:param name="lang" select="//fl-languages/current-language/@language" />

		<article>
			<xsl:attribute name="class">
				<xsl:apply-templates select="category" />
			</xsl:attribute>
			<a href="{$root}/{title/@lang}/{//dictionary/entry/word[@handle-en = $root-page]}/{//dictionary//word[@handle-pl = 'lekcja']/@handle}/{title/@handle}">
				<h1 class="donthyphenate"><xsl:value-of select="title" /></h1>
				<!--<xsl:copy-of select="lead/node()" />-->
			</a>
		</article>

	</xsl:template>

	<xsl:template match="category">
		<xsl:text>brick</xsl:text>
		<xsl:apply-templates select="item/category" />
	</xsl:template>
	
	<xsl:template match="item/category">
		<xsl:text> </xsl:text><xsl:value-of select="@handle-pl" />
	</xsl:template>

	<xsl:template match="entry/date">
		<div class="dashed">
			<svg>
				<path d="M0 0 H 300" />
			</svg>
			<xsl:copy-of select="./node()" />
			<svg>
				<path d="M0 0 H 300" />
			</svg>
			<!--<xsl:apply-templates select=".//black" />-->
			<!--
			<xsl:apply-templates select="date[@type = 'exact']" />
			<xsl:apply-templates select="date[@type = 'range']" />
		-->
		</div>
	</xsl:template>

</xsl:stylesheet>