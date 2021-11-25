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
<h3>
	Job Last Run: 
	<?php 
		$datetime = explode(".", $dir_arr[2]);
		echo $datetime[0];
       		echo " @ ";
		echo $datetime[1]; // % 1200;
		echo " GMT";
	?>
</h3>

<div style="width: 1050px;">
	<img width="800" src="imgs/<?php echo $img_arr[0]; ?>"></img>
	<span style="float: left; margin-right: 100px;"> <<< </span>
	<span style="float: right;">  >>> </span>  
</div>

<h3>Current Forecast</h3>

<table style="text-align: center;">
<?php 
	$file_data = file_get_contents("$dir_arr[2]/weather.json");
	$file_data_arr = explode(" ", $file_data);

	echo "<thead><tr><td></td>";
	$forecast_arr = [];
	foreach($file_data_arr as $data) {
		$forecast = json_decode($data, JSON_PRETTY_PRINT);
		array_push($forecast_arr, $forecast);
		$date = $forecast['date'];
		echo "<td>$date</td>";
	}
	echo "</tr></thead>";

	echo "<tr><td>weather : </td>";
	foreach($forecast_arr as $forecast) {
		$weather = $forecast['weather'];
		echo "<td>$weather</td>";	
	}
	echo "</tr>";

	echo "<tr><td>min/max : </td>";
	foreach($forecast_arr as $forecast) {
		$min = $forecast['tempmin'];
		$max = $forecast['tempmax'];
		echo "<td>$min / $max</td>";	
	}
	echo "</tr>";
?>
</table>

<h3>Historical</h3>
<div id="historic">
<?php
	foreach($dir_arr as $dir) {
		if(preg_match("/\d+\.\d+/", $dir)) {
			echo "<a id='$dir' href='$dir'>$dir</a></br>";
		}
	}
?>
</div>

</body>
</html>
