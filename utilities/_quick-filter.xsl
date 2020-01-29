<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="quick-filter">
		<xsl:variable name="placeholder">
			<xsl:choose>
				<xsl:when test="//current-language/@handle = 'pl'">
					<xsl:text>Szybkie wyszukiwanie</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Quick search</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<form class="quick-filter" action="javascript:void(0);">
			<input type="search" placeholder="{$placeholder}" />
			<input type="reset" value="×" alt="clear" />
		</form>
	
	</xsl:template>

</xsl:stylesheet>
