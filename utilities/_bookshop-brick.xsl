<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!--<xsl:include href="_fc-link.xsl" />-->

	<xsl:template name="bookshop-brick">
		<xsl:param name="lang" select="//fl-languages/current-language/@language" />

		<article class="book brick {category/item/bookshop-category/@handle}">
			<a href="{$root}/{//current-language/@handle}/{//plh-page/page/item[@lang = //current-language/@handle]/@handle}/{//plh-page/page/page/item[@lang = //current-language/@handle]/@handle}/{title/@handle}">
				<div class="bookshop-brick-header">
					<h1 class="donthyphenate">
						<!--<xsl:apply-templates select="badge" />-->
						<xsl:value-of select="title/p" />
					</h1>
					<xsl:apply-templates select="subtitle" />
					<xsl:copy-of select="author/node()" />
					<!--<xsl:apply-templates select="./category/item" mode="brick" />-->
					<!--<xsl:apply-templates select="./date" />-->
					<!--<xsl:copy-of select="lead/node()" />-->
				</div>
				<div class="bookshop-brick-img">
					<xsl:apply-templates select="cover-image" />
				</div>
			</a>

			<xsl:choose>
				<xsl:when test="out-of-stock = 'Yes'">
					<div class="button disabled">
						<p><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'naklad-wyczerpany']" /></p>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="fc-link">
						<xsl:with-param name="prize" select="prize" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</article>

	</xsl:template>

	<xsl:template match="entry/subtitle">
		<h2><xsl:value-of select="p" /></h2>
	</xsl:template>

	<xsl:template match="cover-image">
		<img class="lazy" data-original="{$root}/image/bookstore-thumbnail{@path}/{filename}" width="320" height="340" alt="{../title}" />
	</xsl:template>

	<xsl:template match="category/item" mode="brick">
		<p class="category"><xsl:value-of select="exhib-category" /><xsl:value-of select="event-category" /></p>
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
				—
				<xsl:call-template name="format-date">
					<xsl:with-param name="date" select="start"/>
					<xsl:with-param name="format" select="'x.N.Y'"/>
				</xsl:call-template>
			</p>
	</xsl:template>

</xsl:stylesheet>