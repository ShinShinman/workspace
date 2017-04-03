<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="fc-link">
		<xsl:param name="prize" />

		<xsl:variable name="tmp-prize">
			<xsl:value-of select="substring-before($prize, ' ')" />
			<xsl:choose>
				<xsl:when test="string-length(substring-before($prize, ' ')) &lt; 3">
					<xsl:text>,00</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<script>
			console.log('<xsl:value-of select="$tmp-prize" />');
		</script>
<!--
		<script>
			console.log('<xsl:value-of select="title/p" />: <xsl:value-of select="$prize" /> (<xsl:value-of select="substring-before($prize, ' ')" />)');
		</script>
-->
		<xsl:variable name="currency">
			<xsl:choose>
				<xsl:when test="//current-language/@handle = 'pl'">
					<xsl:text>pln&amp;code=985&amp;locale=pl_PL</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>eur&amp;code=978&amp;locale=en_PL</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="template-set">
			<xsl:choose>
				<xsl:when test="//current-language/@handle = 'pl'">
					<xsl:text>&amp;template_set=DEFAULT</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>&amp;template_set=en</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="fc-prize">
			<xsl:value-of select="substring-before($tmp-prize, ',')" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring-after($tmp-prize, ',')" />
			<xsl:value-of select="$currency" />
		</xsl:variable>

		<a href="https://ma.foxycart.com/cart?name={title/p}&amp;price={$fc-prize}&amp;{$template-set}" class="button"><xsl:value-of select="prize" /><span class="basket-icon" style="background-image: url({$root}/workspace/images/koszyk.svg)"/></a>
	</xsl:template>

</xsl:stylesheet>