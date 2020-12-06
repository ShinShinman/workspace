<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="connection-brick">
		<article class="brick">
			<a href="{$root}/{//current-language/@handle}/{//plh-page/page/item[@lang = //current-language/@handle]/@handle}/connection/{sygnatura-slug}/">
				<h1 class="donthyphenate"><xsl:value-of select="nazwa-obiektu" /></h1>
				<h2 class="donthyphenate"><xsl:value-of select="architekci/item/autorzy/architekt" /></h2>
				<p><xsl:value-of select="datowanie" /></p>
				<xsl:call-template name="tmp-image" />
				<xsl:apply-templates select="images" />
			</a>
		</article>
	</xsl:template>

	<xsl:template name="tmp-image">
		<img class=""
				 src="http://placehold.jp/320x200.png" />
	</xsl:template>

	<xsl:template match="images">
		<xsl:variable name="ratio">
			<xsl:value-of select="file/meta/@width div 320" />
		</xsl:variable>
		<!-- Wersja dla jQuery-lazyload [https://appelsiini.net/projects/lazyload/v1/] -->
		<img class="lazy"
				 width="320"
				 height="{floor(file/meta/@height div $ratio)}"
				 alt="{../authors}, {../object-name}"
				 data-original="{$root}/image/post-thumbnail{file/@path}/{file/filename}" />

	<!-- Wersja dla vanilla-lazyload [https://github.com/verlok/lazyload] -->
	<!--
		<img class="lazy"
				 width="320"
				 height="{floor(file/meta/@height div $ratio)}"
				 style="width: 320px; height: {floor(file/meta/@height div $ratio)}px"
				 data-src="{$root}/image/post-thumbnail{file/@path}/{file/filename}"
				 data-srcset="{$root}/image/post-thumbnail{file/@path}/{file/filename},
				 							{$root}/image/1/640/0{file/@path}/{file/filename} 2x,
				 							{$root}/image/1/960/0{file/@path}/{file/filename} 3x"
				 alt="{../authors}, {../object-name}" />
	-->
	</xsl:template>

</xsl:stylesheet>
