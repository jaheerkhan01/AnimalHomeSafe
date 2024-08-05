// Import necessary modules
const express = require('express')
const router = express.Router();

// Database connection
const connection = require('../db');

const baseQuery = "select ac.id, ac.name, ac.contact_number, ad.street_name, ad.city, ad.state, ad.pincode from ADOPTION_CENTER as ac join ADDRESS as ad on ac.address_id = ad.address_id";

const baseQuery2 = "select a.common_animal_name as common_name, a.breed, a.size, a.description_info as description, list.animal_count as count from ANIMALS_LIST_IN_ADOPTION_CENTERS as list join ANIMAL as a on a.animal_id = list.animal_id where list.center_id = ";

// Endpoint to get information of all adoption centers
router.get('/', (req, res) => {
    const sql_query = baseQuery+";";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        res.json(results);
    });
});

// Endpoint to get information of an adoption center by its ID
router.get('/id', (req, res) => {
    const adoptionCenterId = req.query.adoption_center_id;
    const sql_query = baseQuery+" where ac.id = " + adoptionCenterId + ";";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        res.json(results);
    });
});

// Endpoint to get information of an adoption center by its name
router.get('/adoption_center_name', (req, res) => {
    const adoptionCenterName = req.query.adoption_center_name;
    const sql_query = baseQuery + " where ac.name LIKE '" + adoptionCenterName + "%' OR ac.name LIKE '%" + adoptionCenterName + "' OR ac.name LIKE '%" + adoptionCenterName +"%';";
     connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        res.json(results);
    });
});

// Endpoint to get adoption centers based on common animal names
router.get('/common_name', (req, res) => {
    const commonName = req.query.common_name;
    const sql_query = `select ac.id, ac.name, ac.contact_number, adr.street_name, adr.city, adr.state, adr.pincode from ANIMALS_LIST_IN_ADOPTION_CENTERS list join ANIMAL a join ADOPTION_CENTER ac join ADDRESS adr on list.animal_id = a.animal_id and list.center_id = ac.id and ac.address_id = adr.address_id where a.common_animal_name Like '%${commonName}' or a.common_animal_name like '${commonName}%' or a.common_animal_name Like '%${commonName}%';`;
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        res.json(results);
    });
});

// Endpoint to get adoption centers based on city
router.get('/city', (req, res) => {
    const city = req.query.city;
    const sql_query = baseQuery + " where ad.city LIKE '" + city + "%' OR ad.city LIKE '%" + city + "' OR ad.city LIKE '%" + city +"%';";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        res.json(results);
    });
});

// Endpoint to get adoption centers based on state
router.get('/state', (req, res) => {
    const state = req.query.state;
    const sql_query = baseQuery + " where ad.state LIKE '" + state + "%' OR ad.state LIKE '%" + state + "' OR ad.state LIKE '%" + state +"%';";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        res.json(results);
    });
});

router.get('/id/animals', (req,res) => {
    const id = req.query.adoption_center_id;
    const sql_query = baseQuery2+id+";";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        res.json(results);
    });
});

// Export router to be used in other files
module.exports = router;