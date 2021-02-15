<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourceconnection_test extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'connection-test';
    public $dsParamURL = 'http://localhost:4081/ma-kolekcja/items/kolekcja?fields=sygnatura_slug,datowanie,nazwa_obiektu,architekci.autorzy.architekt&q={$url-keywords}';
    public $dsParamFORMAT = 'json';
    public $dsParamXPATH = '/data/data/*';
    public $dsParamCACHE = 5;
    public $dsParamTIMEOUT = 6;
    public $dsParamREQUIREDPARAM = '$url-keywords';




    public function __construct($env=NULL, $process_params=true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Connection test',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://localhost/ma.wroc.pl',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.7.7',
            'release-date' => '2020-05-22T13:08:10+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}
