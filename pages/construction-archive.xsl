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
<section class="search-deails">
		<header>
			<h1>Wybrany obiekt</h1>
			<ul class="inline-list">
				<li><a class="order-button" href="javascript:void(0)">Zamów do czytelni</a></li>
				<li><a href="http://156.17.203.194/pl/pl/pdf/?id={$id}">Wydrukuj PDF</a></li>
			</ul>
			<div class="order-form-container">
				<form class="order-form" method="post" action="{$root}/ca-order-response/?debug" enctype="multipart/form-data">
					<label></label>
						<input class="fname" name="fields[fname]" type="text" placeholder="Imię" />
						<input class="lname" name="fields[lname]" type="text" placeholder="Nazwisko" />
						<input name="fields[email]" type="email" placeholder="Email" />
						<input class="signature" name="fields[signature]" type="hidden" />
						<input name="fields[ab-id]" type="hidden" value="{$id}" />
						<input class="form-date" name="fields[date]" type="text" value="{$today}" placeholder="Data" />
						<textarea class="info" name="fields[informacje-dodatkowe]" placeholder="informacje dodatkowe" />
						<!-- send-email -->
						<input name="send-email[sender-email]" value="fields[email]" type="hidden" />
						<input name="send-email[sender-name]" value="fields[fname, lname]" type="hidden" />
						<input name="send-email[reply-to-email]" value="fields[email]" type="hidden" />
						<input name="send-email[reply-to-name]" value="fields[fname, lname]" type="hidden" />
						<input name="send-email[subject]" value="Zamówienie do czytelni." type="hidden" />
						<input name="send-email[body]" value="fields[signature, ab-id]" type="hidden" />
						<input name="send-email[recipient]" value="czytelnia, marta, shinman" type="hidden" />
						<input name="action[ca-order]" type="submit" />
				</form>
			</div>
		</header>
		<div class="search-details-yszt"></div>
	</section>
</xsl:template>

<xsl:template match="data" mode="ma-button">
	<xsl:value-of select="concat($root, '/', //current-language/@handle, '/', //plh-page/page/item[@lang = //current-language/@handle]/@handle, '/',//ab-nav/page[@handle = 'search']/item[@lang = //current-language/@handle]/@handle, '/')" />
</xsl:template>

