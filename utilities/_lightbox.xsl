<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="lightbox">

	</xsl:template>

	<xsl:template name="lightbox-js">
		function lightbox(swiper) {
			const lightbox = $('div.lightbox').show();
			swiperLightbox.slideTo(swiper.clickedIndex, 0);
			swiperLightbox.update();
			$('.lightbox button.close').click(function() {
				lightbox.hide();
			});
		}

		var swiperLightbox = new Swiper('.swiper-lightbox', {
			preloadImages: false,
			lazy: true,
			zoom: {
				maxRatio: 3,
				toggle: false
			},
			on: {
				click: function() {
					this.zoom.toggle();
				}
			}
		});
</xsl:template>

</xsl:stylesheet>
