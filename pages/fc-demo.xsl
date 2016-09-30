<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#x00A0;">
	<!ENTITY copy   "&#169;">
	<!ENTITY ndash "&#8211;">
	<!ENTITY thinsp "&#8201;">
	<!ENTITY amp "&#038;">
	<!ENTITY hellip "&#8230;">
	<!ENTITY bull "&#8226;">
	<!ENTITY lsaqua "&#8249;">
	<!ENTITY rsaqua "&#8250;">
	<!ENTITY larr "&#8592;">
	<!ENTITY rarr "&#8594;">
	<!ENTITY lsaquo "&#8249;">
	<!ENTITY rsaquo "&#8250;">
	<!ENTITY percent "&#37;">
	<!ENTITY gt "&#37;">
]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<section class="events">
		<header>
			<h1>Foxycart demo</h1>
		</header>
		<article>
			<!-- link example -->
			<a href="https://ma.foxycart.com/cart?name=Cool%20Example!amp;price=10!amp;color=red!amp;code=sku123">Add a red Cool Example</a>
			<!-- form example -->
			<form action="https://ma.foxycart.com/cart" method="post" accept-charset="utf-8">
				<input type="hidden" name="name" value="Cool Example" />
				<input type="hidden" name="price" value="10" />
				<input type="hidden" name="code" value="sku123" />
				<label class="label_left">Size</label>
				<select name="size">
					<option value="small">Small</option>
					<option value="medium">Medium</option>
					<option value="large">Large</option>
				</select>
				<input type="submit" value="Add a Cool Example" class="submit" />
			</form>
		</article>
	</section>
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/en/events/" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/pl/wydarzenia/" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="meta-tags">
	<!-- FOXYCART -->
		<script src="//cdn.foxycart.com/ma/loader.js" async="" defer=""></script>
	<!-- /FOXYCART -->
</xsl:template>

</xsl:stylesheet>