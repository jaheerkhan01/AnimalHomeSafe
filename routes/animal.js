// Import necessary modules
const express = require('express')
const router = express.Router();

// Database connection
const connection = require('../db');

const baseQuery = "select a.animal_id as id, a.animal_name, a.common_animal_name as common_name, a.breed, a.description_info as description, a.allergens, a.size, a.diet_plan, a.gender, a.max_temp_of_survival, a.min_temp_of_survival, a.isDomestic, a.imageURL from ANIMAL as a";

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

//  Fetch Animal Information by id
router.get('/id', (req, res) => {
    const animalId = req.query.animal_id;
    const sql_query = baseQuery+" where a.animal_id = " + animalId + ";";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        res.json(results);
    });
});

//  Fetch Animal Information by their name
router.get('/animal_name', (req, res) => {
    const animalName = req.query.animal_name;
    const sql_query = baseQuery+" where a.animal_name LIKE '" + animalName + "%' OR a.animal_name LIKE '%"+animalName+"' OR a.animal_name LIKE '%"+animalName+"%';";
     connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        res.json(results);
    });
});

// Fetch Guidelines of particular stray animal required in stray management module
const base_Query2 = 'SELECT Guidelines FROM StrayAnimalGuidelines'
router.get('/strayAnimals', (req, res) => {
    const animal_name = req.query.strayAnimals; 
    const sql_query = base_Query2 + " where AnimalType = '" + animal_name+ "'"; 
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        res.json(results);
    });
});

//  Fetch Animal Information by common name
router.get('/common_name', (req, res) => {
    const commonName = req.query.common_name;
    const sql_query = baseQuery+" where a.common_animal_name LIKE '" + commonName + "%' OR a.common_animal_name LIKE '%"+commonName+"' OR a.common_animal_name LIKE '%"+commonName+"%';";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        res.json(results);
    });
});

//  Fetch Animal Information by their breed
router.get('/breed', (req, res) => {
    const breed = req.query.breed;
    const sql_query = baseQuery+" where a.breed LIKE '" + breed + "%' OR a.breed LIKE '%"+breed+"' OR a.breed LIKE '%"+breed+"%';";
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