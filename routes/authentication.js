// Import required modules
const express = require('express');
const router = express.Router();

// Import database connection
const connection = require('../db');

// Middleware for parsing JSON bodies
router.use(express.json());

// Initialize session object
var session = {"email": "", "password": ""};

// Handle POST request for user login
router.post('/login', (req, res) => {
    // Extract email and password from request body
    const email = req.body.email;
    const password = req.body.password;

    // SQL query to fetch login credentials
    const query = "SELECT * FROM login_credentials WHERE email = '" + email + "'";
    
    // Execute query
    connection.query(query, (err, results) => {
        // Handle query errors
        if (err) {
            console.error('Error fetching data:', err);
            return results;
        }
        
        // Check if email exists
        if (results.length === 0) {
            return res.status(401).json({ status: 'Invalid Credentials' });
        }
        
        // Validate password
        const user = results[0];
        const match = (password == user.password);

        if (!match) {
            return res.status(401).json({ status: 'Invalid credentials' });
        }
        
        // Set session variables
        session.email = email;
        session.password = password;
        
        res.status(200).json({ status: 'Logged in successfully' });
    });
});

// Handle POST request for user sign-up
router.post('/signUp', (req, res) => {
    // Extract user details from request body
    const name = req.body.name;
    const email = req.body.email;
    const password = req.body.password;
    const contact = req.body.contact;

    // SQL query to check if email already exists
    const query = "SELECT * FROM login_credentials WHERE email = '" + email + "'";

    // Execute query
    connection.query(query, (err, results) => {
        // Handle query errors
        if (err) {
            console.error('Error fetching data:', err);
            return results;
        }
        
        // Check for duplicate email
        if (results.length !== 0) {
            return res.status(401).json({ status: 'Email already exists' });
        } 
    });

    // SQL query to add new user
    const procedureQuery = `CALL AddCustomerAndCredentials('${name}', '${contact}', '${email}', '${password}');`;

    // Execute query
    connection.query(procedureQuery, (err, results) => {
        if (err) {
            return results;
        } else {
            return res.status(200).json({ status: 'Account created successfully' });
        }
    });
});

// Handle GET request for fetching user session credentials
router.get('/userCredentials', (req, res) => {
    // Check if user is logged in by verifying session variables
    if (session.email.length > 0 && session.password.length > 0) {
        // Return the user credentials stored in the session
        res.status(200).json({
            email: session.email,
            password: session.password,
            status: 'User is logged in'
        });
    } else {
        // User is not logged in if session variables are not set
        res.status(401).json({
            status: 'User is not logged in'
        });
    }
});

// Export router to be used in other files
module.exports = router;
