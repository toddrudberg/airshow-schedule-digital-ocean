const express = require('express');
const fs = require('fs');
const path = require('path');
const app = express();
const PORT = 3000;

// Route to display airshow data
app.get('/airshows', (req, res) => {
    // Read the airshows.txt file
    const filePath = path.join(__dirname, 'airshows.txt');
    
    // Read the file asynchronously
    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            // Send an error response if the file can't be read
            return res.status(500).send('Error reading file.');
        }

        // Send the file content as the response
        res.send(`<pre>${data}</pre>`); // Use <pre> to maintain formatting
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
