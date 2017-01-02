<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes"/>

<xsl:template match="/">
	Dziękujemy za złożenie zamówienia w czytelni Archiwum Budowlanego Wrocławia.

	Numer zamówienia: <xsl:value-of select="/data/ab-orders/entry/order-id" />
	Dane osobowe: <xsl:value-of select="concat(/data/ab-orders/entry/fname, ' ', /data/ab-orders/entry/lname)" />

	Szczegóły zamówienia
	Sygnatura: <xsl:value-of select="/data/ab-orders/entry/signature" />
	Złożono: <xsl:value-of select="/data/ab-orders/entry/system-date/created" />
	Gotowe do odbioru: <xsl:value-of select="/data/ab-orders/entry/date" />

	Podgląd dokumentu <xsl:value-of select="$root" />/pl/archiwum-budowlane/<xsl:value-of select="/data/ab-orders/entry/ab-id" />/

	Nieodebrane zamówienia będą anulowane po 2 dniach.
</xsl:template>
</xsl:stylesheet>
