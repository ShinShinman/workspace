<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourceconnection_solr extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'connection-solr';
    public $dsParamURL = 'http://localhost:8983/solr/test/select?rows=30&q={$search}&start=0{$url-start}';
    public $dsParamFORMAT = 'json';
    public $dsParamXPATH = '/data/*';
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
            'name' => 'Connection SOLR',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://localhost/ma.wroc.pl',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.7.7',
            'release-date' => '2020-07-08T16:29:29+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}