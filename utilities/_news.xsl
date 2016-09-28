<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="news">
		<section class="news">
			<h1 id="aktualnosci"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'aktualnosci']" /></h1>
			<div class="bricks-container">
				<xsl:apply-templates select="news/entry/linked-articles/item" />
			</div>
		</section>
	</xsl:template>

	<xsl:template match="news/entry/linked-articles/item[@section-handle = 'wystawy']">
		<xsl:variable name="id"><xsl:value-of select="./@id" /></xsl:variable>
		<xsl:apply-templates select="//news-exhibitions/entry[@id = $id]" />
	</xsl:template>

	<xsl:template match="news/entry/linked-articles/item[@section-handle = 'events']">
		<xsl:variable name="id"><xsl:value-of select="./@id" /></xsl:variable>
		<xsl:apply-templates select="//news-events/entry[@id = $id]" />
	</xsl:template>

	<xsl:template match="news/entry/linked-articles/item[@section-handle = 'edu-workshops']">
		<xsl:variable name="id"><xsl:value-of select="./@id" /></xsl:variable>
		<xsl:apply-templates select="//edu-workshops/entry[@id = $id]" />
	</xsl:template>

	<xsl:template match="news/entry/linked-articles/item[@section-handle = 'edu-lectures']">
		<xsl:variable name="id"><xsl:value-of select="./@id" /></xsl:variable>
		<xsl:apply-templates select="//edu-lectures/entry[@id = $id]" />
	</xsl:template>

	<xsl:template match="news-exhibitions/entry">
		<xsl:call-template name="brick" />
	</xsl:template>

	<xsl:template match="news-events/entry">
		<xsl:call-template name="brick" />
	</xsl:template>

	<xsl:template match="edu-workshops/entry">
		<xsl:call-template name="edu-brick" />
	</xsl:template>

	<xsl:template match="edu-lectures/entry">
		<xsl:call-template name="edu-brick" />
	</xsl:template>

</xsl:stylesheet>