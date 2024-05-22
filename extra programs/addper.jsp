<!DOCTYPE html>
<html>
<head>
    <title>Train Reservation</title>
</head>
<body>
    <form onsubmit="return login(this);">
        <label for="ad">ADULT:</label>
        <input type="text" id="ad" value="1" name="ad" readonly>
        <input type="button" value="+Add Passenger" id="aad" onclick="addPassenger()" />
        <input type="button" value="-Remove Passenger" id="rad" onclick="removePassenger()"/><br>
        <input type="submit" value="Submit">
    </form>

    <script>
        let personCount = 1;

        function addPassenger() {
            personCount++;
            document.getElementById('ad').value = personCount;
            document.getElementById('rad').disabled = false;
        }

        function removePassenger() {
            if (personCount > 1) {
                personCount--;
                document.getElementById('ad').value = personCount;
            }
            if (personCount === 1) {
                document.getElementById('rad').disabled = true;
            }
        }

        function login(form) {
            var tyc = document.getElementById("tyc").value;
            var pname = document.getElementById("pname").value;
            var page = document.getElementById("page").value;
            var ad = document.getElementById("ad").value;
            var ch = document.getElementById("ch").value;
            var couch = document.getElementById("couch").value;
            var berth = document.getElementById("berth").value;
            var r = confirm("Are you ready for train reservation?");
        
            if (tyc == '') {
                alert("Please select Type of Class.");
                return false;
            } else if (pname == '') {
                alert("Please Enter Passenger Name.");
                return false;
            } else if (page == '') {
                alert("Please Enter Passenger Age.");
                return false;
            } else if (ad == '') {
                alert("Please Select No of Adults.");
                return false;
            } else if (ch == '') {
                alert("Please Select No of Children.");
                return false;
            } else if (couch == '') {
                alert("Please Select Couch.");
                return false;
            } else if (berth == '') {
                alert("Please Select Berth/Seat.");
                return false;
            }
            if (r == true) {
                // Reservation confirmed
            } else {
                alert("RESERVATION DECLINED");
                return false;
            }
        }
    </script>
</body>
</html>
