<?php

function listView($segments){
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Segments</title>
</head>
<body>
    <h1>Segment List</h1>
    <?php foreach($segments as $segment): ?>
    <div>
        <!--segment_name is universal accross all forms as it is in the segments table, so we can prepare for that -->
        <h2><?php echo $segment->segment_name?></h2>

        <!-- looping through the data object. We don't know the exact fields, so this renders them as text -->
        <? foreach($segment->data as $key=>$field): ?>

            <!-- We cannot prepare for these form_fields, so we can print them out here.  -->
            <p><?php echo $key?> : <?php echo $field;?></pre>

        <? endforeach; ?>
    </div>
    <? endforeach; ?>    
</body>
</html>
<?php
}