<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="lightbox">
    <div class="lightbox">
			<button class="icon close">X</button>
			<xsl:call-template name="image" />
		</div>
	</xsl:template>

	<xsl:template name="image">
	<div class="swiper-blowup">
		<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="swiper-zoom-container">
						<img class="blowup" src="https://placehold.it?140"/>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="lightbox-js">


		function lightbox(swiper) {
			console.log(swiper.clickedIndex);
			const lightbox = $('div.lightbox').show();
			swiperLightbox.slideTo(swiper.clickedIndex, 0);
			swiperLightbox.update();
			$('.lightbox button.close').click(function() {
				lightbox.hide();
			});
		}


		var swiperLightbox = new Swiper('.swiper-lightbox', {
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

		function lightboxYSZT(swiper) {
			const img = new Image();
			const lb = $('.lightbox');
			const closeBtn = $('.lightbox button.close');
			const blowup = document.querySelector('.lightbox .swiper-slide');
			closeBtn.click(function() {
				lb.hide();
			})
			lb.find('img').remove();
			lb.show();
			img.src = $(swiper.slides[swiper.clickedIndex]).find('img')[0].src.split('?')[0];
			img.alt = $(swiper.slides[swiper.clickedIndex]).find('img')[0].alt;
			img.onload = function() {
				$(blowup).append(img);
				blowupGallery.update();
				console.log(blowupGallery.zoom);
			}
			// blowup.alt = $(swiper.slides[swiper.clickedIndex]).find('img')[0].alt;
			// blowup.src = $(swiper.slides[swiper.clickedIndex]).find('img')[0].src.split('?')[0];
		}

		var blowupGallery = new Swiper('.swiper-blowup', {
			zoom: true,
			// noSwipingClass: 'swiper-slide',
			on: {
				click: function() {
					this.zoom.toggle();
				}
			}
		});
</xsl:template>

</xsl:stylesheet>
