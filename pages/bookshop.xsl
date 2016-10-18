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
<xsl:include href="../utilities/_bookshop-nav.xsl" />

<xsl:template match="data">
	<section class="bookshop-nav">
		<header>

			<xsl:call-template name="bookshop-nav" />

			<ul class="inline-list">
				<li>yszt</li>
				<li>yszt</li>
				<li>yszt</li>
				<li>yszt</li>
			</ul>
		</header>


		<div class="bricks-container">
			<xsl:apply-templates select="events/entry" />
			<article class="book brick {category/item/exhib-category/@handle}">
				<a href="#">
					<div class="article-header">
						<h1 class="donthyphenate">Tytuł<br />2<br />3</h1>
						<h2>Podtytuł</h2>
						<p>Autor</p>
					</div>
					<img src="http://placehold.it/320x350" />
				</a>
				<a href="#" class="button">80,00 zł</a>
			</article>
		</div>
	</section>
</xsl:template>

<xsl:template match="events/entry">
	<xsl:call-template name="brick" />
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

<!--
<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'white'});
		});
	</script>
</xsl:template>
-->

</xsl:stylesheet>