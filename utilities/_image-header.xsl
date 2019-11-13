<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="image-header">
		<xsl:param name="parent-node" />
		<xsl:choose>
			<xsl:when test="$parent-node/entry">
				<xsl:apply-templates select="$parent-node/entry" />
			</xsl:when>
			<xsl:otherwise>
				<header class="offset" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="entry">
		<header class="offset" style="background-image: url({$root}/image/post-header{image/@path}/{image/filename}); height: {image/meta/@height}px" />
	</xsl:template>

</xsl:stylesheet>