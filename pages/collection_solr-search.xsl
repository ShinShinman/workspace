<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<xsl:apply-templates select="data/connection-solr/response" />
</xsl:template>

<xsl:template match="data/connection-solr/response">
	<xsl:text>{"numFound": </xsl:text><xsl:value-of select="numfound" /><xsl:text>,</xsl:text>
	<xsl:text>"start": </xsl:text><xsl:value-of select="start" /><xsl:text>,</xsl:text>
	<xsl:text>"docs": [</xsl:text><xsl:apply-templates select="docs/item" /><xsl:text>]}</xsl:text>
</xsl:template>

<xsl:template match="docs/item">
	<xsl:text>{</xsl:text>
	<xsl:apply-templates select="*" />
	<xsl:text>}</xsl:text>
	<xsl:if test="./following-sibling::*">
		<xsl:text>,</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="*">
	<xsl:choose>
		<xsl:when test="*">
			<xsl:text>"</xsl:text><xsl:value-of select="name()" /><xsl:text>": [</xsl:text><xsl:apply-templates select="*" mode="child" /><xsl:text>],</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>"</xsl:text><xsl:value-of select="name()" />
			<xsl:text>": "</xsl:text>
			<!-- <xsl:value-of select="." /> -->
			<xsl:call-template name="string-replace-all">
				<xsl:with-param name="text" select="." />
				<xsl:with-param name="replace"><xsl:text>&quot;</xsl:text></xsl:with-param>
				<xsl:with-param name="by"><xsl:text>\&quot;</xsl:text></xsl:with-param>
			</xsl:call-template>
			<xsl:text>"</xsl:text>
			<xsl:if test="./following-sibling::*">
				<xsl:text>,</xsl:text>
			</xsl:if>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="*" mode="child">
	<xsl:text>"</xsl:text>
		<!-- <xsl:value-of select="." /> -->
		<xsl:call-template name="string-replace-all">
			<xsl:with-param name="text" select="." />
			<xsl:with-param name="replace"><xsl:text>&quot;</xsl:text></xsl:with-param>
			<xsl:with-param name="by"><xsl:text>\&quot;</xsl:text></xsl:with-param>
		</xsl:call-template>
	<xsl:text>"</xsl:text>
	<xsl:if test="./following-sibling::*">
		<xsl:text>,</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template name="string-replace-all">
	<xsl:param name="text" />
	<xsl:param name="replace" />
	<xsl:param name="by" />
	<xsl:choose>
		<xsl:when test="$text = '' or $replace = ''or not($replace)">
			<!-- Prevent this routine from hanging -->
			<xsl:value-of select="$text" />
		</xsl:when>
		<xsl:when test="contains($text, $replace)">
			<xsl:value-of select="substring-before($text,$replace)" />
			<xsl:value-of select="$by" />
			<xsl:call-template name="string-replace-all">
				<xsl:with-param name="text" select="substring-after($text,$replace)" />
				<xsl:with-param name="replace" select="$replace" />
				<xsl:with-param name="by" select="$by" />
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$text" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
