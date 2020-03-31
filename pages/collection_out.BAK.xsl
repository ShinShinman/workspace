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

<xsl:strip-space elements="related-items" />

<xsl:template match="/data">
	<xsl:text>signature@authors@object-name@object-name-en@place@address@address-cyrilic@projec-content@projec-content-en@project-remarks@project-remarks-en@dates@material@material-en@technics@technics-en@dimensions@publish@images@related-items</xsl:text>

	<xsl:apply-templates select="collection/entry" />

<!-- 
	<xsl:apply-templates select="collection/entry[1]/*" mode="column-name" />
	<xsl:apply-templates select="collection/entry/*" />
 -->
</xsl:template>

<xsl:template match="collection/entry">
	<xsl:value-of select="signature" />@<xsl:value-of select="authors" />@<xsl:value-of select="object-name" />@<xsl:value-of select="object-name-en" />@<xsl:value-of select="place" />@<xsl:value-of select="address" />@<xsl:value-of select="address-cyrilic" />@<xsl:value-of select="projec-content" />@<xsl:value-of select="projec-content-en" />@<xsl:value-of select="project-remarks" />@<xsl:value-of select="project-remarks-en" />@<xsl:value-of select="dates" />@<xsl:value-of select="material" />@<xsl:value-of select="material-en" />@<xsl:value-of select="technics" />@<xsl:value-of select="technics-en" />@<xsl:value-of select="dimensions" />@<xsl:value-of select="publish" />@<xsl:value-of select="images" />@<xsl:value-of select="related-items" />
</xsl:template>

<xsl:template match="collection/entry/*" mode="column-name">
	<xsl:value-of select="name(.)" /><xsl:text>@</xsl:text>
</xsl:template>

<xsl:template match="collection/entry/*[position() = last()]" mode="column-name">
	<xsl:value-of select="name(.)" /><xsl:text>&#10;</xsl:text>
</xsl:template>

<xsl:template match="collection/entry/*">
	<xsl:value-of select="." /><xsl:text>@</xsl:text>
</xsl:template>

<xsl:template match="collection/entry/*[position() = last()]">
	<xsl:value-of select="." /><xsl:text>&#10;</xsl:text>
</xsl:template>

<xsl:template match="images" priority="1">
	<xsl:apply-templates select="file" />
</xsl:template>

<xsl:template match="images/file">
	<xsl:value-of select="concat(@path, '/', filename, ', ')" />
</xsl:template>

</xsl:stylesheet>
