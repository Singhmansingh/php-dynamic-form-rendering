<?php

class Segment {
    public $id;
    public $segment_type_id;
    public $data;
    public $segment_name;
    function __construct($data)
    {
        $this->id=$data['id'];
        $this->segment_type_id=$data['segment_type_id'];
        $this->segment_name=$data['segment_name'];

        // undo the entity cleaning and json decoding

        $data_decoded=html_entity_decode($data['data']);
        $this->data=json_decode($data_decoded);


    }
}