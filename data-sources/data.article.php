<?php
	require_once(EXTENSIONS . '/uniondatasource/data-sources/datasource.union.php');
	Class datasourcearticle extends UnionDatasource{
		public $dsParamROOTELEMENT = 'article';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamSTARTPAGE = '1';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '';
		public $dsParamREDIRECTONREQUIRED = 'yes';
		public $dsParamNEGATEPARAM = '';
		public $dsParamREDIRECTONFORBIDDEN = 'yes';
		public $dsParamUNION = array(
			'exhibition',
			'event',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
			'system:pagination'
		);
		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}
		public function about(){
			return array(
				'name' => 'Article',
				'author' => array(
					'name' => 'Olaf Schindler',
					'website' => 'http://localhost/ma.wroc.pl',
					'email' => 'studio@orkana39.pl'),
				'version' => 'Union Datasource Symphony 2.6.3',
				'release-date' => '2016-01-25T15:11:42+00:00'
			);
		}
		public function allowEditorToParse(){
			return true;
		}
	}