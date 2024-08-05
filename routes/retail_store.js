// Import the required modules
const express = require('express')
const router = express.Router();
const connection = require('../db');

// Define base SQL queries to be used later
const baseQuery = "select rs.shop_id as id, rs.shop_name as shop_name, rs.owner_name as owner_name, rs.contact_number as contact_number, adr.street_name as street_name, adr.city as city, adr.state as state, adr.pincode from retail_store as rs join address as adr on adr.address_id = rs.address_id";

// Get all the stores
router.get('/', (req, res) => {
    const sql_query = baseQuery+";";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        // Transforming the results to the desired format
        const modifiedData = results.map(result => ({
            storeId: result.id.toString(), // Convert the id to a string format
            storeName: result.shop_name,
            ownerName: result.owner_name,
            state: result.state,
            city: result.city,
            image: "../resources/images/store"+(Math.floor(Math.random() * 8) + 1)+".jpg",
            address: `${result.street_name}, ${result.city} - ${result.pincode}`,
            contactNo: result.contact_number.toString() // Convert the contact number to a string format
        }));

        res.json(modifiedData);
    });
});

// get the stores by id
router.get('/id', (req, res) => {
    const userId = req.query.id;
    const sql_query = baseQuery+" and rs.shop_id = " + userId + ";";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
       const modifiedData = results.map(result => ({
            storeId: result.id.toString(), // Convert the id to a string format
            storeName: result.shop_name,
            ownerName: result.owner_name,
            state: result.state,
            city: result.city,
            image: "../resources/images/store"+(Math.floor(Math.random() * 8) + 1)+".jpg",
            address: `${result.street_name}, ${result.city} - ${result.pincode}`,
            contactNo: result.contact_number.toString() // Convert the contact number to a string format
        }));
        res.json(modifiedData);
    });
});

// Get stores by searching city or part of city name
router.get('/city', (req, res) => {
    const city_name = req.query.city;
    const sql_query = baseQuery+" where adr.city LIKE '" + city_name + "%' OR adr.city LIKE '%"+city_name+"' OR adr.city LIKE '%"+city_name+"%';";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        const modifiedData = results.map(result => ({
            storeId: result.id.toString(), // Convert the id to a string format
            storeName: result.shop_name,
            ownerName: result.owner_name,
            state: result.state,
            city: result.city,
            image: "../resources/images/store"+(Math.floor(Math.random() * 8) + 1)+".jpg",
            address: `${result.street_name}, ${result.city} - ${result.pincode}`,
            contactNo: result.contact_number.toString() // Convert the contact number to a string format
        }));

        res.json(modifiedData);
    });
});

// Get stores details by state name
router.get('/state', (req, res) => {
    const state_name = req.query.state;
    console.log(state_name)
    const sql_query = baseQuery+" where adr.state LIKE '" + state_name + "%' OR adr.state LIKE '%"+state_name+"' OR adr.state LIKE '%"+state_name+"%';";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        console.log(results);
        const modifiedData = results.map(result => ({
            storeId: result.id.toString(), // Convert the id to a string format
            storeName: result.shop_name,
            ownerName: result.owner_name,
            state: result.state,
            city: result.city,
            image: "../resources/images/store"+(Math.floor(Math.random() * 8) + 1)+".jpg",
            address: `${result.street_name}, ${result.city} - ${result.pincode}`,
            contactNo: result.contact_number.toString() // Convert the contact number to a string format
        }));

        res.json(modifiedData);
    });
});

// Get the store details by searching their store name 
router.get('/store_name', (req, res) => {
    const storeName = req.query.store_name;
    const sql_query = "select rs.shop_id as id, rs.shop_name as shop_name, rs.owner_name as owner_name, rs.contact_number as contact_number, adr.street_name as street_name, adr.city as city, adr.state as state, adr.pincode from retail_store as rs join address as adr on adr.address_id = rs.address_id"+" where rs.shop_name LIKE '" + storeName + "%' OR rs.shop_name LIKE '%"+storeName+"' OR rs.shop_name LIKE '%"+storeName+"%';";
    connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        console.log(results);
        const modifiedData = results.map(result => ({
            storeId: result.id.toString(), // Convert the id to a string format
            storeName: result.shop_name,
            ownerName: result.owner_name,
            state: result.state,
            city: result.city,
            image: "../resources/images/store"+(Math.floor(Math.random() * 8) + 1)+".jpg",
            address: `${result.street_name}, ${result.city} - ${result.pincode}`,
            contactNo: result.contact_number.toString() // Convert the contact number to a string format
        }));
        res.json(modifiedData);
    });
});

// Get the store details by searching for the product you want and find all the stores that has that product you are searching   
router.get('/product_name',(req,res) =>{
    const productName = req.query.product_name;
    const customQuery = `select  rs.shop_id as id, rs.shop_name as shop_name, rs.owner_name as owner_name, rs.contact_number as contact_number, adr.street_name as street_name, adr.city as city, adr.state as state, adr.pincode from PRODUCTS_LIST_OF_ALL_SHOPS list join PRODUCT p join RETAIL_STORE rs join ADDRESS adr on list.product_id = p.product_id and rs.shop_id = list.shop_id and rs.address_id = adr.address_id where p.product_name Like '%${productName}' or p.product_name like '${productName}%' or p.product_name Like '%${productName}%';`;

    connection.query(customQuery, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        const modifiedData = results.map(result => ({
            storeId: result.id.toString(), // Convert the id to a string format
            storeName: result.shop_name,
            ownerName: result.owner_name,
            state: result.state,
            city: result.city,
            image: "../resources/images/store" + (Math.floor(Math.random() * 8) + 1) + ".jpg",
            address: `${result.street_name}, ${result.city} - ${result.pincode}`,
            contactNo: result.contact_number.toString() // Convert the contact number to a string format
        }));
        res.json(modifiedData);
    });
})

router.get('/id/products',(req,res) => {
    const shop_id = req.query.shop_id;
    const sql_query = 'select p.product_id as id, p.product_name as name, p.product_description as description, p.cost, p.category as category from PRODUCTS_LIST_OF_ALL_SHOPS as list join PRODUCT as p on p.product_id = list.product_id where list.shop_id = '+ shop_id + ';';
     connection.query(sql_query, (err, results) => {
        if (err) {
            console.error('Error fetching data:', err);
            res.send('Error fetching data from database');
            return;
        }
        res.json(results);
    });
});

// Export the router to be used in other modules
module.exports = router;

