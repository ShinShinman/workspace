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

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

	<xsl:include href="_brick.xsl" />
	<xsl:include href="_date-time.xsl" />
	<xsl:include href="_footer.xsl" />

	<xsl:template match="/">

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="{//fl-languages/current-language/@handle}"> <!--<![endif]-->
		<head>
			<meta charset="utf-8"/>
			<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
			<meta name="description" content=""/>
			<meta name="viewport" content="width=device-width, initial-scale=1"/>

			<xsl:apply-templates mode="meta-tags"/>

			<link rel="stylesheet" type="text/css" href="{$workspace}/css/main.css" />

			<xsl:call-template name="favicon" />
		</head>

    <body class="{$current-page} hyphenate">
			<!--[if lt IE 7]>
				<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
			<![endif]-->

			<xsl:call-template name="sticky-nav" />

			<xsl:apply-templates />

			<xsl:call-template name="footer" />

			<script src="{$workspace}/js/main.min.js" ></script>
			<xsl:apply-templates mode="js"/>

		</body>
	</html>

</xsl:template>

<xsl:template match="data" mode="meta-tags">
	<title><xsl:value-of select="$website-name"/></title>
</xsl:template>

<xsl:template name="sticky-nav">

	<div class="sticky-nav donthyphenate" data-state="collapsed">

		<div class="nav-stripes">
			<div class="first"></div>
			<div class="second"></div>
		</div>

		<nav>
			<!--<a class="logo icon" href="{$root}/{//current-language/@handle}">M</a>-->
			<a class="logo icon">
				<xsl:attribute name="href">
					<xsl:apply-templates mode="ma-button" />
				</xsl:attribute>
				M
			</a>
			<form id="search-form" action="javascript:void(0)" method="get">
				<input type="text" name="keywords" placeholder="W budowie" autocomplete="off" readonly="readonly"/>
				<input type="submit" value="&rarr;" class="icon"/>
				<!--<input type="hidden" name="sections" value="post,team,coworkers,about"/>-->
			</form>

			<ul>
				<li><a href="javascript:void(0);" class="icon search-trigger">S</a></li>
				<li>
					<xsl:call-template name="language-button">
						<xsl:with-param name="lang" select="//fl-languages/current-language/@language" />
					</xsl:call-template>
				</li>
				<!--
					<a class="icon">
						<xsl:attribute name="href">
							<xsl:apply-templates mode="language-button" />
						</xsl:attribute>
						E
					</a>
				</li>
				-->
				<li><a href="javascript:void(0);" class="icon menu-trigger">G</a></li>
			</ul>
		</nav>

		<div class="main-menu">
			<div class="left small-stripe">
				<ul>
					<xsl:apply-templates select="//main-menu/entry/links/item" />
				</ul>
			</div>
			<div class="right small-stripe">
				<xsl:copy-of select="//main-menu/entry/prawa-kolumna" />
			</div>
		</div>

	</div>

</xsl:template>

<xsl:template name="favicon">
	<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png?v=lkkJEWPqK3" />
	<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png?v=lkkJEWPqK3" />
	<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png?v=lkkJEWPqK3" />
	<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png?v=lkkJEWPqK3" />
	<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png?v=lkkJEWPqK3" />
	<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png?v=lkkJEWPqK3" />
	<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png?v=lkkJEWPqK3" />
	<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png?v=lkkJEWPqK3" />
	<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png?v=lkkJEWPqK3" />
	<link rel="icon" type="image/png" href="/favicon-32x32.png?v=lkkJEWPqK3" sizes="32x32" />
	<link rel="icon" type="image/png" href="/favicon-194x194.png?v=lkkJEWPqK3" sizes="194x194" />
	<link rel="icon" type="image/png" href="/favicon-96x96.png?v=lkkJEWPqK3" sizes="96x96" />
	<link rel="icon" type="image/png" href="/android-chrome-192x192.png?v=lkkJEWPqK3" sizes="192x192" />
	<link rel="icon" type="image/png" href="/favicon-16x16.png?v=lkkJEWPqK3" sizes="16x16" />
	<link rel="manifest" href="/manifest.json?v=lkkJEWPqK3" />
	<link rel="mask-icon" href="/safari-pinned-tab.svg?v=lkkJEWPqK3" color="#000000" />
	<link rel="shortcut icon" href="/favicon.ico?v=lkkJEWPqK3" />
	<meta name="msapplication-TileColor" content="#da532c" />
	<meta name="msapplication-TileImage" content="/mstile-144x144.png?v=lkkJEWPqK3" />
	<meta name="theme-color" content="#ffffff" />
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<!-->
		Wywalić i przerobić na js.
		Na stronie głównej MA otwiera menu.
	</-->
	<xsl:value-of select="concat($root, '/', //current-language/@handle)" />
</xsl:template>

<xsl:template match="main-menu/entry/links/item">
	<li><a href="{address}">
		<xsl:apply-templates select="blank[. = 'Yes']" />
		<xsl:value-of select="name" /></a></li>
</xsl:template>

<xsl:template match="blank">
	<xsl:attribute name="target">_blank</xsl:attribute>
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/en" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/pl" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="language-button">
	<xsl:value-of select="concat($root, '/en')" />
</xsl:template>

<xsl:template match="data" mode="js" />

</xsl:stylesheet>