// Import the required modules
const express = require('express')
const router = express.Router();
const connection = require('../db');

// Define base SQL queries to be used later
const baseQuery = "select c.clinic_id as id, c.clinic_name as clinicName, c.doctor_name as doctorName, c.contact_number as contactNumber, a.street_name as streetName, a.city, a.state, a.pincode from pet_clinic as c join address as a on a.address_id = c.address_id";

// Route to fetch all records
router.get('/', (req, res) => {
    const sql_query = baseQuery+";";

    // Execute the SQL query
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }

        const modifiedResult = results.map(row => ({
            clinicId: row.id.toString(),  // Convert the id to string
            name: row.clinicName,
            doctorName: row.doctorName,
            state: row.state,
            city: row.city,
            // Assuming you have a default or fixed image path. Adjust if it's dynamic
            image: "../resources/images/clinic"+(Math.floor(Math.random() * 5) + 1)+".jpg", 
            address: `${row.streetName}, ${row.city}, ${row.state}, ${row.pincode}`,
            contactNo: row.contactNumber.toString()  // Convert the contactNumber to string
        }));

        res.json(modifiedResult);
    });
});

// Route to fetch records by ID
router.get('/id', (req, res) => {
    const userId = req.query.id;
    const sql_query = baseQuery+" where c.clinic_id = " + userId + ";";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        const modifiedResult = results.map(row => ({
            clinicId: row.id.toString(),  // Convert the id to string
            name: row.clinicName,
            doctorName: row.doctorName,
            state: row.state,
            city: row.city,
            image: "../resources/images/clinic"+(Math.floor(Math.random() * 5) + 1)+".jpg", 
            address: `${row.streetName}, ${row.city}, ${row.state}, ${row.pincode}`,
            contactNo: row.contactNumber.toString()  // Convert the contactNumber to string
        }));

        res.json(modifiedResult);
    });
});

// Route to fetch records by name
router.get('/name', (req, res) => {
    const clinicName = req.query.name;
    const sql_query = baseQuery+" where c.clinic_name LIKE '" + clinicName + "%' OR c.clinic_name LIKE '%"+clinicName+"' OR c.clinic_name LIKE '%"+clinicName+"%';";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        const modifiedResult = results.map(row => ({
            clinicId: row.id.toString(),  // Convert the id to string
            name: row.clinicName,
            doctorName: row.doctorName,
            state: row.state,
            city: row.city,
            image: "../resources/images/clinic"+(Math.floor(Math.random() * 5) + 1)+".jpg", 
            address: `${row.streetName}, ${row.city}, ${row.state}, ${row.pincode}`,
            contactNo: row.contactNumber.toString()  // Convert the contactNumber to string
        }));
        res.json(modifiedResult);
    });
});

// Route to fetch records by city name
router.get('/city', (req, res) => {
    const city = req.query.city;
    const sql_query = baseQuery+" where a.city LIKE '" + city + "%' OR a.city LIKE '%"+city+"' OR a.city LIKE '%"+city+"%';"
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        const modifiedResult = results.map(row => ({
            clinicId: row.id.toString(),  // Convert the id to string
            name: row.clinicName,
            doctorName: row.doctorName,
            state: row.state,
            city: row.city,
            image: "../resources/images/clinic"+(Math.floor(Math.random() * 5) + 1)+".jpg", 
            address: `${row.streetName}, ${row.city}, ${row.state}, ${row.pincode}`,
            contactNo: row.contactNumber.toString()  // Convert the contactNumber to string
        }));

        res.json(modifiedResult);
    });
});

// Route to fetch records by entering the state name
router.get('/state', (req, res) => {
    const state = req.query.state;
    const sql_query = baseQuery+" where a.state LIKE '" + state + "%' OR a.state LIKE '%"+state+"' OR a.state LIKE '%"+state+"%';"
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        const modifiedResult = results.map(row => ({
            clinicId: row.id.toString(),  // Convert the id to string
            name: row.clinicName,
            doctorName: row.doctorName,
            state: row.state,
            city: row.city,
            image: "../resources/images/clinic"+(Math.floor(Math.random() * 5) + 1)+".jpg", 
            address: `${row.streetName}, ${row.city}, ${row.state}, ${row.pincode}`,
            contactNo: row.contactNumber.toString()  // Convert the contactNumber to string
        }));
        res.json(modifiedResult);
    });
});

// Export the router to be used in other modules
module.exports = router;