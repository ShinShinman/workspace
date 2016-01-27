<?php
class datasourceexhibition extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'exhibition';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamREQUIREDPARAM = '$title';
    public $dsParamSORT = 'system:id';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
    
    public $dsParamFILTERS = array(
        '30' => 'yes',
        '1' => '{$title}',
    );
        
    public $dsParamINCLUDEDELEMENTS = array(
        'title: formatted',
        'title: all-languages: formatted',
        'subtitle: formatted',
        'main-image',
        'article: formatted',
        'category',
        'date: formatted',
        'linked-event'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'category' => array(
            'section_id' => '8',
            'field_id' => '31',
            'elements' => array(
                'exhib-category: formatted'
            )
        ),
        'linked-event' => array(
            'section_id' => '11',
            'field_id' => '50',
            'elements' => array(
                'title: formatted'
            )
        )
    );
    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }
    public function about()
    {
        return array(
            'name' => 'Exhibition',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://localhost/ma.wroc.pl',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.6.3',
            'release-date' => '2016-01-25T15:58:24+00:00'
        );
    }
    public function getSource()
    {
        return '1';
    }
    public function allowEditorToParse()
    {
        return true;
    }
    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);
        try{
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
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