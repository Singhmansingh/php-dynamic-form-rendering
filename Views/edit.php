<?php
// include 'connect.php';

// if(isset($_GET['segment_type'])) $segment_type_id=$_GET['segment_type'];
// else $segment_type_id=1;

// $query="SELECT * FROM form_fields WHERE segment_type_id=$segment_type_id";

// $rs=mysqli_query($db,$query);

// $query="SELECT name from segment_types WHERE id=$segment_type_id";

// $segmentrs=mysqli_query($db,$query);
// $segment=mysqli_fetch_assoc($segmentrs);
function editView($segment_type_id, $segment, $fields) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Template gen</title>
    <link href="../style.css" rel="stylesheet">
</head>
<body>

    <h1>Template Generator</h1>
    <h2>New "<?php echo $segment['name']?>" Segment</h2>

    <!--Adding the segment_type_id to the submission URL so the submit controller has access to that ID to store-->
    <form method="post" action="submit?segment_type_id=<?php echo $segment_type_id;?>">

        <!--Segment Name is universal across all forms as its a field in the segments table, not form_fields so it is OUTSIDE the loop-->
        <label>Segment Name</label>
        <input type="text" name="segment_name">
        <hr>

        <?php /***************** HERE IS THE KEY PART ******************** */ ?>

        <?php foreach($fields as $field):?>

            <label><?php echo $field->label;?></label>

            <?php //If the segment type is a text field ?>
            <? if($field->type=="text"):?>

                <input type="<?php echo $field->type;?>" name="<?php echo $field->name;?>">
            
            <?php //If the segment type is a date field ?>
            <? elseif($field->type=="date"):?>

                <input type="<?php echo $field->type;?>" name="<?php echo $field->name;?>">

            <?php //If the segment type is a textarea ?>
            <? elseif($field->type=="textarea"):?>

                <textarea name="<?php echo $field->name;?>" id="<?php echo $field->name;?>"></textarea>

            <? endif;?>

        <? endforeach;?>
        <input type="submit" value="submit">
    </form>
</body>
</html>
<?php }?>