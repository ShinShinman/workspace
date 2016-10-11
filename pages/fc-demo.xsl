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

	<section class="fc-demo">
		<header>
			<h1>Foxycart demo</h1>
		</header>

		<p data-fc-id="minicart">
			<a href="https://ma.foxycart.com/cart?cart=view">
				<span data-fc-id="minicart-quantity">0</span>
				<span data-fc-id="minicart-singular"> item </span>
				<span data-fc-id="minicart-plural"> przedmiotów </span>
				w koszyku. Suma:
				<span data-fc-id="minicart-order-total">&nbsp;0 </span>
				zł
			</a>
		</p>

		<article>
			<!-- link example -->
			<!--<a href="https://ma.foxycart.com/cart?name=Cool%20Example!amp;price=10!amp;color=red!amp;code=sku123">Add a red Cool Example</a>-->
			<!-- form example -->
			<img src="{$workspace}/images/tmp/werk.jpg" />
			<form action="https://ma.foxycart.com/cart" method="post" accept-charset="utf-8">
				<input type="hidden" name="name" value="Werkbund. Droga ku nowoczsności" />
				<input type="hidden" name="price" value="79.99" />
				<input type="hidden" name="code" value="ISBN 123-123-123-123" />
				<label>Język publikacji</label>
				<select name="language">
					<option value="pl">Polski</option>
					<option value="de">Niemiecki</option>
					<option value="en">Angielski</option>
					<option value="cz">Czeski</option>
				</select><br />
				<label>Wysyłka</label>
				<select name="category">
					<option value="kurier">Kurier</option>
					<option value="pickup">Odbiór w MA</option>
				</select><br />
				<input type="number" name="quantity" min="1" value="1" />
				<input type="submit" value="Dodaj do koszyka" class="submit" />
			</form>
		</article>

		<article>
			<img src="{$workspace}/images/tmp/jgh.jpg" />
			<form action="https://ma.foxycart.com/cart" method="post" accept-charset="utf-8">
				<input type="hidden" name="name" value="Werkbund. Droga ku nowoczsności" />
				<input type="hidden" name="price" value="59.99" />
				<input type="hidden" name="code" value="ISBN 123-123-123-123" />
				<input type="hidden" name="category" value="book" />
				<input type="number" name="quantity" min="1" value="1" />
				<input type="submit" value="Dodaj do koszyka" class="submit" />
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