<xsl:template name="language-button">
	<xsl:param name="lang" />
	<xsl:choose>
		<xsl:when test="$lang = 'pl'">
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/{$id}/" class="icon">E</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/{//supported-languages/item[@handle != //current-language/@handle]/@handle}/{//plh-page/page/item[@lang != //current-language/@handle]/@handle}/{$id}/" class="icon">P</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="js">
	<script>
		$(function() {
			MA.stickyNavSetup({backgroundColor: 'white'});

			// Form
			$('.order-button').click(function(e){
				e.preventDefault();
				$('.order-form-container').slideToggle();
			})

			$('.order-form').ajaxForm({
				type: 'POST',
				dataType: 'json',
				url: '<xsl:value-of select="$root" />/ca-order-response/',
				clearForm: true,
				success: function(data) {
					console.log(data.response.status);
					$('.order-form').slideUp();
					$('.order-form-container').append('<p>Zamówinie wysłano</p>');
				},
				error: function(data) {
					console.log(data.response.status);
					$('.order-form-container').append('<p class="error">Błąd. Zamówienie nie powiodło się. Prosimy o kontakt <a href="mailto:czytelnia@ma.wroc.pl">czytelnia@ma.wroc.pl</a>.</p>');
				}
			});

			// Initial ajax call
			$.ajaxSetup({ crossDomain: true, scriptCharset: 'utf-8' , contentType: 'jsonp; charset=utf-8'});

			var url = 'http://156.17.203.194:8983/solr/archiwum/select?';
			var query = 'id:<xsl:value-of select="$id" />';
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
					var doc = data.response.docs[0];
					var technic = [];
					if (doc.kolumna39 == 1) technic.push('akwarela');
					if (doc.kolumna40 == 1) technic.push('atrament');
					if (doc.kolumna41 == 1) technic.push('druk');
					if (doc.kolumna42 == 1) technic.push('gwasz');
					if (doc.kolumna43 == 1) technic.push('kredka');
					if (doc.kolumna44 == 1) technic.push('ołówek');
					if (doc.kolumna45 == 1) technic.push('ozalid');
					if (doc.kolumna46 == 1) technic.push('pastel');
					if (doc.kolumna47 == 1) technic.push('światłokopia');
					if (doc.kolumna48 == 1) technic.push('tusz');
					if (doc.kolumna49 == 1) technic.push('węgiel');
					technic = technic.toString();
					technic = technic.replace(/,/g, ', ');

					var obj;
					switch (doc.typid) {
						case 421:
							obj = {
								adres: doc.kolumna2,
								adresDE: doc.kolumna1,
								architekt: doc.kolumna3,
								informacje: doc.kolumna4,
								id: doc.id,
								sygnatura: doc.kolumna41,
								nazwa: doc.kolumna24,
								nazwaDE: doc.kolumna19,
								podpisy: doc.kolumna23,
								image: doc.plik,
								technic: technic
							};
							break;
						case 422:
							obj = {
								adres: doc.kolumna2,
								adresDE: doc.kolumna1,
								architekt: doc.kolumna3,
								id: doc.id,
								sygnatura: doc.kolumna38,
								nazwa: doc.kolumna21,
								nazwaDE: doc.kolumna16,
								podpisy: doc.kolumna20,
								image: doc.plik,
								technic: technic
							};
							break;
						case 585:
							obj = {
								adres: doc.kolumna2,
								adresDE: doc.kolumna1,
								architekt: doc.kolumna3,
								id: doc.id,
								sygnatura: doc.kolumna18,
								nazwa: doc.kolumna16,
								nazwaDE: doc.kolumna13,
								podpisy: doc.kolumna15,
								image: doc.plik,
								technic: technic
							};
							break;
						case 1448:
							obj = {
								adres: doc.kolumna2,
								adresDE: doc.kolumna1,
								architekt: doc.kolumna3,
								id: doc.id,
								sygnatura: doc.kolumna41,
								nazwa: doc.kolumna24,
								nazwaDE: doc.kolumna19,
								podpisy: doc.kolumna23,
								image: doc.plik,
								technic: technic
							};
							break;
						case 1449:
							obj = {
								typid: doc.typid,
								adres: doc.kolumna2,
								adresDE: doc.kolumna1,
								chronolog: doc.kolumna3,
								//architekt: doc.kolumna3,
								informacje: doc.kolumna4,
								id: doc.id,
								sygnatura: doc.kolumna7,
								nazwa: doc.kolumna6,
								nazwaDE: doc.kolumna5,
								podpisy: '',
								image: doc.plik,
								technic: technic
							};
							break;
					}

					printResults(obj);

					/*
					printResults({
						adres: doc.kolumna2,
						adresDE: doc.kolumna1,
						id: doc.id,
						sygnatura: doc.kolumna41,
						nazwa: doc.kolumna24,
						nazwaDE: doc.kolumna19,
						podpisy: doc.kolumna23,
						architekt: doc.kolumna3,
						image: doc.plik,
						technic: technicd
					});
					*/
				},
				error: function(data) {
					alert("Error\n" + data.reponse);
				},
			});

			var loadData = function(d) {
				console.log(d);
			}

			function getParams () {
				var params = [
					'wt=json',
					'indent=on',
					'fl=id,plik,kolumna*,typid',
					'rows=1',
					'start=0',
					'json.wrf=loadData'
				];
				return params;
			}

			function printResults (obj) {
				var tmp = obj.image.split('.');
				var image;

				console.log (tmp[1]);
				if (tmp[1] == 'jpg') {
					var imgURL = '<xsl:value-of select="$root" />/image/ab-post/156.17.203.194/media/' + obj.id + '/' + obj.image;
					image = '<p class="img"><img src="' + imgURL + '" /></p>';
				} else {
					var imgURL = 'http://156.17.203.194/media/' + obj.id + '/' + obj.image;
					image = '<p class="img"><strong><a href="' + imgURL + '">Materiały do pobrania</a></strong></p>';
				};

				

				function replaceEmpty() {
					$.each(obj, function(i, prop){
						if(obj[i] == '' || obj[i] == undefined || obj[i] == 0) obj[i] = 'brak';
					})
				}
				replaceEmpty();

				var resultsTemplate =
					'<article>
						<h1 class="donthyphenate">' +  obj.nazwa + '</h1>
						<h2 class="architekt">Architekt projektu <span class="normal"> ' + obj.architekt + '</span></h2>
						<p class="sygnatura"><strong>Sygnatura</strong> ' + obj.sygnatura + '</p>'
						<!--<p class="img"><img src="' + imgURL + '" /></p>-->
						+ image +
						'<ul>
							<li class="addressPL">
								<label>Adres</label>'
								+ obj.adres +
							'</li>
							<li class="addressDE">
								<label>Adres niemiecki</label>'
								+ obj.adresDE +
							'</li>
							<li class="objNameDE">
								<label>Niemiecka nazwa obiektu</label>'
								+ obj.nazwaDE +
							'</li>
							<li class="signatures">
								<label>Podpisy na projekcie</label>'
								+ obj.podpisy +
							'</li>
							<li class="technic">
								<label>Technika</label>'
								+ obj.technic +
							'</li>
						</ul>
					</article>';

				$('.signature').val(obj.sygnatura);
				$('.search-details-yszt').append(resultsTemplate);

				if(obj.typid == 1449) $('.search-details-yszt .architekt').html('Data <span class="normal"> ' + obj.chronolog + '</span>')
			}

		})
	</script>
</xsl:template>

</xsl:stylesheet>