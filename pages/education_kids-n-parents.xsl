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
<xsl:include href="../utilities/_edu-brick.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$title">
			<xsl:apply-templates select="edu-workshop/entry" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="edu-kids-and-parents/entry" />
		</xsl:otherwise>
	</xsl:choose>
	<xsl:apply-templates select="edu-workshops" />
</xsl:template>

<xsl:template match="edu-workshop/entry">
	<section class="single-lesson">
		<header class="donthyphenate">
			<h1><xsl:value-of select="title" /></h1>
			<p class="edu-categories"><span class="{category/item/category/@handle}"><xsl:value-of select="category/item/category" /></span></p>
		</header>
		<article>
			<xsl:copy-of select="article/node()" />
		</article>
	</section>
</xsl:template>
<!--
<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$title">
			<xsl:apply-templates select="edu-lesson/entry" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="edu-schools/entry" />
		</xsl:otherwise>
	</xsl:choose>
	<xsl:apply-templates select="edu-lessons" />
</xsl:template>
-->
<xsl:template match="edu-kids-and-parents/entry">
	<section class="edu">
		<header>
			<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}"><h1><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></h1></a>
			<ul class="inline-list">
				<xsl:apply-templates select="//edu-nav/page" />
			</ul>
		</header>
		<article>
			<h1><xsl:copy-of select="title/p/node()" /></h1>
			<xsl:copy-of select="article/node()" />
		</article>
		<!--<xsl:apply-templates select="//edu-workshops/entry" />-->
	</section>
</xsl:template>

<xsl:template match="edu-nav/page">
	<li>
		<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = 'pl']/@handle}/{item[@lang = 'pl']/@handle}">
			<xsl:value-of select="item[@lang = //fl-languages/current-language/@handle]" />
		</a>
	</li>
</xsl:template>

<xsl:template match="edu-workshops">
	<section class="edu-items">
		<header>
			<h1><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'aktualne-warsztaty']" /></h1>
			<!--
			<ul class="edu-categories filters">
				<li class="label"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'filtry']" />:</li>
				<xsl:apply-templates select="//edu-categories/entry" />
			</ul>
			-->
			<xsl:choose>
				<xsl:when test="entry">
					<div class="bricks-container">
						<xsl:apply-templates select="./entry" />
					</div>
				</xsl:when>
				<xsl:otherwise>
					<p><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'brak-aktualnych-warsztatow']" /></p>
				</xsl:otherwise>
			</xsl:choose>
		</header>
	</section>
</xsl:template>

<xsl:template match="edu-workshops/entry">
	<xsl:call-template name="edu-brick" />
</xsl:template>

<!--
<xsl:template match="edu-workshops/entry">
	<article>
		<a href="javascript:void(0);" class="workshop">
			<h3><xsl:copy-of select="title/p/node()" /> –<span class="date">&nbsp;<xsl:copy-of select="date/p/node()" /></span></h3>
		</a>
		<div class="more hide">
			<xsl:copy-of select="subtitle/node()" />
			<xsl:copy-of select="article/node()" />
		</div>
	</article>
</xsl:template>
-->
<xsl:template match="data" mode="ma-button">
	<xsl:value-of select="concat($root, '/', //current-language/@handle, '/')" />
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/en/education/" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/pl/edukacja/" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'white'});
		});
	</script>
</xsl:template>

</xsl:stylesheet>