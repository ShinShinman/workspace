<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourcecollection_item_2 extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'collection-item-2';
    public $dsParamURL = 'http://localhost:4081/ma-kolekcja/items/kolekcja?fields=*.*.*&filter[sygnatura_slug][like]={$signature}';
    public $dsParamFORMAT = 'json';
    public $dsParamXPATH = '/data/data/*';
    public $dsParamCACHE = 5;
    public $dsParamTIMEOUT = 60;

    

    

    public function __construct($env=NULL, $process_params=true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Collection item 2',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://localhost/ma.wroc.pl',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.7.7',
            'release-date' => '2020-07-14T19:05:32+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}