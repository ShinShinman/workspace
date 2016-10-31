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

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data">

	<section class="fc-checkout">
		<header>
			<h1>Template test</h1>
		</header>

		<section class="fc">
			{% include 'svg.inc.twig' %}
			{% import "utils.inc.twig" as utils %}
			{% embed 'checkout.inc.twig' %}
			{% endembed %}
		</section>
	</section>

	<!-- FC footer script insertion -->{% include template_from_string(fc_footer_content) %}<!-- /FC footer scripts -->

</xsl:template>

<xsl:template match="data" mode="meta-tags">
	{% for css_file_href in config.css_files %}
	    <link href="{{ css_file_href }}" rel="stylesheet" media="screen" />
	{% endfor %}
</xsl:template>

</xsl:stylesheet>
