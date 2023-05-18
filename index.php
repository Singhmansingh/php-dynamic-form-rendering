<?php
include_once 'connect.php';
include_once 'Views/edit.php';
include_once 'Views/list.php';
include 'Models/FormField.php';
include 'Models/Segment.php';
include __DIR__ . '/Controllers/SegmentController.php';


// Parse the URL
$parsedUrl = parse_url($_SERVER['REQUEST_URI']);

// Get the path from the parsed URL
$path = $parsedUrl['path'];

// Output the route
$route = rtrim($path, '/');

switch ($route) {
    case '/segments/new': SegmentController::newForm(); break;
    case '/segments/submit': SegmentController::submit(); break;
    case '/segments/list': SegmentController::list(); break;
}