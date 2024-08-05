// Import the required modules
const mysql = require('mysql2'); // Import the MySQL for Node.js library
const credentials = require('./credentials'); // Import database credentials

// Create a new database connection
const db = mysql.createConnection({
    host: credentials.hostname,        // Hostname from the credentials file
    user: credentials.username,        // Username from the credentials file
    password: credentials.password,    // Password from the credentials file
    database: credentials.databasename // Database name from the credentials file
});

// Connect to the database
db.connect(err => {
    if (err) {
        // Log an error message if the connection fails
        console.error('Error connecting to the database:', err);
        return;
    }
    // Log a success message if the connection is successful
    console.log('Connected to the MySQL database.');
});

// Export the database connection
module.exports = db;
