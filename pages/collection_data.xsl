<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  >

<xsl:output 
	method="text" 
	indent="yes"
	omit-xml-declaration="yes" 
/>

<xsl:template match="/data">
	<xsl:choose>
		<xsl:when test="$format = 'csv'">
			<xsl:call-template name="csv" />
		</xsl:when>
		<xsl:when test="$format = 'json'">
			<xsl:call-template name="json" />
		</xsl:when>
		<xsl:when test="$format = 'xml'">
			<xsl:call-template name="xml" />
		</xsl:when>
		<xsl:otherwise>
			xml
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="xml">
	
	<xsl:apply-templates select="collection-data/entry" mode="xml" />
</xsl:template>

<xsl:template match="collection-data/entry/*" mode="xml" >
	<!-- <xsl:element name="{name()}"/> -->
	<!-- <xsl:value-of select="signature" /> -->
	<xsl:element name="{name()}">
	</xsl:element>
</xsl:template>

<xsl:template name="csv">
	<xsl:text>sygnatura@sygnatura_slug@autorzy@nazwa_obiektu_pl@nazwa_obiektu_en@miejscowosc@adres@adres_cyrylica@zawartosc_projektu_pl@zawartosc_projektu_en@uwagi_pl@uwagi_en@datowanie@tworzywo@tworzywo_en@technika@technika_en@wymiary@obrazy@powiazane_obiekty@publikuj&#xa;</xsl:text>
	<xsl:apply-templates select="collection-data/entry" mode="csv" />
</xsl:template>

<xsl:template match="collection-data/entry" mode="csv" >
	<xsl:value-of select="signature" />@<xsl:value-of select="signature/@handle" />@<xsl:value-of select="authors" />@<xsl:value-of select="object-name/item[@lang='pl']" />@<xsl:value-of select="object-name/item[@lang='en']" />@<xsl:value-of select="place" />@<xsl:value-of select="address" />@<xsl:value-of select="address-cyrillic" />@<xsl:value-of select="projec-content/item[@lang='pl']" />@<xsl:value-of select="projec-content/item[@lang='en']" />@<xsl:value-of select="project-remarks/item[@lang='pl']" />@<xsl:value-of select="project-remarks/item[@lang='en']" />@<xsl:value-of select="dates" />@<xsl:value-of select="material" />@<xsl:value-of select="material-en" />@<xsl:value-of select="technics" />@<xsl:value-of select="technics-en" />@<xsl:value-of select="dimensions" />@<xsl:apply-templates select="images/file" />@<xsl:value-of select="related-items/@handle" />@<xsl:value-of select="publish" /><xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="images/file">
	<xsl:value-of select="filename" /><xsl:text>,</xsl:text>
</xsl:template>

<xsl:template match="images/file[position() = last()]">
	<xsl:value-of select="filename" />
</xsl:template>

<xsl:template name="json">
	[
	<xsl:apply-templates select="collection-data/entry" mode="json" />
	]
</xsl:template>

<xsl:template match="collection-data/entry" mode="json">
	{
		"sygnatura": "<xsl:value-of select="signature" />",
		"autorzy": "<xsl:value-of select="authors" />",
		"nazwa_obiektu_en": "<xsl:value-of select="object-name-en" />",
		"nazwa_obiektu_pl": "<xsl:value-of select="object-name" />",
		"miejscowość": "<xsl:value-of select="place" />",
		"adres": "<xsl:value-of select="address" />",
		"adres_cyrylica": "<xsl:value-of select="address-cyrilic" />",
		"zawartość_projektu_en": "<xsl:value-of select="projec-content-en" />",
		"zawartość_projektu_pl": "<xsl:value-of select="projec-content" />",
		"uwagi_en": "<xsl:value-of select="project-remarks-en" />",
		"uwagi_pl": "<xsl:value-of select="project-remarks" />",
		"datowanie": "<xsl:value-of select="dates" />",
		"tworzywo": "<xsl:value-of select="material" />",
		"tworzywo_en": "<xsl:value-of select="material-en" />",
		"technika": "<xsl:value-of select="technics" />",
		"technika_en": "<xsl:value-of select="technics-en" />",
		"wymiary": "<xsl:value-of select="dimensions" />",
		"publikuj": "<xsl:value-of select="publish" />",
		"obrazy": [
			<xsl:apply-templates select="images/file" mode="json" />
		],
		"powiazane_obiekty": "<xsl:value-of select="related-items" />",
		"tiff": "<xsl:value-of select="tiff" />",
	},
</xsl:template>

<xsl:template match="images/file" mode="json">
	{
		"filename": "<xsl:value-of select="filename" />",
		"path": "<xsl:value-of select="@path" />",
		"width": "<xsl:value-of select="meta/@width" />",
		"height": "<xsl:value-of select="meta/@height" />",
	}
</xsl:template>



<!-- Nie udany JSON -->
<!-- We wpisach pojawia się cudzysłów i rozwala JSON -->
<!--
<xsl:template match="data">
[
<xsl:apply-templates select="collection-data/entry" />
]
</xsl:template>

<xsl:template match="collection-data/entry">
	{
	<xsl:apply-templates select="*[not(name() = 'images')][not(name() = 'publish')]" />
	<xsl:apply-templates select="images" />
	}<xsl:if test="not(position() = last())"><xsl:text>,</xsl:text></xsl:if>
</xsl:template>

<xsl:template match="collection-data/entry/*">
		"<xsl:value-of select="name(.)" />": "<xsl:value-of select="." />"<xsl:text>,&#xA;</xsl:text>
</xsl:template>

<xsl:template match="collection-data/entry/images">
		"<xsl:value-of select="name(.)" />": [
		<xsl:apply-templates select="file" />
		]
</xsl:template>

<xsl:template match="images/file">
				{
					"filename": "<xsl:value-of select="filename" />",
					"path": "<xsl:value-of select="@path" />",
					"size": "<xsl:value-of select="@size" />",
					"width": "<xsl:value-of select="meta/@width" />",
					"height": "<xsl:value-of select="meta/@height" />"
				},
</xsl:template>

<xsl:template match="images/file[position() = last()]" priority="1">
				{
					"filename": "<xsl:value-of select="filename" />",
					"path": "<xsl:value-of select="@path" />",
					"size": "<xsl:value-of select="@size" />",
					"width": "<xsl:value-of select="meta/@width" />",
					"height": "<xsl:value-of select="meta/@height" />"
				}
</xsl:template>
-->

</xsl:stylesheet>
