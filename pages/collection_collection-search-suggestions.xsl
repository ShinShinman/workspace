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
<!--
<xsl:call-template name="string-replace-all">
	<xsl:with-param name="text"><xsl:text>"shin"</xsl:text></xsl:with-param>
	<xsl:with-param name="replace"><xsl:text>&quot;</xsl:text></xsl:with-param>
	<xsl:with-param name="by"><xsl:text>\&quot;</xsl:text></xsl:with-param>
</xsl:call-template> -->

<!-- <xsl:text>{"data": [{"id": "5","architekt": "Bendl Marjan"},{"id": "31","architekt": "Kaszczuk \"Stanisław\" Marcin"}]}</xsl:text> -->
<xsl:text>{</xsl:text>"authors": [<xsl:apply-templates select="data/connection-authors/item" /><xsl:text>],</xsl:text>"signatures": [<xsl:apply-templates select="data/connection-signatures/item" />]}
</xsl:template>

<xsl:template match="item"><xsl:text>{</xsl:text><xsl:apply-templates select="./*" /><xsl:text>},</xsl:text>
</xsl:template>

<xsl:template match="item[position()=last()]">
	<xsl:text>{</xsl:text><xsl:apply-templates select="./*" /><xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="item/*">
	<xsl:variable name="newtext">
    <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="." />
        <xsl:with-param name="replace"><xsl:text>&quot;</xsl:text></xsl:with-param>
        <xsl:with-param name="by"><xsl:text>\&quot;</xsl:text></xsl:with-param>
    </xsl:call-template>
</xsl:variable>
	<xsl:text>"</xsl:text><xsl:value-of select="name()" />": "<xsl:value-of select="$newtext" />",<xsl:text />
</xsl:template>

<xsl:template match="item/*[position()=last()]">
	<xsl:variable name="newtext">
    <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="." />
        <xsl:with-param name="replace"><xsl:text>&quot;</xsl:text></xsl:with-param>
        <xsl:with-param name="by"><xsl:text>\&quot;</xsl:text></xsl:with-param>
    </xsl:call-template>
</xsl:variable>
	<xsl:text>"</xsl:text><xsl:value-of select="name()" />": "<xsl:value-of select="$newtext" />"<xsl:text />
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

<!-- <xsl:template match="text()" /> -->

</xsl:stylesheet>
