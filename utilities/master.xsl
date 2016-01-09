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

	<xsl:include href="brick.xsl" />
	<xsl:include href="date-time.xsl" />

	<xsl:template match="/">

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
		<head>
			<meta charset="utf-8"/>
			<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
			<meta name="description" content=""/>
			<meta name="viewport" content="width=device-width, initial-scale=1"/>

			<xsl:apply-templates mode="meta-tags"/>

			<link rel="stylesheet" type="text/css" href="{$workspace}/css/main.css" />

			<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
		</head>

    <body class="{$current-page}">
			<!--[if lt IE 7]>
				<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
			<![endif]-->

			<xsl:call-template name="sticky-nav" />

			<xsl:apply-templates />

			<!-- FOOTER -->

			<script src="{$workspace}/js/main.min.js" ></script>
			<xsl:apply-templates mode="js"/>

		</body>
	</html>

</xsl:template>

<xsl:template match="data" mode="meta-tags">
	<title><xsl:value-of select="$website-name"/></title>
</xsl:template>

<xsl:template name="sticky-nav">

	<div class="sticky-nav" data-state="collapsed">

		<div class="nav-stripes">
			<div class="first"></div>
			<div class="second"></div>
		</div>

		<nav>
			<a class="logo" href="{$root}">MA</a>
			<!--<div class="search"></div>-->
			<form id="search-form" action="" method="get">
				<input type="text" name="keywords" placeholder="Używaj #tagów" autocomplete="off"/>
				<input type="submit" value="&rarr;" class="icon"/>
				<input type="hidden" name="sections" value="post,team,coworkers,about"/>
			</form>

			<ul>
				<li><a href="javascript:void(0);" class="icon search-trigger">s</a></li>
				<li><a href="javascript:void(0);">EN</a></li>
				<li><a href="javascript:void(0);" class="icon menu-trigger">m</a></li>
			</ul>
		</nav>

		<div class="main-menu">
			<div class="left small-stripe">
				<ul>
					<xsl:apply-templates select="//main-menu/entry/linki/item" />
				</ul>
			</div>
			<div class="right small-stripe">
				<xsl:copy-of select="//main-menu/entry/prawa-kolumna" />
			</div>
		</div>

	</div>

</xsl:template>

<xsl:template match="linki/item">
	<li><a href="{adres}"><xsl:value-of select="nazwa" /></a></li>
</xsl:template>

<xsl:template match="data" mode="js" />

</xsl:stylesheet>