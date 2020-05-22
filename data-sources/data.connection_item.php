<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourceconnection_item extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'connection-item';
    public $dsParamURL = 'http://localhost:4081/ma-kolekcja/items/kolekcja?fields=*.*,architekci.autorzy.architekt,tworzywo_link.tworzywo.*.*,technika_link.technika.*.*&filter[sygnatura_slug][eq]={$signature}';
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
            'name' => 'Connection item',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://localhost/ma.wroc.pl',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.7.7',
            'release-date' => '2020-05-22T15:26:18+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}