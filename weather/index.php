<!DOCTYPE html>
<html>
<head>
</head>
<body>
<?php
	// Fetch Folder Names in 'weather' directory (reverse sorted by date)
	$dir_arr = scandir("./", 1);

	// Fetch all image file names (reverse sorted by date)
	$img_arr = scandir("./imgs", 1);
?>
<h3>Job Last Run: <?php echo $dir_arr[2]; ?> </h3>

<img width="800" src="imgs/<?php echo $img_arr[0]; ?>"></img>

<h3>Current Forecast</h3>
<?php 
	$file_data = file_get_contents("$dir_arr[2]/weather.json");
	$file_data_arr = explode(" ", $file_data);

	foreach($file_data_arr as $data) {
		echo json_encode(json_decode($data, JSON_PRETTY_PRINT));
		echo "</br>";
	}
?>

<h3>Historical</h3>
<?php
	foreach($dir_arr as $dir) {
		if(preg_match("/\d+\.\d+/", $dir)) {
			echo "<a href='$dir'>$dir</a></br>";
		}
	}
?>

</body>
</html>
