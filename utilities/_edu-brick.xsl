<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="edu-brick">
		<xsl:param name="lang" select="//fl-languages/current-language/@language" />

		<article>
			<xsl:attribute name="class">brick<xsl:apply-templates select="category/item" /></xsl:attribute>

			<xsl:choose>
				<xsl:when test="name(..) = 'edu-lessons'">
					<xsl:call-template name="lesson" />
				</xsl:when>
				<xsl:when test="name(..) = 'edu-aid'">
					<xsl:call-template name="aid" />
				</xsl:when>
				<xsl:when test="name(..) = 'edu-games'">
					<xsl:call-template name="games" />
				</xsl:when>
				<xsl:when test="name(..) = 'edu-workshops'">
					<xsl:call-template name="workshops" />
				</xsl:when>
			</xsl:choose>

		</article>

	</xsl:template>

	<xsl:template name="lesson">
		<!--<xsl:value-of select="concat($root, '/', title/@lang, '/', //dictionary/entry/word[@handle-pl = 'edukacja'], '/', 'przedszkola-i-szkoly', '/', title/@handle)" />-->

		<a href="{$root}/{title/@lang}/{//dictionary/entry/word[@handle-pl = 'edukacja']}/przedszkola-i-szkoly/{title/@handle}">
			<h1 class="donthyphenate"><xsl:value-of select="title" /></h1>
			<!--<p class="category">Edukacja</p>-->
			<!--<xsl:apply-templates select="./date" />-->
			<!--<xsl:copy-of select="lead/node()" />-->
		</a>
	</xsl:template>

	<xsl:template name="aid">
		<!--<xsl:value-of select="concat($root, '/', title/@lang, '/', //dictionary/entry/word[@handle-pl = 'edukacja'], '/', 'materialy-edukacyjne', '/', title/@handle)" />-->

		<a href="{$root}/{title/@lang}/{//dictionary/entry/word[@handle-pl = 'edukacja']}/materialy-edukacyjne/{title/@handle}">
			<h1 class="donthyphenate"><xsl:value-of select="title" /></h1>
			<!--<p class="category">Edukacja</p>-->
			<!--<xsl:apply-templates select="./date" />-->
			<!--<xsl:copy-of select="lead/node()" />-->
		</a>
	</xsl:template>

	<xsl:template name="games">
		<!--<xsl:value-of select="concat($root, '/', title/@lang, '/', //dictionary/entry/word[@handle-pl = 'edukacja'], '/', 'gry-edukacyjne', '/', title/@handle)" />-->

		<a href="{$root}/{title/@lang}/{//dictionary/entry/word[@handle-pl = 'edukacja']}/gry-edukacyjne/{title/@handle}">
			<h1 class="donthyphenate"><xsl:value-of select="title" /></h1>
			<!--<p class="category">Edukacja</p>-->
			<!--<xsl:apply-templates select="./date" />-->
			<!--<xsl:copy-of select="lead/node()" />-->
		</a>
	</xsl:template>

	<xsl:template name="workshops">
		<!--<xsl:value-of select="concat($root, '/', title/@lang, '/', //dictionary/entry/word[@handle-pl = 'edukacja'], '/', 'dzieci-i-rodzice', '/', title/@handle)" />-->

		<a href="{$root}/{title/@lang}/{//dictionary/entry/word[@handle-pl = 'edukacja']}/dzieci-i-rodzice/{title/@handle}">
			<h1 class="donthyphenate"><xsl:value-of select="title" /></h1>
			<p class="category">Edukacja</p>
			<!--<xsl:apply-templates select="../section" />-->
			<xsl:apply-templates select="./date" />
			<xsl:copy-of select="lead/node()" />
			<xsl:apply-templates select="cover-image" />
		</a>
	</xsl:template>

	<xsl:template match="category/item">
		<xsl:text> </xsl:text><xsl:value-of select="category/@handle-pl" />
	</xsl:template>

	<xsl:template match="edu-workshops/section">
		<p class="category"><xsl:value-of select="." /></p>
	</xsl:template>

	<xsl:template match="entry/date">
		<div class="dashed">
			<svg>
				<path d="M0 0 H 300" />
			</svg>
			<xsl:copy-of select="./node()" />
			<svg>
				<path d="M0 0 H 300" />
			</svg>
		</div>
	</xsl:template>

	<xsl:template match="cover-image">
		<img src="{$root}/image/post-thumbnail{@path}/{filename}" />
	</xsl:template>

</xsl:stylesheet>