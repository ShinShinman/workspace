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
			<xsl:choose>
				<xsl:when test="out-of-stock = 'Yes'">
					<div class="button disabled">
						<p><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'naklad-wyczerpany']" /></p>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="fc-link">
						<xsl:with-param name="prize" select="prize" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
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
			
			<xsl:apply-templates select="bookshop-infobanner/entry" />

			<ul class="inline-list filters">
				<xsl:apply-templates select="bookshop-categories/entry" />
				<li class="show-all">
					<a href="javascript:void(0)"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'wszystkie']" /></a>
				</li>
				<li class="search">
					<input type="text" placeholder="Szybkie wyszukiwanie" />
				</li>
			</ul>
		</header>
		<div class="bricks-container">
			<xsl:apply-templates select="bookshop-items/entry" />
		</div>
	</section>
</xsl:template>

<xsl:template match="bookshop-infobanner/entry">
	<div class="info-banner">
		<xsl:copy-of select="msg/node()" />
	</div>
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
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/{//plh-page/page/page/item[@lang != //current-language/@handle]/@handle}/{//bookshop-book/entry/title/@handle-en}" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/{//plh-page/page/page/item[@lang != //current-language/@handle]/@handle}/{//bookshop-book/entry/title/@handle-pl}" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:choose>
		<xsl:when test="//bookshop-book/entry">
			<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', //plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle, '/', //plh-page/page/page/item[@lang = //fl-languages/current-language/@handle]/@handle, '/')" />
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

			/*** Search ***/
			var yt = $('.filters .search input[type = text]');
			var qsRegex;
			var grid = $('.bricks-container');

			yt.keyup(debounce(function() {
				var tmp = yt.val().split(' ');
				$.each(tmp, function(i, v) {
					tmp[i] = '(?=.*' + v + ')';
				});
				searchStr = tmp.join('');
				//qsRegex = new RegExp(yt.val(), 'gi');
				qsRegex = new RegExp(searchStr + '.*', 'gi');
				grid.isotope({
					filter: function() {
						return $(this).text().match(qsRegex);
					}
				});
			}, 200));

			// debounce so filtering doesn't happen every millisecond
			function debounce( fn, threshold ) {
				var timeout;
				threshold = threshold || 100;
				return function debounced() {
					clearTimeout( timeout );
					var args = arguments;
					var _this = this;
					function delayed() {
						fn.apply( _this, args );
					}
					timeout = setTimeout( delayed, threshold );
				};
			}

		});
		$(window).load(function() {
			MA.iS();
		});
	</script>
</xsl:template>

<xsl:template match="data" mode="meta-tags">

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