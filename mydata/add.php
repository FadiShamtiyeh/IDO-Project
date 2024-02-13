<?
include "../connect.php";
include "fnc.php";

$title = filterRequest("title");
$category = filterRequest("category");
$duedate = filterRequest("duedate");
$estimate = filterRequest("estimate");
$importance = filterRequest("importance");
$status = 1;

$stmt = $con->prepare("INSERT INTO 'items' (`title`, `category`,`duedate`,`estimate`,`importance`,`item_status`) 
VALUES(?, ?, ?, ?, ?, ?)");


$stmt->execute(array($title, $category, $duedate, $estimate, $importance, $status));

$count = $stmt->rowCount();

if($count>0){
    echo json_encode(array("status"=>"success"));
}
else{
    echo json_encode(array("status"=>"fail"));  
}

