<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="archive-brick">
		<xsl:param name="lang" select="//fl-languages/current-language/@language" />

		<article class="brick {category/item/exhib-category/@handle}">
			<a href="{$root}{$current-path}/{title/@handle}">
				<h1 class="donthyphenate"><xsl:apply-templates select="badge" /><xsl:value-of select="title" /></h1>
				<!--<xsl:apply-templates select="subtitle" />-->
				<!--<xsl:apply-templates select="./category/item" mode="brick" />-->
				<xsl:apply-templates select="./date" />
				<!--<xsl:copy-of select="lead/node()" />-->
				<xsl:choose>
					<xsl:when test="cover-image">
						<xsl:apply-templates select="cover-image" />
					</xsl:when>
					<xsl:otherwise>
						<img src="{$root}/image/post-thumbnail/images/archive/archive.jpg" />
					</xsl:otherwise>
				</xsl:choose>
			</a>
		</article>

	</xsl:template>

	<xsl:template match="entry/subtitle">
		<h2><xsl:value-of select="." /></h2>
	</xsl:template>

	<xsl:template match="category/item" mode="brick">
		<p class="category"><xsl:value-of select="exhib-category" /><xsl:value-of select="event-category" /></p>
	</xsl:template>

	<xsl:template match="entry/date">
		<div class="dashed">
			<svg>
				<path d="M0 0 H 300" />
			</svg>
			<xsl:apply-templates select="date[@type = 'exact']" />
			<xsl:apply-templates select="date[@type = 'range']" />
			<svg>
				<path d="M0 0 H 300" />
			</svg>
			<!--<xsl:apply-templates select=".//black" />-->
		</div>
	</xsl:template>

	<xsl:template match="badge">
		<!-- wprowadzić rozróżnienie na różne szarfy -->
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
				<xsl:text>–</xsl:text>
				<xsl:call-template name="format-date">
					<xsl:with-param name="date" select="start"/>
					<xsl:with-param name="format" select="'x.N.Y'"/>
				</xsl:call-template>
			</p>
	</xsl:template>

	<xsl:template match="cover-image">
		<img src="{$root}/image/post-thumbnail{@path}/{filename}" />
	</xsl:template>

</xsl:stylesheet>