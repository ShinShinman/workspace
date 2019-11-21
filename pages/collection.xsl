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
<xsl:include href="../utilities/_image-header.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$signature">
			<xsl:if test="collection-item/error">
				<script>
					window.location.replace('<xsl:value-of select="$root"/>/error/');
				</script>
			</xsl:if>
			<xsl:apply-templates select="collection-item" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="collection" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="collection">
	<xsl:call-template name="image-header">
		<xsl:with-param name="parent-node" select="collection-header-images" />
	</xsl:call-template>
	<section class="coll">
		<header>
			<h1><a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/"><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></a></h1>
			<ul class="inline-list">
				<xsl:apply-templates select="//collection-nav/page" />
			</ul>
		</header>
		<xsl:apply-templates select="collection-about/entry" />
	</section>
</xsl:template>

<xsl:template match="collection-nav/page">
	<li>
		<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{item[@lang = //fl-languages/current-language/@handle]/@handle}/">
			<xsl:value-of select="item[@lang = //fl-languages/current-language/@handle]" />
		</a>
	</li>
</xsl:template>

<xsl:template match="collection-about/entry">
	<article>
		<h1><xsl:value-of select="title/p" /></h1>
		<xsl:copy-of select="article/node()" />
	</article>
</xsl:template>

<xsl:template match="collection-item">
	<section class="coll collection-item">
		<header>
			<h1><a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/"><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></a></h1>
			<ul class="inline-list">
				<xsl:apply-templates select="//collection-nav/page" />
			</ul>
		</header>
		<xsl:apply-templates select="entry[1]" />
	</section>
</xsl:template>

<xsl:template match="collection-item/entry">
	<article>
		<h1 class="donthyphenate"><xsl:value-of select="object-name" /></h1>
		<h2 class="donthyphenate"><xsl:value-of select="authors" /></h2>
		<h3><xsl:value-of select="dates" /></h3>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<xsl:apply-templates select="images/file" />
			</div>
			<xsl:if test="count(images/file) > 1">
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</xsl:if>
		</div>
		<div class="swiper-pagination"><span class="bullet" /></div>
		<ul class="project-description">
			<li><xsl:value-of select="place" /></li>
			<li><xsl:value-of select="address" /><xsl:apply-templates select="address-cyrillic" /></li>
			<ul class="project-details">
				<li><xsl:value-of select="projec-content" /></li>
				<li><xsl:value-of select="project-remarks" /></li>
			</ul>
			<ul class="project-details">
				<li><span class="signature"><strong><xsl:value-of select="//dictionary//word[@handle-en = 'signature']" /></strong></span><xsl:value-of select="signature" /></li>
				<xsl:if test="//current-language/@handle = 'pl'">
					<li><xsl:value-of select="material" /></li>
					<li><xsl:value-of select="technics" /></li>
				</xsl:if>
				<li><xsl:value-of select="dimensions" /></li>
			</ul>
		</ul>
	</article>
</xsl:template>

<xsl:template match="images/file">
	<div class="swiper-slide">
		<img src="{$root}/image/collection-gallery{@path}/{filename}">
			<xsl:attribute name="alt">
				<xsl:apply-templates select="//collection-item/entry" mode="alt" />
			</xsl:attribute>
		</img>
	</div>
</xsl:template>

<xsl:template match="//collection-item/entry" mode="alt">
	<xsl:value-of select="concat(authors, ', ', object-name, ', ', dates)" />
</xsl:template>

<xsl:template match="address-cyrillic">
	<span class="cyrillic"><xsl:text> </xsl:text><xsl:value-of select="." /></span>
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:value-of select="concat($root, '/', //current-language/@handle, '/')" />
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

<xsl:template match="data" mode="js">
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'transparent'});
			MA.api.setNavBackground('.offset');

			var viewPortWidth = document.documentElement.clientWidth;
			var swiperSlides = $('.swiper-container .swiper-slide');
			var smallScreen = (<xsl:text disable-output-escaping="yes">viewPortWidth &lt; 770</xsl:text>) ? true : false;

			var swiperOptions = {
				speed: 500,
				slidesPerView: 'auto',
				spaceBetween: 30,
				centerInsufficientSlides: true,
				pagination: {
					el: '.swiper-pagination',
					clickable: true
				}
			};

			if(<xsl:text disable-output-escaping="yes">(swiperSlides.length &gt; 1) &amp;&amp; !smallScreen</xsl:text>) {
				$.extend(swiperOptions,
					{
						slidesOffsetBefore: (<xsl:text disable-output-escaping="yes">viewPortWidth &lt; 1132</xsl:text>) ? 150 : 250,
						loop: true,
						navigation: {
							nextEl: '.swiper-button-next',
							prevEl: '.swiper-button-prev',
						}
					}
				);
			}
	
			var gallery = new Swiper('.swiper-container', swiperOptions);
		});
	</script>
</xsl:template>

<xsl:template match="data" mode="meta-tags">
	<meta name="test" content="" />
	<link href="https://fonts.googleapis.com/css?family=Roboto:500" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="https://unpkg.com/swiper/css/swiper.css" />
</xsl:template>

</xsl:stylesheet>
