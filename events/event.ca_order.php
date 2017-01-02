<?php

class eventca_order extends SectionEvent
{
    public $ROOTELEMENT = 'ca-order';

    public $eParamFILTERS = array(
        'etm-ab-order',
				'etm-ab-order-confirmation'
    );

    public static function about()
    {
        return array(
            'name' => 'CA Order',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://localhost/ma.wroc.pl',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.6.3',
            'release-date' => '2017-01-02T17:28:08+00:00',
            'trigger-condition' => 'action[ca-order]'
        );
    }

    public static function getSource()
    {
        return '64';
    }

    public static function allowEditorToParse()
    {
        return true;
    }

    public static function documentation()
    {
        return '
                <h3>Success and Failure XML Examples</h3>
                <p>When saved successfully, the following XML will be returned:</p>
                <pre class="XML"><code>&lt;ca-order result="success" type="create | edit">
    &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/ca-order></code></pre>
                <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned.</p>
                <pre class="XML"><code>&lt;ca-order result="error">
    &lt;message>Entry encountered errors when saving.&lt;/message>
    &lt;field-name type="invalid | missing" />
...&lt;/ca-order></code></pre>
                <p>The following is an example of what is returned if any options return an error:</p>
                <pre class="XML"><code>&lt;ca-order result="error">
    &lt;message>Entry encountered errors when saving.&lt;/message>
    &lt;filter name="admin-only" status="failed" />
    &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
...&lt;/ca-order></code></pre>
                <h3>Example Front-end Form Markup</h3>
                <p>This is an example of the form markup you can use on your frontend:</p>
                <pre class="XML"><code>&lt;form method="post" action="{$current-url}/" enctype="multipart/form-data">
    &lt;input name="MAX_FILE_SIZE" type="hidden" value="2097152" />
    &lt;label>Data
        &lt;input name="fields[date]" type="text" />
    &lt;/label>
    &lt;label>Nr zamówienia
        &lt;input name="fields[order-id]" type="text" />
    &lt;/label>
    &lt;label>Imię
        &lt;input name="fields[fname]" type="text" />
    &lt;/label>
    &lt;label>Nazwisko
        &lt;input name="fields[lname]" type="text" />
    &lt;/label>
    &lt;label>Email
        &lt;input name="fields[email]" type="text" />
    &lt;/label>
    &lt;label>Sygnatura
        &lt;input name="fields[signature]" type="text" />
    &lt;/label>
    &lt;label>Nr ID
        &lt;input name="fields[ab-id]" type="text" />
    &lt;/label>
    &lt;label>Informacje dodatkowe
        &lt;input name="fields[informacje-dodatkowe]" type="text" />
    &lt;/label>
    &lt;label>Zrealizowane
        &lt;input name="fields[archived]" type="checkbox" value="yes" />
    &lt;/label>
    &lt;input name="action[ca-order]" type="submit" value="Submit" />
&lt;/form></code></pre>
                <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
                <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
                <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
                <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://localhost/ma.wroc.pl/success/" /></code></pre>';
    }

    public function load()
    {
        if (isset($_POST['action']['ca-order'])) {
            return $this->__trigger();
        }
    }

}
