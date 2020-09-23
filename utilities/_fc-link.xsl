<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="fc-link">
		<xsl:param name="prize" />
		<xsl:param name="weight" />
		<xsl:param name="category" />
		<xsl:param name="product-code" />

		<script>
			console.log('<xsl:value-of select="$category" />');
		</script>

		<xsl:variable name="tmp-prize">
			<xsl:choose>
				<xsl:when test="substring-before($prize, ' ') != ''">
					<xsl:value-of select="substring-before($prize, ' ')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$prize" />
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="substring-before($prize, ',') = ''">
					<xsl:text>,00</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

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

		<xsl:variable name="fc-prize">
			<xsl:value-of select="substring-before($tmp-prize, ',')" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring-after($tmp-prize, ',')" />
			<xsl:value-of select="$currency" />
		</xsl:variable>

		<xsl:variable name="fc-weight">
			<xsl:choose>
				<xsl:when test="$weight">
					<xsl:value-of select="$weight" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>1</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="template-set">
			<xsl:choose>
				<xsl:when test="//current-language/@handle = 'pl'">
					<xsl:text>template_set=DEFAULT</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>template_set=en</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="eBook-template-set">
			<xsl:choose>
				<xsl:when test="//current-language/@handle = 'pl'">
					<xsl:text>&amp;template_set=eBook-pl</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>&amp;template_set=eBook-en</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$category='ebooki' or $category='ebooks'">
				<a href="https://ma.foxycart.com/cart?name={title/p}&amp;price={$fc-prize}&amp;category=eBook&amp;code={$product-code}&amp;{$eBook-template-set}" class="button"><xsl:value-of select="prize" /><span class="basket-icon" style="background-image: url({$root}/workspace/images/koszyk.svg)"/></a>
			</xsl:when>
			<xsl:otherwise>
				<a href="https://ma.foxycart.com/cart?name={title/p}&amp;price={$fc-prize}&amp;weight={$fc-weight}&amp;{$template-set}" class="button"><xsl:value-of select="prize" /><span class="basket-icon" style="background-image: url({$root}/workspace/images/koszyk.svg)"/></a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
