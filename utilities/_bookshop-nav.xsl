<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="bookshop-nav">
		<nav>
			<h1 class="donthyphenate">
				<!--
				<xsl:choose>
					<xsl:when test="$current-page = 'bookstore'">
						<a href="javascript:void(0)" class="active"><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></a>
					</xsl:when>
					<xsl:otherwise>
						<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}"><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></a>
					</xsl:otherwise>
				</xsl:choose>
				-->
				<xsl:apply-templates select="bookshop-nav/page[not(types/type='JSON')]" />
			</h1>
		</nav>
	</xsl:template>

	<xsl:template match="bookshop-nav/page">
		<xsl:choose>
			<xsl:when test="$current-page = item[@lang = 'en']/@handle">
				<a href="javascript:void(0)" class="active"><xsl:value-of select="item[@lang = //fl-languages/current-language/@handle]" /></a>
			</xsl:when>
			<xsl:otherwise>
				<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{item[@lang = //fl-languages/current-language/@handle]/@handle}/"><xsl:value-of select="item[@lang = //fl-languages/current-language/@handle]" /></a>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="following-sibling::page[2]">
			<xsl:text> /</xsl:text>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>