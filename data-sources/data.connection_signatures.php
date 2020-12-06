<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourceconnection_signatures extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'connection-signatures';
    public $dsParamURL = 'http://localhost:4081/ma-kolekcja/items/kolekcja?fields=sygnatura,sygnatura_slug&filter[sygnatura][like]={$url-q}';
    public $dsParamFORMAT = 'json';
    public $dsParamXPATH = '/data/data/*';
    public $dsParamCACHE = 5;
    public $dsParamTIMEOUT = 6;

    

    

    public function __construct($env=NULL, $process_params=true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Connection signatures',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://localhost/ma.wroc.pl',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.7.7',
            'release-date' => '2020-05-19T15:39:10+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}