<!DOCTYPE html>
<html>
<head>
    <title>Uppercase Textbox</title>
</head>
<body>
    <label for="textBox">Enter Text:</label>
    <input type="text" id="textBox"  oninput="convertToUpperCase(this)">

    <script>
        function convertToUpperCase() {
            // Get the input element
            const textBox = document.getElementById('textBox');

            // Add an event listener for the input event
            textBox.addEventListener('input', function() {
                // Convert the entered text to uppercase
                this.value = this.value.toUpperCase();
            });
        }

        // Call the function to enable the functionality
        convertToUpperCase();
    </script>
</body>
</html>
