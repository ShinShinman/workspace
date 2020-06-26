<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourcecollection_solr_search extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'collection-solr-search';
    public $dsParamURL = 'http://localhost:8983/solr/test/select?wt=xml&rows=30&q={$search}';
    public $dsParamFORMAT = 'xml';
    public $dsParamXPATH = '/*';
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
            'name' => 'Collection SOLR search',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://localhost/ma.wroc.pl',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.7.7',
            'release-date' => '2020-06-18T19:07:17+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}