<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="brick">

		<div class="brick grid-sizer">
			<h1><xsl:apply-templates select="badge" /><xsl:value-of select="tytul" /></h1>
			<h2><xsl:value-of select="podtytul" /></h2>
			<xsl:apply-templates select="./data" />
			<xsl:copy-of select="lead" />
			<img src="{$workspace}{okladka/@path}/{okladka/filename}" />
		</div>

	</xsl:template>

	<xsl:template match="entry/data">
		<div class="dashed">
			<svg>
				<path d="M0 0 H 300" />
				<path d="M0 30 H 300" />
			</svg>
			<xsl:apply-templates select="date[@type = 'exact']" />
			<xsl:apply-templates select="date[@type = 'range']" />
		</div>
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