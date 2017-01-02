<?php

class Ab_order_confirmationEmailTemplate extends EmailTemplate
{
    public $datasources = Array(
 			'ab_orders',);
    public $layouts = Array(
 			'plain' => 'template.plain.xsl',);
    public $subject = 'Dziękujemy za złożenie zamówienia w czytelni Archiwum Budowlanego Wrocławia';
    public $reply_to_name = 'Archiwum Budowlane Wrocławia';
    public $reply_to_email_address = 'czytelnia@ma.wroc.pl';
    public $recipients = '{/data/ab-orders/entry/fname} {/data/ab-orders/entry/lname} <{/data/ab-orders/entry/email}>';
    public $attachments = '';

    public $editable = true;

    public $about = Array(
        'name' => 'AB Order Confirmation',
        'version' => '1.0',
        'author' => array(
            'name' => 'Olaf Schindler',
            'website' => 'http://localhost/ma.wroc.pl',
            'email' => 'studio@orkana39.pl'
        ),
        'release-date' => '2017-01-02T17:45:12+00:00'
    );
}
