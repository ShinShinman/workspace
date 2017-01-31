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
	<!ENTITY lt "&#60;">
]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/_archive-brick.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$title">
			<xsl:apply-templates select="exhibition-archived/entry" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="exhibitions-archive" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="exhibition-archived/entry">
	<section class="archived-exhibition">
		<header class="donthyphenate">
			<ul class="category-list">
				<li><xsl:value-of select="//plh-page/page/page/item[@lang = //fl-languages/current-language/@handle]" /></li>
			</ul>
			<h1><xsl:value-of select="title/p" /></h1>
			<xsl:apply-templates select="subtitle" />
			<h3 class="date">
				<xsl:apply-templates select="date/date[@type = 'exact']" />
				<xsl:apply-templates select="date/date[@type = 'range']" />
			</h3>
		</header>
		<article>
			<xsl:copy-of select="./article/node()" />
			<xsl:apply-templates select="./downloadables" />
		</article>
	</section>
</xsl:template>

<xsl:template match="subtitle">
	<h2><xsl:copy-of select="./p/node()" /></h2>	
</xsl:template>

<xsl:template match="date[@type = 'exact']">
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="start"/>
			<xsl:with-param name="format" select="'x.N.Y'"/>
		</xsl:call-template>
</xsl:template>

<xsl:template match="date[@type = 'range']">
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="start"/>
			<xsl:with-param name="format" select="'x.N.Y'"/>
		</xsl:call-template>
		<xsl:text>–</xsl:text>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="end"/>
			<xsl:with-param name="format" select="'x.N.Y'"/>
		</xsl:call-template>
</xsl:template>

<xsl:template match="downloadables">
	<h1><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'materialy-do-pobrania']" /></h1>
	<ul>
		<xsl:apply-templates select="./item" />
	</ul>
</xsl:template>

<xsl:template match="downloadables/item">
	<li><a href="{file-link}"><xsl:value-of select="file-name" /></a></li>
</xsl:template>

<xsl:template name="exhibitions-archive">
	<section class="archive">
		<nav class="big-nav">
			<h1 class="donthyphenate">
				<a href="{$root}/{////fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}"><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></a>
				<xsl:text> /</xsl:text>
				<a href="javascript:void(0)" class="active"><xsl:value-of select="//plh-page/page/page/item[@lang = //fl-languages/current-language/@handle]" /></a>
			</h1>
		</nav>
		<h2 class="legend">Wystawy z lat <span><xsl:value-of select="substring(//exhibitions-archive/entry[last()]/date/date/start, 1, 4)" />–<xsl:value-of select="substring(//exhibitions-archive/entry[1]/date/date/start, 1, 4)" /></span></h2>
		<!--
		<ul class="inline-list filters">
			<li class="show-all"><a href="javascript:void(0)"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'wszystkie']" /></a></li>
		</ul>
		-->
		<div class="slider"></div>
		<div class="bricks-container">
			<xsl:apply-templates select="exhibitions-archive/entry" />
		</div>
	</section>
</xsl:template>

<xsl:template match="exhibitions-archive/entry">
	<xsl:call-template name="archive-brick" />
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/{//plh-page/page/page/item[@lang != //current-language/@handle]/@handle}/{//exhibition-archived/entry/title/@handle-en}" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/{//plh-page/page/page/item[@lang != //current-language/@handle]/@handle}/{//exhibition-archived/entry/title/@handle-pl}" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="js">
	<!--<script src="{$workspace}/js/jquery-ui.min.js" ></script>-->
	<script>
		$(window).load(function() {
			MA.iS({slider:true,sliderRange:[<xsl:value-of select="substring(//exhibitions-archive/entry[last()]/date/date/start, 1, 4)" />,<xsl:value-of select="substring(//exhibitions-archive/entry[1]/date/date/start, 1, 4)" />]});
		});
	</script>
</xsl:template>

</xsl:stylesheet>