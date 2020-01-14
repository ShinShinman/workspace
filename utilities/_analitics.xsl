<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="analitics">
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-25077148-1"></script>
		<script>
			window.dataLayer = window.dataLayer || [];
			function gtag(){dataLayer.push(arguments);}
			gtag('js', new Date());

			gtag('config', 'UA-25077148-1');
		</script>
	</xsl:template>

</xsl:stylesheet>
