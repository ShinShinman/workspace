<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourcecollection_search_suggestions extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'collection-search-suggestions';
    public $dsParamURL = 'http://localhost:8983/solr/test/terms?terms.limit=10&omitHeader=true&terms.fl=autocomplete&terms.regex.flag=case_insensitive&wt=xml&terms.regex=.*{$url-q}.*';
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
            'name' => 'Collection Search Suggestions',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://localhost/ma.wroc.pl',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.7.7',
            'release-date' => '2020-07-03T14:28:24+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}