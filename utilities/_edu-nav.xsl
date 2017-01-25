<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="edu-nav">
		<xsl:param name="lang" select="//current-language/@handle" />
		<li>
			<a href="{$root}/{$lang}/{//plh-page/page/item[@lang = $lang]/@handle}/{item[@lang = $lang]/@handle}/">
				<xsl:value-of select="item[@lang = $lang]" />
			</a>
		</li>
	</xsl:template>

</xsl:stylesheet>
