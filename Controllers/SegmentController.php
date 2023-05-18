<?php
include '../connect.php';

class SegmentController {

    public static function editForm(){
        global $db;

        $segment_type_id=$_GET['segment_type_id'];

        $query="SELECT * FROM form_fields WHERE segment_type_id=$segment_type_id";

        $rs=mysqli_query($db,$query);

        $query="SELECT name from segment_types WHERE id=$segment_type_id";

        $segmentObj=mysqli_query($db,$query);
        

        $segment=mysqli_fetch_assoc($segmentObj);

        $fields=array();
        while($field=mysqli_fetch_assoc($rs))
        {
            $fields[]=new FormField($field);
        }

        
        editView($segment_type_id, $segment, $fields);

    }

    public static function submit(){
        global $db;
        
        // get the incoming segment id (ex. localhost/submit?segement_type_id=1) default 1 (report)
        $segment_type_id=$_GET['segment_type_id'];
        if(!$segment_type_id) $segment_type_id=1;
        
        // Now you have everything you need to package the data.
        // The POST request contains all of the form fields, related to the segment type
        // the segment type ID was passed along above.
        print_r($_POST);

        // Take out the segment name field, as it needs to go into the segment_name column, not the data
        $segment_name=$_POST['segment_name'];

        // unset is a cool function in PHP. it deletes the key-value in an array, as though it never existed
        // (yeah, not set to null, literally remove it)
        unset($_POST['segment_name']);

        // Package the rest into a string in JSON format, so it can be stored in the database encoded.
        $payload = json_encode($_POST);

        // saving it to the database. htmlentities() helps to clean the entry of symbols. 
        $query = 'INSERT INTO segments(segment_type_id,segment_name,data) VALUES ('.htmlentities($segment_type_id).',"'.htmlentities($segment_name).'","'.htmlentities($payload).'")';

        // send off to the database
        mysqli_query($db,$query);

        // once done, go to the listing page

        header('Location: list');
    }

    public static function list(){
        global $db;

        $query="SELECT * FROM segments";
        $res=mysqli_query($db, $query);
        $segments=array();

        while($row=mysqli_fetch_assoc($res))
        {
            $segment=new Segment($row);
            $segments[]=$segment;
        }


        listView($segments);
    }

}
