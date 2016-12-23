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
	<section class="archive-text">
		<header>
			<h1><a href="{$root}/{//fl-languages/current-language/@handle}/{//plh-page/page/item[@lang = //fl-languages/current-language/@handle]/@handle}/{//ab-nav/page[@handle = 'search']/item[@lang = //fl-languages/current-language/@handle]/@handle}/"><xsl:value-of select="//plh-page/page/item[@lang = //fl-languages/current-language/@handle]" /></a></h1>
			<ul class="inline-list">
				<xsl:apply-templates select="//ab-nav/page" />
			</ul>
		</header>
		<article>
			<h1>Wyszukiwarka</h1>
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
			MA.stickyNavSetup({backgroundColor: 'white'});

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
				  var url = 'http://156.17.203.194:8983/solr/archiwum/select?';
					var query = $('.search-field').val() + '*';
					var queryTMP = query.replace(/\s/g, ' AND ');
					var qstr = 'q=' + escape(queryTMP);
					var params = getParams().concat(qstr);
					var urlData = params.join('<xsl:text disable-output-escaping="yes">&amp;</xsl:text>');
					url = url+urlData;
					console.log(url);

					$.ajax({
						url : url,
						type: 'GET',
						dataType: 'jsonp',
						jsonpCallback: 'loadData',
						success: function(data) {
						$('.results-found').text('Znaleziono ' + data.response.numFound + ' wyników.');
							$('.search-results').empty();
							$.each(data.response.docs, function(i, doc) {
								//printIt(doc.kolumna2, doc.id, data.highlighting[doc.id].text[0], doc.plik, doc.kolumna41);
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
				var url = 'http://156.17.203.194:8983/solr/archiwum/select?';
				var query = $('.search-field').val();
				var qstr = 'q=' + escape(query);
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

				var loadData = function(d) {
					console.log(d);
				}

				e.preventDefault();
			});

			$.ajaxSetup({ crossDomain: true, scriptCharset: 'utf-8' , contentType: 'jsonp; charset=utf-8'});

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

			function getParams2 () {
				var params = [

					'wt=json',
					'indent=on',
					//'hl=true',
					//'hl.fl=name,features',
					'fl=id,plik,kolumna*,typid',
					'rows=10', //ilość odpowiedzi
					'start=0', // ? nr pierwszej odp.
					'json.wrf=loadData'
				];
				return params;
			}


			function loadData () {
				console.log('*');
				console.log(data.response);
			}

			function printIt(title, id, discription, img, sygnatura) {
				var tmp = img.split('.'); //if tmp[1] = 'zip' then 'download'
				imgURL = 'http://156.17.203.194/media/' + id + '/' + tmp[0] + '-min.' + tmp[1];
				$('.search-results').append
				('<div class="tail">
					<h2>' + title + '</h2>
					<p>' + sygnatura + ' [' + id + ']' + '<br />'
					+ discription + '</p>
					<p><img src="' + imgURL + '" /></p>
				</div>');
			}

			function printResults (obj) {
				var tmp = obj.image.split('.');
				var imgURL = 'http://156.17.203.194/media/' + obj.id + '/' + tmp[0] + '-min.' + tmp[1];
				var tail = '<div class="tail">
					<h2>' + obj.adres + '</h2>
					<p>' <!--+ obj.sygnatura + '<br />'-->
					+ obj.highlight
					+ '<img src="' + imgURL + '" /></p>
				</div>';
				$('.search-results').append(tail);
			}
		});
	</script>
</xsl:template>

</xsl:stylesheet>