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
	<xsl:choose>
		<xsl:when test="ab-header-images/entry">
			<xsl:apply-templates select="ab-header-images/entry" />
		</xsl:when>
		<xsl:otherwise>
			<header class="offset" />
		</xsl:otherwise>
	</xsl:choose>
	<xsl:call-template name="search-engine" />
</xsl:template>

<xsl:template match="ab-header-images/entry">
	<header class="offset" style="background-image: url({$root}/image/post-header{image/@path}/{image/filename}); height: {image/meta/@height}px" />
</xsl:template>

<xsl:template name="search-engine">
	<section class="archive-text">
		<header>
			<h1><a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{//ab-nav/page[@handle = 'search']/item[@lang = //fl-languages/current-language/@handle]/@handle}/"><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></a></h1>
			<ul class="inline-list">
				<xsl:apply-templates select="//ab-nav/page" />
			</ul>
		</header>
		<article>
			<h1><xsl:value-of select="//ab-nav/page[@handle = 'search']/item[@lang = //fl-languages/current-language/@handle]" /></h1>
			<form class="search-form">
				<input class="search-field" type="text" placeholder="Zacznij pisać aby rozpocząć wyszukiwanie" autofocus=""/>
			</form>
			<p class="results-found"></p>
		</article>
	</section>
	<section>
		<div class="search-results"></div>
	</section>
</xsl:template>

<xsl:template match="ab-nav/page">
	<li>
		<a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{item[@lang = //fl-languages/current-language/@handle]/@handle}">
			<xsl:value-of select="item[@lang = //fl-languages/current-language/@handle]" />
		</a>
	</li>
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:value-of select="concat($root, '/', //current-language/@handle, '/')" />
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/en/info/" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/pl/informacje/" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'transparent'});
			MA.api.setNavBackground('.offset');

			// INFINITE SCROLL
			$(window).scroll(function() {
				if($(window).scrollTop() + $(window).height() == $(document).height()) {
					loadMore();
				}
			})

			var currentQstr = '';
			var queue = 0;

			var loadMore = function() {
				queue = queue + 10;
				var url = 'http://156.17.203.194:8983/solr/archiwum/select?';
				var params = getParams2(queue).concat(currentQstr);
				var urlData = params.join('<xsl:text disable-output-escaping="yes">&amp;</xsl:text>');
				url = url+urlData;
				console.log(url);

				$.ajax({
					url : url,
					type: 'GET',
					dataType: 'jsonp',
					jsonp : 'callback',
					jsonpCallback: 'loadData',
					crossDomain: true,
					scriptCharset: 'utf-8',
					contentType: 'jsonp; charset=utf-8',
					success: function(data) {
						$.each(data.response.docs, function(i, doc) {
							printResults({
								adres: doc.kolumna2,
								adresDE: doc.kolumna1,
								id: doc.id,
								sygnatura: doc.kolumna41,
								nazwa: doc.kolumna24,
								podpisy: doc.kolumna23,
								architekt: doc.kolumna3,
								image: doc.plik,
								highlight: data.highlighting[doc.id].text[0]
							})
						});
					},
					error: function(data) {
						alert("Error\n" + data.reponse);
					},
				});
			};


			var delay = (function(){
				var timer = 0;
				return function(callback, ms){
				clearTimeout (timer);
				timer = setTimeout(callback, ms);
				};
			})();

			$('.search-field').keyup(function(k) {
				if(k.keyCode == 13) {
					return;
				}
				delay(function(){
					queue = 0;
				  var url = 'http://156.17.203.194:8983/solr/archiwum/select?';
					var query = $('.search-field').val() + '*';
					var queryTMP = query.replace(/\s/g, ' AND ');
					var qstr = 'q=' + encodeURI(queryTMP);
					currentQstr = qstr;
					var params = getParams().concat(qstr);
					var urlData = params.join('<xsl:text disable-output-escaping="yes">&amp;</xsl:text>');
					url += urlData;
					currentQuery = url;
					console.log(url);

					$.ajax({
						url : url,
						type: 'GET',
						dataType: 'jsonp',
						jsonpCallback: 'loadData',
						crossDomain: true,
						scriptCharset: 'utf-8',
						contentType: 'jsonp; charset=utf-8',
						success: function(data) {
						$('.results-found').text('Znaleziono ' + data.response.numFound + ' wyników.');
							$('.search-results').empty();
							$.each(data.response.docs, function(i, doc) {
								printResults({
									adres: doc.kolumna2,
									adresDE: doc.kolumna1,
									id: doc.id,
									sygnatura: doc.kolumna41,
									nazwa: doc.kolumna24,
									podpisy: doc.kolumna23,
									architekt: doc.kolumna3,
									image: doc.plik,
									highlight: data.highlighting[doc.id].text[0]
								})
							});
						},
						error: function(data) {
							alert("Error");
						},
					});
				}, 500 );
			});

			$('.search-form').submit(function(e) {
				queue = 0;
				var url = 'http://156.17.203.194:8983/solr/archiwum/select?';
				var query = $('.search-field').val();
				var queryTMP = query.replace(/\s/g, ' AND ');
				var qstr = 'q=' + encodeURI(query);
				currentQstr = qstr;
				var params = getParams().concat(qstr);
				var urlData = params.join('<xsl:text disable-output-escaping="yes">&amp;</xsl:text>');
				url = url+urlData;
				console.log(url);

				
				$.ajax({
					url : url,
					type: 'GET',
					dataType: 'jsonp',
					jsonp : 'callback',
					jsonpCallback: 'loadData',
					crossDomain: true,
					scriptCharset: 'utf-8',
					contentType: 'jsonp; charset=utf-8',
					success: function(data) {
						$('.search-results').empty();
						//console.log(data.response.docs);
						$.each(data.response.docs, function(i, doc) {
							printResults({
								adres: doc.kolumna2,
								adresDE: doc.kolumna1,
								id: doc.id,
								sygnatura: doc.kolumna41,
								nazwa: doc.kolumna24,
								podpisy: doc.kolumna23,
								architekt: doc.kolumna3,
								image: doc.plik,
								highlight: data.highlighting[doc.id].text[0]
							})
						});
					},
					error: function(data) {
						alert("Error\n" + data.reponse);
					},
				});

				e.preventDefault();
			});

			function getParams () {
				var params = [
					'wt=json',
					'indent=on',
					'hl=true',
					//'hl.fl=name,features',
					'fl=id,plik,kolumna*,typid',
					'rows=10', //ilość odpowiedzi
					'start=0', // ? nr pierwszej odp.
					'json.wrf=loadData'
				];
				return params;
			}

			function getParams2 (i) {
				var params = [

					'wt=json',
					'indent=on',
					'hl=true',
					'fl=id,plik,kolumna*,typid',
					'rows=10', //ilość odpowiedzi
					'start=' + i, // ? nr pierwszej odp.
					'json.wrf=loadData'
				];
				return params;
			}


			function loadData () {
				console.log('*');
				console.log(data.response);
			}

			function printResults (obj) {
				var tmp = obj.image.split('.');
				var imgURL = '<xsl:value-of select="$root" />/image/ab-tail/156.17.203.194/media/' + obj.id + '/' + tmp[0] + '-min.' + tmp[1];
				var path = "<xsl:value-of select="concat($root, '/', //fl-languages/current-language/@handle, '/', //plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle, '/' )" />" + obj.id;
				var tail = 
					'<article class="tail">
						<a href="' + path + '">
							<h2>' + obj.adres + '</h2>
							<p>' + obj.highlight
							+ '<img src="' + imgURL + '" /></p>
						</a>
					</article>';
				$('.search-results').append(tail);
			}
		});
	</script>
</xsl:template>

</xsl:stylesheet>