<?php

class datasourcesearch_edu_lectures extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'search-edu-lectures';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamREQUIREDPARAM = '$ds-search';
    public $dsParamSORT = 'order';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
    

    public $dsParamFILTERS = array(
        'system:id' => '{$ds-search}',
    );
        

    public $dsParamINCLUDEDELEMENTS = array(
        'title: formatted',
        'subtitle: formatted',
        'lead: formatted',
        'category',
        'date: formatted'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'category' => array(
            'section_id' => '41',
            'field_id' => '175',
            'elements' => array(
                'category: formatted'
            )
        )
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array('$ds-search');
    }

    public function about()
    {
        return array(
            'name' => 'Search Edu lectures',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://localhost/ma.wroc.pl',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.7.7',
            'release-date' => '2018-09-11T16:34:27+00:00'
        );
    }

    public function getSource()
    {
        return '40';
    }

    public function allowEditorToParse()
    {
        return true;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try {
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error',
                General::wrapInCDATA($e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile())
            ));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }
}