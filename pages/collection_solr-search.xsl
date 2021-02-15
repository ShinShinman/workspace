<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/_string-replace-all.xsl"/>

<xsl:output method="text"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<xsl:apply-templates select="data/collection-solr-search/response/result" />
</xsl:template>

<xsl:template match="data/collection-solr-search/response/result">
	<xsl:text>{"numFound": </xsl:text><xsl:value-of select="@numFound" /><xsl:text>,</xsl:text>
	<xsl:text>"start": </xsl:text><xsl:value-of select="@start" /><xsl:text>,</xsl:text>
	<xsl:text>"docs": [</xsl:text><xsl:apply-templates select="doc" /><xsl:text>]}</xsl:text>
</xsl:template>

<xsl:template match="doc">
	<xsl:text>{</xsl:text>
	<xsl:apply-templates select="*" />
	<xsl:text>}</xsl:text>
	<xsl:if test="./following-sibling::*">
		<xsl:text>,</xsl:text>
	</xsl:if>
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
			<xsl:text>"</xsl:text><xsl:value-of select="@name" /><xsl:text>": [</xsl:text><xsl:apply-templates select="*" mode="child" /><xsl:text>],</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>"</xsl:text><xsl:value-of select="@name" />
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

</xsl:stylesheet>
