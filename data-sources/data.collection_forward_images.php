<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourcecollection_forward_images extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'collection-forward-images';
    public $dsParamURL = 'http://localhost:4083/{$url-img}';
    public $dsParamFORMAT = 'txt';
    public $dsParamXPATH = '/*';
    public $dsParamCACHE = 5;
    public $dsParamTIMEOUT = 1200;

    

    

    public function __construct($env=NULL, $process_params=true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Collection Forward Images',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://localhost/ma.wroc.pl',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.7.7',
            'release-date' => '2020-12-06T11:50:57+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}