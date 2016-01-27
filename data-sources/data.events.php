<?php
class datasourceevents extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'events';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'order';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
    
    public $dsParamFILTERS = array(
        '56' => 'yes',
    );
        
    public $dsParamINCLUDEDELEMENTS = array(
        'title: formatted',
        'subtitle: formatted',
        'main-image',
        'lead: formatted',
        'inline-images',
        'article: formatted',
        'category',
        'badge',
        'cover-image',
        'date: formatted',
        'kalendar'
    );
    
    public $dsParamINCLUDEDASSOCIATIONS = array(
        'badge' => array(
            'section_id' => '9',
            'field_id' => '33',
            'elements' => array(
                'badge: formatted'
            )
        ),
        'category' => array(
            'section_id' => '8',
            'field_id' => '31',
            'elements' => array(
                'exhib-category: formatted'
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
            'name' => 'Events',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://localhost/ma.wroc.pl',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.6.3',
            'release-date' => '2016-01-19T19:08:35+00:00'
        );
    }
    public function getSource()
    {
        return '11';
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