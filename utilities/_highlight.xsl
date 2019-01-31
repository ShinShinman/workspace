<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="highlight">
		<section class="highlight donthyphenate">
			<div class="owl-carousel">
				<xsl:apply-templates select="slides/item" />
			</div>
			<div class="slide-down">
				<a href="javascript:void(0)"><span class="icon">F</span></a>
			</div>
		</section>
	</xsl:template>

	<xsl:template match="slides/item">
		<a href="{article-link}">
			<div class="item" style="background-image: url({$workspace}{image/@path}/{image/filename});">
				<div class="text-box">
					<h1><xsl:copy-of select="title[1]/p/node()" /></h1>
					<xsl:copy-of select="text-box/node()" />
					<!--<h3><a href="#"><span class="icon">F</span> Zapowiedź wystawy</a></h3>-->
				</div>
			</div>
		</a>
	</xsl:template>

	<xsl:template match="highlight/entry" mode="js">
	<script>
		$(function() {
			MA.setupHighlight();
		});
	</script>
</xsl:template>

</xsl:stylesheet>