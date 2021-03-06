<?xml version="1.0" encoding="utf-8"?>

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

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="footer">
		<xsl:param name="lang" />
		<xsl:choose>
			<xsl:when test="$lang = 'en'">
				<xsl:call-template name="footer-en" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="footer-pl" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="footer-pl">
		<footer class="main-footer">
			<section class="footer">
				<div class="first-column">
					<p class="icon logo">M</p>
					<p>Muzeum Architektury<br/>
					we Wrocławiu</p>
					<p>Bernardyńska 5<br/>
					50-156 Wrocław<br/>
					Polska</p>
				</div>
				<div class="second-column">
					<div class="a">
						<p><a href="{$root}/pl/ksiegarnia/wydawnictwa/">Księgarnia</a></p>
						<ul>
							<li><a href="mailto:bookstore@ma.wroc.pl">bookstore@ma.wroc.pl</a></li>
							<li>+48 71 344 82 79 wew.&nbsp;32</li><br />
							<li><a href="{$workspace}/dl/Polityka_Prywanosci_MA.pdf" target="_blank">Polityka prywatności</a></li>
						</ul>
					</div>
					<div class="b b-side">
						<p><a href="mailto:muzeum@ma.wroc.pl">muzeum@ma.wroc.pl</a></p>
						<ul>
							<li><a href="{$root}/{//current-language/@handle}/{//dictionary/entry/word[@handle-pl = 'informacje']}/#godziny-otwarcia">Godziny otwarcia</a></li>
							<li><a href="{$root}/{//current-language/@handle}/{//dictionary/entry/word[@handle-pl = 'informacje']}/#ceny-biletow">Ceny biletów</a></li>
						</ul>
						<ul class="social">
							<li><a href="https://twitter.com/Arch_Muzeum" target="_blank">&#xe800;</a></li>
							<li><a href="https://www.youtube.com/channel/UCgaGcndBKY4ZtkXxwUmAasw" target="_blank">y</a></li>
							<li><a href="https://www.instagram.com/muzeum.architektury/" target="_blank">i</a></li>
							<li><a href="https://www.facebook.com/MuzeumArchitektury" target="_blank">f</a></li>
						</ul>
						<ul class="newsletter">
							<li><a href="{$root}/{//current-language/@handle}/newsletter/">Newsletter</a></li>
						</ul>
					</div>
				</div>
				<div class="third-column">
					<div class="b b-side">
						<p><a href="mailto:muzeum@ma.wroc.pl">muzeum@ma.wroc.pl</a></p>
						<ul>
							<li><a href="{$root}/{//current-language/@handle}/{//dictionary/entry/word[@handle-pl = 'informacje']}/#godziny-otwarcia">Godziny otwarcia</a></li>
							<li><a href="{$root}/{//current-language/@handle}/{//dictionary/entry/word[@handle-pl = 'informacje']}/#ceny-biletow">Ceny biletów</a></li>
						</ul>
					</div>
					<ul class="social">
						<li><a href="https://twitter.com/Arch_Muzeum" target="_blank">&#xe800;</a></li>
						<li><a href="https://www.youtube.com/channel/UCgaGcndBKY4ZtkXxwUmAasw" target="_blank">y</a></li>
						<li><a href="https://www.instagram.com/muzeum.architektury/" target="_blank">i</a></li>
						<li><a href="https://www.facebook.com/MuzeumArchitektury" target="_blank">f</a></li>
					</ul>
					<ul class="newsletter">
						<li><a href="{$root}/{//current-language/@handle}/newsletter/">Newsletter</a></li>
					</ul>
				</div>
			</section>
		</footer>
	</xsl:template>

	<xsl:template name="footer-en">
		<footer class="main-footer">
			<section class="footer">
				<div class="first-column">
					<p class="icon logo">M</p>
					<p style="letter-spacing: -0.04em;">Museum of Architecture<br/>
					in Wroclaw</p>
					<p>Bernardyńska 5<br/>
					50-156 Wrocław<br/>
					Poland</p>
				</div>
				<div class="second-column">
					<div class="a">
						<p><a href="{$root}/en/bookstore/publications/">Bookstore</a></p>
						<ul>
							<li><a href="mailto:bookstore@ma.wroc.pl">bookstore@ma.wroc.pl</a></li>
							<li>+48 71 344 82 79 wew.&nbsp;32</li><br />
							<li><a href="{$workspace}/dl/EN_Polityka_Prywanosci_MA.pdf" target="_blank">Privacy policy</a></li>
						</ul>
					</div>
					<div class="b">
						<p><a href="mailto:muzeum@ma.wroc.pl">muzeum@ma.wroc.pl</a></p>
						<ul>
							<li><a href="{$root}/{//current-language/@handle}/{//dictionary/entry/word[@handle-pl = 'informacje']}/#godziny-otwarcia">Opening hours</a></li>
							<li><a href="{$root}/{//current-language/@handle}/{//dictionary/entry/word[@handle-pl = 'informacje']}/#ceny-biletow">Ticket prices</a></li>
						</ul>
						<ul class="social">
							<li><a href="https://twitter.com/Arch_Muzeum" target="_blank">&#xe800;</a></li>
							<li><a href="https://www.youtube.com/channel/UCgaGcndBKY4ZtkXxwUmAasw" target="_blank">y</a></li>
							<li><a href="https://www.instagram.com/muzeum.architektury/" target="_blank">i</a></li>
							<li><a href="https://www.facebook.com/MuzeumArchitektury" target="_blank">f</a></li>
						</ul>
					</div>
				</div>
				<div class="third-column">
					<ul class="social">
						<li><a href="https://twitter.com/Arch_Muzeum" target="_blank">&#xe800;</a></li>
						<li><a href="https://www.youtube.com/channel/UCgaGcndBKY4ZtkXxwUmAasw" target="_blank">y</a></li>
						<li><a href="https://www.instagram.com/muzeum.architektury/" target="_blank">i</a></li>
						<li><a href="https://www.facebook.com/MuzeumArchitektury" target="_blank">f</a></li>
					</ul>
					<ul class="newsletter">
						<li><a href="{$root}/{//current-language/@handle}/newsletter/">Newsletter</a></li>
					</ul>
				</div>
			</section>
		</footer>
	</xsl:template>

</xsl:stylesheet>