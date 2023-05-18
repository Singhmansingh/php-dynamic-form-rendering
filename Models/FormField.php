<?php 

class FormField {
    public $id;
    public $segment_type_id;
    public $type;
    public $label;
    public $name;

    function __construct($data=array()){
        $this->id=$data['id'];
        $this->segment_type_id=$data['segment_type_id'];
        $this->type=$data['type'];
        $this->label=$data['label'];
        $this->name=$data['name'];
    }

}