<label for="class">Select a class:</label>
<select id="class" onchange="updateCouches()">
  <option value="">Please select a class</option>
  <option value="first">First Class</option>
  <option value="second">Second Class</option>
  <option value="third">Third Class</option>
</select>

<label for="couch">Select a couch:</label>
<select id="couch" onchange="updateBerths()">
  <option value="">Please select a class first</option>
</select>

<label for="berth">Select a berth:</label>
<select id="berth" disabled>
  <option value="">Please select a couch first</option>
</select>

<script>
function updateCouches() {
  var classSelection = document.getElementById("class").value;
  var couchSelection = document.getElementById("couch");
  couchSelection.disabled = false;
  couchSelection.innerHTML = ""; // clear the couch selection options
  
  if (classSelection === "first") {
    couchSelection.options.add(new Option("H1", "H1"));
    couchSelection.options.add(new Option("H2", "H2"));
    couchSelection.options.add(new Option("H3", "H3"));
  } else if (classSelection === "second") {
    couchSelection.options.add(new Option("S1", "S1"));
    couchSelection.options.add(new Option("S2", "S2"));
    couchSelection.options.add(new Option("S3", "S3"));
  } else if (classSelection === "third") {
    couchSelection.options.add(new Option("T1", "T1"));
    couchSelection.options.add(new Option("T2", "T2"));
    couchSelection.options.add(new Option("T3", "T3"));
  } else {
    couchSelection.disabled = true;
    couchSelection.options.add(new Option("Please select a class first", ""));
  }
  
  // reset the berth selection and disable it
  var berthSelection = document.getElementById("berth");
  berthSelection.disabled = true;
  berthSelection.innerHTML = "";
  berthSelection.options.add(new Option("Please select a couch first", ""));
}

function updateBerths() {
  var couchSelection = document.getElementById("couch").value;
  var berthSelection = document.getElementById("berth");
  berthSelection.disabled = false;
  berthSelection.innerHTML = ""; // clear the berth selection options
  
  if (couchSelection === "S1" || couchSelection === "S2" || couchSelection === "S3") {
    berthSelection.options.add(new Option("Lower Berth", "Lower"));
    berthSelection.options.add(new Option("Middle Berth", "Middle"));
    berthSelection.options.add(new Option("Upper Berth", "Upper"));
  } 
  else {
    berthSelection.disabled = true;
    berthSelection.options.add(new Option("Please select a sleeper couch", ""));
  }
}
</script>
