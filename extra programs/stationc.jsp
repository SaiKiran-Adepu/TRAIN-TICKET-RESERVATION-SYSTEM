<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data List Example</title>
</head>
<body>

<form id="myForm">
    <label for="station">Station Name:</label>
    <input type="text" id="station" name="station" list="stations">
    <datalist id="stations">
        <option value="Station A">
        <option value="Station B">
        <option value="Station C">
        <option value="Station D">
    </datalist>
    <br>
    <label for="selectedStations">Selected Stations:</label>
    <input type="text" id="selectedStations" name="selectedStations" readonly>
    <br>
    <input type="button" value="Add Station" onclick="addStation()">
</form>

<script>
function addStation() {
    var stationInput = document.getElementById('station');
    var selectedStationsInput = document.getElementById('selectedStations');
    
    if (selectedStationsInput.value !== '') {
        selectedStationsInput.value += ', ' + stationInput.value;
    } else {
        selectedStationsInput.value = stationInput.value;
    }
    stationInput.value = '';
}
</script>

</body>
</html>
