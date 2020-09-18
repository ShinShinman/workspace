<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="collection-header">
  	<header>
  		<h1><a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/"><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></a></h1>
  		<ul class="inline-list text-class-menu">
  			<li class="text-class-A-butt active">A</li>
  			<li class="text-class-B-butt">A+</li>
  			<li class="text-class-C-butt">A++</li>
  		</ul>
  		<ul class="inline-list">
  			<xsl:apply-templates select="//collection-nav/page" />
  		</ul>
  	</header>
  </xsl:template>

  <xsl:template match="collection-nav/page">
  	<li>
  		<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{item[@lang = //fl-languages/current-language/@handle]/@handle}/">
  			<xsl:value-of select="item[@lang = //fl-languages/current-language/@handle]" />
  		</a>
  	</li>
  </xsl:template>

  <xsl:template name="collection-header-js">
    <script>
      $(window).load(function() {
        $('ul.text-class-menu li.text-class-A-butt').click(function() {
          $('ul.text-class-menu li').removeClass('active');
          $(this).addClass('active');
          $('section.coll, .bricks-container').removeClass (function (index, className) {
            return (className.match (/(^|\s)text-class-\S+/g) || []).join(' ');
          });
          MA.api.grid.isotope('layout');
        })
        $('ul.text-class-menu li.text-class-B-butt').click(function() {
          $('ul.text-class-menu li').removeClass('active');
          $(this).addClass('active');
          $('section.coll, .bricks-container').removeClass (function (index, className) {
            return (className.match (/(^|\s)text-class-\S+/g) || []).join(' ');
          }).addClass('text-class-B');
          MA.api.grid.isotope('layout');
        })
        $('ul.text-class-menu li.text-class-C-butt').click(function() {
          $('ul.text-class-menu li').removeClass('active');
          $(this).addClass('active');
          $('section.coll, .bricks-container').removeClass (function (index, className) {
            return (className.match (/(^|\s)text-class-\S+/g) || []).join(' ');
          }).addClass('text-class-C');
          MA.api.grid.isotope('layout');
        })
      });
    </script>
  </xsl:template>

</xsl:stylesheet>
