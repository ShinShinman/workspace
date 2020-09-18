<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="lightbox">
    <div class="lightbox">
			<button class="icon close">X</button>
		</div>
	</xsl:template>

	<xsl:template name="lightbox-js">
		function lightbox(swiper) {
			const img = new Image();
			const lb = $('.lightbox');
			const closeBtn = $('.lightbox button.close');
			closeBtn.click(function() {
				lb.hide();
			})
			lb.find('img').remove();
			lb.show();
			img.src = $(swiper.slides[swiper.clickedIndex]).find('img')[0].src.split('?')[0];
			console.log(img);
			img.onload = function() {
				lb.append(img);
			}
		}
</xsl:template>

</xsl:stylesheet>
