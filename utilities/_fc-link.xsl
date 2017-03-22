<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="fc-link">
		<xsl:param name="prize" />
		<xsl:variable name="tmp-prize" select="substring($prize, 1, 5)" />

		<xsl:variable name="currency">
			<xsl:choose>
				<xsl:when test="//current-language/@handle = 'pl'">
					<xsl:text>pln&amp;code=985&amp;locale=pl_PL</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>eur&amp;code=978&amp;locale=de_DE</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="fc-prize">
			<xsl:value-of select="substring-before($tmp-prize, ',')" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring-after($tmp-prize, ',')" />
			<xsl:value-of select="$currency" />
		</xsl:variable>

		<a href="https://ma.foxycart.com/cart?name={title/p}&amp;price={$fc-prize}" class="button"><xsl:value-of select="prize" /><span class="basket-icon" style="background-image: url({$root}/workspace/images/koszyk.svg)"/></a>
	</xsl:template>

</xsl:stylesheet>