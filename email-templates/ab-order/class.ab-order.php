<?php

class Ab_orderEmailTemplate extends EmailTemplate
{
    public $datasources = array(
        'ab_orders',
    );
    public $layouts = array(
        'plain' => 'template.plain.xsl',
    );
    public $subject = 'Zamówienie do czytelni nr {/data/ab-orders/entry/order-id}.';
    public $from_name = '';
    public $from_email_address = '';
    public $reply_to_name = '{/data/ab-orders/entry/fname} {/data/ab-orders/entry/lname}';
    public $reply_to_email_address = '{/data/ab-orders/entry/email}';
    public $recipients = 'marta, czytelnia';
    public $attachments = '';
    public $ignore_attachment_errors = false;

    public $editable = true;

    public $about = array(
        'name' => 'AB Order',
        'version' => '1.0',
        'author' => array(
            'name' => 'Olaf Schindler',
            'website' => 'http://ma.wroc.pl',
            'email' => 'studio@orkana39.pl'
        ),
        'release-date' => '2018-11-23T12:15:46+00:00'
    );
}
