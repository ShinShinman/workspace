<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="lang-button">
		<xsl:param name="lang" />
		<xsl:choose>
			<xsl:when test="$lang = 'pl'">
				<a href="{$root}/{//supported-languages/item[@handle != $lang]/@handle}/{//plh-page/page/item[@lang != $lang]/@handle}/" class="icon">E</a>
			</xsl:when>
			<xsl:otherwise>
				<a href="{$root}/{//supported-languages/item[@handle != $lang]/@handle}/{//plh-page/page/item[@lang != $lang]/@handle}/" class="icon">P</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>