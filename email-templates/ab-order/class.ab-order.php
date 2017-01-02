<?php

class Ab_orderEmailTemplate extends EmailTemplate
{
    public $datasources = Array(
 			'ab_orders',);
    public $layouts = Array(
 			'plain' => 'template.plain.xsl',);
    public $subject = 'Zamówienie do czytelni nr {/data/ab-orders/entry/order-id}.';
    public $reply_to_name = '{/data/ab-orders/entry/fname} {/data/ab-orders/entry/lname}';
    public $reply_to_email_address = '{/data/ab-orders/entry/email}';
    public $recipients = 'shinman, marta, czytelnia';
    public $attachments = '';

    public $editable = true;

    public $about = Array(
        'name' => 'AB Order',
        'version' => '1.0',
        'author' => array(
            'name' => 'Olaf Schindler',
            'website' => 'http://localhost/ma.wroc.pl',
            'email' => 'studio@orkana39.pl'
        ),
        'release-date' => '2017-01-02T17:51:35+00:00'
    );
}
