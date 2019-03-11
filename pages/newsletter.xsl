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

<xsl:template match="data">
	<xsl:apply-templates select="newsletter/entry" />
</xsl:template>

<xsl:template match="newsletter/entry">
	<section class="newsletter-text">
		<header>
			<h1><xsl:copy-of select="title/p/node()" /></h1>
			<ul class="inline-list">
				<li>
					<a href="http://wroc.us14.list-manage.com/unsubscribe?u=603554c72cd4cbcf0d6b22244&amp;id=9561c3dfb6" target="_blank"><xsl:value-of select="//dictionary/entry/word[@handle-pl = 'rezygnacja']" /></a>
				</li>
			</ul>
		</header>
		<article>
			<xsl:copy-of select="info/node()" />
			<xsl:call-template name="mailchimp-form" />
			<xsl:copy-of select="unsubscribe-info" />
		</article>
	</section>
</xsl:template>

<xsl:template name="mailchimp-form">
<!--
	<div class="subscribe-form">
		<form method="post" action="" enctype="multipart/form-data">
			<fieldset>
				<input type="text" value="" name="merge[FNAME]" class="fname" placeholder="Imię" />
				<input type="text" value="" name="merge[LNAME]" class="lname" placeholder="Nazwisko" />
				<input type="email" value="" name="email" placeholder="Email*" />
				<input type="hidden" name="list" value="9561c3dfb6" />
				<input type="submit" value="Wyślij" name="action[signup]" />
			</fieldset>
		</form>
	</div>
-->
	<div class="subscribe-form mc_embed_signup">
		<form method="post" action="//wroc.us14.list-manage.com/subscribe/post?u=603554c72cd4cbcf0d6b22244&amp;id=9561c3dfb6"  enctype="multipart/form-data" id="mc-embedded-subscribe-form" class="validate" name="mc-embedded-subscribe-form" target="_blank" novalidate="">
			<fieldset>
				<input type="text" value="" name="FNAME" id="mce-FNAME" class="fname" placeholder="Imię" />
				<input type="text" value="" name="LNAME" id="mce-LNAME" class="lname" placeholder="Nazwisko" />
				<input type="email" value="" name="EMAIL" class="required email" id="mce-EMAIL" placeholder="Email*" />
				<input type="checkbox" name="mailchimp-name" id="mailchimp-id" value="yes" class="rodo" />
				<p class="rodo label">Zgoda na przetwarzanie danych osobowych dla subskrybentów newslettera</p>
				<p class="rodo">Wyrażam zgodę na przetwarzanie moich danych osobowych przez Muzeum Architektury we Wrocławiu, ul. Bernardyńska 5, 50-156 Wrocław w celach: prowadzenia działań  marketingowych promujących prowadzoną działalność z wykorzystaniem adresów e-mail w przepadku subskrybentów newslettera. Dane w tym celu przetwarzane będą na podstawie art. 6 ust. 1 lit. a) RODO.  Osoba, której dane dotyczą, ma prawo dostępu do treści swoich danych osobowych oraz prawo ich sprostowania, usunięcia, ograniczenia przetwarzania, prawo do przenoszenia danych, prawo wniesienia sprzeciwu, prawo do cofnięcia zgody w dowolnym momencie bez wpływu na zgodność z prawem przetwarzania, którego dokonano na podstawie zgody przed jej cofnięciem. W celu realizacji uprawnień, osoba której dane dotyczą może wysłać stosowną wiadomość e-mail na adres: iod@ma.wroc.pl</p>
				<input type="hidden" name="list" value="9561c3dfb6" />
				<input type="submit" value="Wyślij" name="subscribe" id="mc-embedded-subscribe" class="button" />
				<div id="mce-responses" class="clear">
					<div class="response" id="mce-error-response" style="display:none"></div>
					<div class="response" id="mce-success-response" style="display:none"></div>
				</div>
				<div style="position: absolute; left: -5000px;" aria-hidden="true">
					<input type="text" name="b_603554c72cd4cbcf0d6b22244_9561c3dfb6" tabindex="-1" value="" />
				</div>
			</fieldset>
		</form>
	</div>
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
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'white'});
		});
	</script>
</xsl:template>

</xsl:stylesheet>