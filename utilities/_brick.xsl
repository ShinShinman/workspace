<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="brick">
		<xsl:param name="lang" select="//fl-languages/current-language/@language" />

		<article class="brick">
			<a href="{$root}/{//current-language/@handle}/{//dictionary//word[@handle-pl = 'artykul']/@handle}/{title/@handle}">
				<h1><xsl:apply-templates select="badge" /><xsl:value-of select="title" /></h1>
				<xsl:apply-templates select="subtitle" />
				<xsl:apply-templates select="./date" />
				<xsl:copy-of select="lead" />
				<img src="{$workspace}{cover-image/@path}/{cover-image/filename}" />
			</a>
		</article>

	</xsl:template>

	<xsl:template match="entry/subtitle">
		<h2><xsl:value-of select="." /></h2>
	</xsl:template>

	<xsl:template match="entry/date">
		<div class="dashed">
			<svg>
				<path d="M0 0 H 300" />
				<path d="M0 30 H 300" />
			</svg>
			<xsl:copy-of select="./node()" />
			<!--<xsl:apply-templates select=".//black" />-->
			<!--
			<xsl:apply-templates select="date[@type = 'exact']" />
			<xsl:apply-templates select="date[@type = 'range']" />
		-->
		</div>
	</xsl:template>

	<xsl:template match="date//black">
		<span style="color: black"><xsl:value-of select="." /></span>
	</xsl:template>

	<xsl:template match="badge">
		<span class="badge"></span>
	</xsl:template>

	<xsl:template match="date[@type = 'exact']">
			<p class="date">
				<xsl:call-template name="format-date">
					<xsl:with-param name="date" select="start"/>
					<xsl:with-param name="format" select="'x.N.Y'"/>
				</xsl:call-template>
			</p>
	</xsl:template>

	<xsl:template match="date[@type = 'range']">
			<p class="date">
				<xsl:call-template name="format-date">
					<xsl:with-param name="date" select="start"/>
					<xsl:with-param name="format" select="'x.N.Y'"/>
				</xsl:call-template>
				—
				<xsl:call-template name="format-date">
					<xsl:with-param name="date" select="start"/>
					<xsl:with-param name="format" select="'x.N.Y'"/>
				</xsl:call-template>
			</p>
	</xsl:template>

</xsl:stylesheet>