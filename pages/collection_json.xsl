<?xml version="1.0" encoding="UTF-8"?>
<!-- <xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:json="http://json.org/"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
	>

<xsl:output method="text"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" /> -->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

<xsl:output 
	method="text"
	indent="no"
/>

<xsl:strip-space elements="*" />

<xsl:template match="text()">
	<xsl:value-of select='normalize-space()'/>
</xsl:template>

<!-- <xsl:strip-space elements="collection signature images publish *" /> -->

<xsl:template match="data">
	{
		"section": "<xsl:value-of select='collection/section' />",
		"data": [
			<xsl:apply-templates select="collection/entry" />
		]
	}
</xsl:template>

<xsl:template match="collection/entry">
		{	<xsl:apply-templates select="*[not(name() = 'images')][position() &lt; last()]" />
			<xsl:apply-templates select="images" />
			<xsl:apply-templates select="*[position() = last()]" />
		}<xsl:if test="count(./following-sibling::entry) &gt; 0">,</xsl:if>
</xsl:template>

<xsl:template match="collection/entry/*">
			"<xsl:value-of select='name(.)' />": "<xsl:value-of select='.' />",
</xsl:template>

<xsl:template match="collection/entry/*[position() = last()]">
			"<xsl:value-of select='name(.)' />": "<xsl:value-of select='.' />"
</xsl:template>

<xsl:template match="collection/entry/images">
			"images": [	<xsl:apply-templates select="file" />
			],
</xsl:template>

<xsl:template match="images/file">
				{
					"filename": "<xsl:value-of select="filename" />",
					"path": "<xsl:value-of select="@path" />",
					"size": "<xsl:value-of select="@size" />",
					"width": "<xsl:value-of select="meta/@width" />",
					"height": "<xsl:value-of select="meta/@height" />"},
</xsl:template>

<xsl:template match="images/file[position() = last()]">
				{
					"filename": "<xsl:value-of select="filename" />",
					"path": "<xsl:value-of select="@path" />",
					"size": "<xsl:value-of select="@size" />",
					"width": "<xsl:value-of select="meta/@width" />",
					"height": "<xsl:value-of select="meta/@height" />"}
</xsl:template>

<!-- <xsl:template match="*/text()[normalize-space()]">
    <xsl:value-of select="normalize-space()"/>
</xsl:template>

<xsl:template match="*/text()[not(normalize-space())]" /> -->

</xsl:stylesheet>
