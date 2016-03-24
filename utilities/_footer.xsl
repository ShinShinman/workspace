<?xml version="1.0" encoding="utf-8"?>
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
					<p><a href="mailto:muzuem@ma.wroc.pl">muzeum@ma.wroc.pl</a></p>
					<ul class="yyy">
						<li><a href="{$root}/{//current-language/@handle}/{//dictionary/entry/word[@handle-pl = 'informacje']}/#godziny-otwarcia">Godziny otwarcia</a></li>
						<li><a href="{$root}/{//current-language/@handle}/{//dictionary/entry/word[@handle-pl = 'informacje']}/#ceny-biletow">Ceny biletów</a></li>
					</ul>
				</div>
				<div class="third-column">
					<ul class="social">
						<li><a href="https://twitter.com/Arch_Muzeum" target="_blank">t</a></li>
						<li><a href="javascript:void(0)" target="_blank">i</a></li>
						<li><a href="https://www.facebook.com/MuzeumArchitektury" target="_blank">f</a></li>
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
					<p><a href="mailto:muzuem@ma.wroc.pl">muzeum@ma.wroc.pl</a></p>
					<ul class="yyy">
						<li><a href="{$root}/{//current-language/@handle}/{//dictionary/entry/word[@handle-pl = 'informacje']}/#godziny-otwarcia">Opening hours</a></li>
						<li><a href="{$root}/{//current-language/@handle}/{//dictionary/entry/word[@handle-pl = 'informacje']}/#ceny-biletow">Ticket prices</a></li>
					</ul>
				</div>
				<div class="third-column">
					<ul class="social">
						<li><a href="https://twitter.com/Arch_Muzeum" target="_blank">t</a></li>
						<li><a href="javascript:void(0)" target="_blank">i</a></li>
						<li><a href="https://www.facebook.com/MuzeumArchitektury" target="_blank">f</a></li>
					</ul>
				</div>
			</section>
		</footer>
	</xsl:template>

</xsl:stylesheet>