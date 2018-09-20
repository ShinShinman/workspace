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
<xsl:include href="../utilities/_bookshop-brick.xsl" />
<xsl:include href="../utilities/_fc-link.xsl" />

<xsl:template match="data">
	<!--
	<xsl:choose>
		<xsl:when test="$title">
			<xsl:if test="bookshop-book/error">
				<script>
					window.location.replace('<xsl:value-of select="$root"/>/error/');
				</script>
			</xsl:if>
			<xsl:apply-templates select="bookshop-book/entry" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="bookshop" />
		</xsl:otherwise>
	</xsl:choose>
	-->
</xsl:template>

<xsl:template match="bookshop-book/entry">
	<section class="single-book">
		<header class="donthyphenate">
			<ul class="category-list">
				<li><xsl:value-of select="category/item/bookshop-category" /></li>
			</ul>
			<h1><xsl:value-of select="title" /></h1>
			<h2><xsl:value-of select="subtitle" /></h2>
			<p class="author"><xsl:value-of select="author/p" /></p>
			<xsl:call-template name="fc-link">
				<xsl:with-param name="prize" select="prize" />
			</xsl:call-template>
		</header>
		<article>
			<xsl:copy-of select="article/node()" />
		</article>
	</section>
	<section class="books">
		<header>
		<h1><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></h1>
		<ul class="inline-list filters">
				<xsl:apply-templates select="//bookshop-categories/entry" />
				<li class="show-all">
					<a href="javascript:void(0)"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'wszystkie']" /></a>
				</li>
			</ul>
			</header>
			<div class="bricks-container">
			<xsl:apply-templates select="//bookshop-items/entry" />
		</div>
	</section>
</xsl:template>

<xsl:template name="bookshop">
	<section class="bookshop-nav">
		<header>
			<xsl:call-template name="bookshop-nav" />
			<ul class="inline-list filters">
				<xsl:apply-templates select="bookshop-categories/entry" />
				<li class="show-all">
					<a href="javascript:void(0)"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'wszystkie']" /></a>
				</li>
			</ul>
		</header>
		<div class="bricks-container">
			<xsl:apply-templates select="bookshop-items/entry" />
		</div>
	</section>
</xsl:template>

<xsl:template match="bookshop-categories/entry">
	<xsl:variable name="cat" select="bookshop-category/@handle" />
	<xsl:if test="count(//bookshop-items/entry[category/item/bookshop-category/@handle = $cat]) &gt; 0">
		<li>
			<a href="javascript:void(0)" data-filter="{bookshop-category/@handle}"><xsl:value-of select="bookshop-category" /></a>
		</li>
	</xsl:if>
</xsl:template>

<xsl:template match="bookshop-items/entry">
	<xsl:call-template name="bookshop-brick" />
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:choose>
		<xsl:when test="//bookshop-book/entry">
			<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', //plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle, '/')" />
		</xsl:when>
	<xsl:otherwise>
		<xsl:value-of select="concat($root, '/', //current-language/@handle, '/')" />
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(function() {
			var lazyImgs = $("img.lazy");
			lazyImgs.lazyload({
				threshold: 1000,
				failure_limit : 1000
			});
		});
		$(window).load(function() {
			MA.iS();
		});
	</script>
</xsl:template>

<xsl:template match="data" mode="meta-tags">
	<xsl:variable name="lang">
		<xsl:value-of select="//current-language/@handle" />
	</xsl:variable>

	<xsl:variable name="subpage">
		<xsl:choose>
			<xsl:when test="$lang = 'pl'">
				<xsl:text>wydawnictwa</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>publications</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:choose>
		<xsl:when test="$title">
			<meta http-equiv="refresh" content="0; url={$root}/{//current-language/@handle}/{//plh-page/page/item[@lang = //current-language/@handle]/@handle}/{$subpage}/{$title}/" />	
		</xsl:when>
		<xsl:otherwise>
			<meta http-equiv="refresh" content="0; url={$root}/{//current-language/@handle}/{//plh-page/page/item[@lang = //current-language/@handle]/@handle}/{$subpage}/" />
		</xsl:otherwise>
	</xsl:choose>


	<!--<xsl:if test="//ip-localisation/geobytesinternet != 'PL' and //current-language/@handle != 'en'">
		<meta http-equiv="refresh" content="0; url={$root}/en/bookstore/publications/" />
	</xsl:if>-->
	<!--
	<xsl:choose>
		<xsl:when test="//ip-localisation/geobytesinternet = 'PL'">
		</xsl:when>
		<xsl:otherwise>
			<meta http-equiv="refresh" content="0; url={$root}/en/bookstore/publications/" />
		</xsl:otherwise>
	</xsl:choose>
-->
</xsl:template>

</xsl:stylesheet>