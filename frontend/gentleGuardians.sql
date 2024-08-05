create database GentleGuardians;
use GentleGuardians;


-- creating basic tables
CREATE TABLE ADDRESS (
  address_id INTEGER NOT NULL PRIMARY KEY, 
  street_name VARCHAR(255),
  city VARCHAR(25), 
  state VARCHAR(25), 
  pincode INTEGER
);

CREATE TABLE PRODUCT (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    product_description TEXT,
    cost DECIMAL(10, 2),
    category VARCHAR(255)
);



CREATE TABLE RETAIL_STORE (
  shop_id INTEGER PRIMARY KEY,
  shop_name VARCHAR(25),
  owner_name VARCHAR(25),
  contact_number INTEGER,
  address_id INTEGER,
  FOREIGN KEY (address_id) REFERENCES ADDRESS(address_id)
);

CREATE TABLE PET_CLINIC (
  clinic_id INTEGER PRIMARY KEY,
  clinic_name VARCHAR(50),
  doctor_name VARCHAR(50),
  contact_number INTEGER,
  address_id INTEGER,
  FOREIGN KEY (address_id) REFERENCES ADDRESS(address_id)
);

CREATE TABLE CUSTOMER (
  customer_id INTEGER PRIMARY KEY,
  name VARCHAR(25),
  email VARCHAR(25),
  address_id INTEGER,
  contact_number VARCHAR(15),
  sponsor BOOLEAN,
  sponsor_amount INTEGER,
  FOREIGN KEY (address_id) REFERENCES ADDRESS(address_id)
);

CREATE TABLE ANIMAL_PLACE (
  place_id INTEGER PRIMARY KEY,
  name VARCHAR(50),
  address_id INTEGER,
  type_of_place VARCHAR(50),
  FOREIGN KEY (address_id) REFERENCES ADDRESS(address_id)
);

select * from ANIMAL_PLACE JOIN ADDRESS WHERE ADDRESS.address_id = ANIMAL_PLACE.address_id order by rand() limit 5;

CREATE TABLE PRODUCTS_LIST_OF_ALL_SHOPS (
  product_id INTEGER,
  shop_id INTEGER,
  FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
  FOREIGN KEY (shop_id) REFERENCES RETAIL_STORE(shop_id),
  PRIMARY KEY (shop_id, product_id)
);

-- drop table ANIMALS_LIST_IN_ALL_PLACES;



-- Product Data
INSERT INTO ADDRESS (address_id, street_name, city, state, pincode) VALUES
(1, 'MG Road', 'Bangalore', 'Karnataka', 560001),
(2, 'Anna Salai', 'Chennai', 'Tamil Nadu', 600002),
(3, 'Park Street', 'Kolkata', 'West Bengal', 700016),
(4, 'Connaught Place', 'New Delhi', 'Delhi', 110001),
(5, 'FC Road', 'Pune', 'Maharashtra', 411004),
(6, 'Hill Road', 'Mumbai', 'Maharashtra', 400050),
(7, 'Lal Darwaza', 'Ahmedabad', 'Gujarat', 380001),
(8, 'Ashok Marg', 'Lucknow', 'Uttar Pradesh', 226001),
(9, 'Jubilee Hills', 'Hyderabad', 'Telangana', 500033),
(10, 'Pantheon Road', 'Chennai', 'Tamil Nadu', 600008);

-- Inserting Sample Data for National Parks
INSERT INTO ADDRESS (address_id, street_name, city, state, pincode) VALUES
(11, 'Forest Lane', 'Sawai Madhopur', 'Rajasthan', 322001),   -- Ranthambore National Park
(12, 'Jungle Road', 'Chhindwara', 'Madhya Pradesh', 480001),  -- Pench National Park
(13, 'Safari Avenue', 'Umaria', 'Madhya Pradesh', 484661),   -- Bandhavgarh National Park
(14, 'Wild Trail', 'Kullu', 'Himachal Pradesh', 175131),     -- Great Himalayan National Park
(15, 'Tiger Path', 'Kozhikode', 'Kerala', 673596);           -- Silent Valley National Park

-- Inserting Sample Data for Zoos
INSERT INTO ADDRESS (address_id, street_name, city, state, pincode) VALUES
(16, 'Zoo Road', 'Hyderabad', 'Telangana', 500064),          -- Nehru Zoological Park
(17, 'Animal Street', 'Kolkata', 'West Bengal', 700053),     -- Alipore Zoological Gardens
(18, 'Safari Lane', 'Delhi', 'Delhi', 110003),               -- National Zoological Park
(19, 'Wildlife Way', 'Lucknow', 'Uttar Pradesh', 226007),    -- Lucknow Zoo
(20, 'Birds Boulevard', 'Mysuru', 'Karnataka', 570011);      -- Mysuru Zoo

-- Inserting Sample Data for Customer Addresses
INSERT INTO ADDRESS (address_id, street_name, city, state, pincode) VALUES
(71, 'Brigade Road', 'Bangalore', 'Karnataka', 560025),
(72, 'Greams Road', 'Chennai', 'Tamil Nadu', 600006),
(73, 'Elgin Road', 'Kolkata', 'West Bengal', 700020),
(74, 'Karol Bagh', 'New Delhi', 'Delhi', 110005),
(75, 'JM Road', 'Pune', 'Maharashtra', 411004),
(76, 'Veera Desai Road', 'Mumbai', 'Maharashtra', 400053),
(77, 'C.G. Road', 'Ahmedabad', 'Gujarat', 380006),
(78, 'Gomti Nagar', 'Lucknow', 'Uttar Pradesh', 226010),
(79, 'Madhapur', 'Hyderabad', 'Telangana', 500081),
(80, 'Besant Nagar', 'Chennai', 'Tamil Nadu', 600090),
(81, 'Vittal Mallya Road', 'Bangalore', 'Karnataka', 560001),
(82, 'T. Nagar', 'Chennai', 'Tamil Nadu', 600017),
(83, 'Ballygunge', 'Kolkata', 'West Bengal', 700019),
(84, 'Rajouri Garden', 'New Delhi', 'Delhi', 110027),
(85, 'Aundh', 'Pune', 'Maharashtra', 411007),
(86, 'Juhu Tara Road', 'Mumbai', 'Maharashtra', 400049),
(87, 'Maninagar', 'Ahmedabad', 'Gujarat', 380008),
(88, 'Hazratganj', 'Lucknow', 'Uttar Pradesh', 226001),
(89, 'Banjara Hills', 'Hyderabad', 'Telangana', 500034),
(90, 'Adyar', 'Chennai', 'Tamil Nadu', 600020),
(91, 'Koramangala', 'Bangalore', 'Karnataka', 560034),
(92, 'Borivali West', 'Mumbai', 'Maharashtra', 400092),
(93, 'Chandni Chowk', 'New Delhi', 'Delhi', 110006),
(94, 'Salt Lake', 'Kolkata', 'West Bengal', 700091),
(95, 'Kothrud', 'Pune', 'Maharashtra', 411038),
(96, 'Vastrapur', 'Ahmedabad', 'Gujarat', 380054),
(97, 'Vikaspuri', 'New Delhi', 'Delhi', 110018),
(98, 'Malleswaram', 'Bangalore', 'Karnataka', 560003),
(99, 'Begumpet', 'Hyderabad', 'Telangana', 500016),
(100, 'Alambagh', 'Lucknow', 'Uttar Pradesh', 226005);


-- --------------
-- Product Data
INSERT INTO PRODUCT (product_id, product_name, product_description, cost, category) VALUES
(1, 'Dog Collar', 'Adjustable collar for medium-sized dogs', 300, 'Dog Accessory'),
(2, 'Catnip Toy', 'Interactive toy filled with catnip', 150, 'Cat Toy'),
(3, 'Bird Seed Mix', 'Nutritious mix of seeds for pet birds', 200, 'Bird Food'),
(4, 'Aquarium Filter', 'Filter for freshwater aquariums up to 50L', 900, 'Fish Accessory'),
(5, 'Hamster Wheel', 'Exercise wheel for hamsters and gerbils', 450, 'Hamster Accessory'),
(6, 'Horse Saddle', 'Leather saddle for riding horses', 7500, 'Horse Accessory'),
(7, 'Reptile Heat Lamp', 'Infrared heat lamp for reptile terrariums', 1100, 'Reptile Accessory'),
(8, 'Rabbit Hutch', 'Outdoor wooden hutch for rabbits', 3200, 'Rabbit Furniture'),
(9, 'Flea and Tick Shampoo', 'Shampoo for dogs to remove fleas and ticks', 500, 'Dog Care'),
(10, 'Turtle Food Pellets', 'Nutritious pellets for pet turtles', 280, 'Turtle Food'),
(11, 'Parrot Perch', 'Natural wood perch for large parrots', 650, 'Bird Accessory'),
(12, 'Kitten Litter', 'Clumping cat litter for kittens', 300, 'Cat Care'),
(13, 'Dog Bone Chew', 'Natural bone chew for dogs', 230, 'Dog Toy'),
(14, 'Fish Tank Decor', 'Artificial coral decoration for fish tanks', 750, 'Fish Decor'),
(15, 'Puppy Training Pads', 'Absorbent pads for puppy potty training', 400, 'Dog Care'),
(16, 'Guinea Pig Cage', 'Spacious cage with play area for guinea pigs', 2800, 'Guinea Pig Furniture'),
(17, 'Dog Leash', 'Durable leash for walking dogs', 350, 'Dog Accessory'),
(18, 'Cat Scratching Post', 'Post with sisal rope for cat scratching', 800, 'Cat Furniture'),
(19, 'Bird Bath', 'Hanging bath for garden birds', 650, 'Bird Accessory'),
(20, 'Dog Dental Treats', 'Treats to help reduce plaque in dogs', 500, 'Dog Care');


-- Inserting Additional Sample Data

INSERT INTO PRODUCT (product_id, product_name, product_description, cost, category) VALUES
(21, 'Squeaky Dog Toy', 'Rubber toy that squeaks when bitten', 280, 'Dog Toy'),
(22, 'Cat Feather Wand', 'Interactive toy with feathers for cats', 220, 'Cat Toy'),
(23, 'Dog Plush Teddy', 'Soft plush teddy bear for dogs', 400, 'Dog Toy'),
(24, 'Rope Tug Toy', 'Durable rope for tug-of-war games with dogs', 320, 'Dog Toy'),
(25, 'Cat Laser Pointer', 'Laser toy for cats to chase', 180, 'Cat Toy'),
(26, 'Bird Swing', 'Wooden swing for pet birds like parrots and finches', 250, 'Bird Accessory'),
(27, 'Hamster Ball', 'Transparent ball for hamster exploration', 290, 'Hamster Toy'),
(28, 'Pet Teepee', 'Cozy teepee-style resting place for cats or small dogs', 1400, 'Pet Furniture'),
(29, 'Dog Memory Foam Bed', 'Memory foam bed for elderly or arthritic dogs', 2500, 'Dog Bed'),
(30, 'Cat Window Perch', 'Secure perch for cats to observe from windows', 1100, 'Cat Furniture'),
(31, 'Rabbit Play Tunnel', 'Flexible tunnel for rabbits to play and hide', 650, 'Rabbit Toy'),
(32, 'Aquarium Cave', 'Decorative cave for fish to hide', 600, 'Fish Accessory'),
(33, 'Reptile Hideout', 'Shaded area for reptiles to rest and hide', 500, 'Reptile Accessory'),
(34, 'Bird Ladder', 'Wooden ladder for birds to climb and perch', 350, 'Bird Accessory'),
(35, 'Dog Puzzle Toy', 'Toy that dispenses treats as the dog solves the puzzle', 700, 'Dog Toy'),
(36, 'Interactive Cat Ball', 'Ball that moves and lights up, interactive for cats', 380, 'Cat Toy'),
(37, 'Wooden Pet House', 'Outdoor wooden shelter for cats or small dogs', 5000, 'Pet Furniture'),
(38, 'Self-Heating Pet Mat', 'Mat that reflects pet\'s heat, keeping them warm', 900, 'Pet Bed'),
(39, 'Dog Agility Kit', 'Set of hurdles and tunnels for dog agility training', 4500, 'Dog Training'),
(40, 'Catnip Spray', 'Spray to entice cats towards toys or scratch posts' , 250, 'Cat Accessory');



-- Inserting Retail Store Data
INSERT INTO RETAIL_STORE (shop_id, shop_name, owner_name, contact_number, address_id) VALUES
(1, 'PetMart', 'Rajesh Kumar', 98450, 3),
(2, 'Animal House', 'Sunita Patel', 98350, 75),
(3, 'Paws & Tails', 'Amit Roy', 983601, 15),
(4, 'Fluffy World', 'Anil Sharma', 98100, 91),
(5, 'Birds Paradise', 'Sheetal Desai', 98230, 8),
(6, 'Urban Paws', 'Vijay Mehta', 98240, 84),
(7, 'Pet Stop', 'Girish Jain', 98480, 12),
(8, 'Creature Comforts', 'Farida Khan', 98380, 19),
(9, 'Pet Essentials', 'Krishna Reddy', 98493, 73),
(10, 'Aquatic Wonders', 'Latha Nair', 984601, 2),
(11, 'Pet Plaza', 'Manoj Pillai', 98450, 79),
(12, 'Furry Friends', 'Harpreet Singh', 98350, 17),
(13, 'Pet Kingdom', 'Reena Bose', 98360, 90),
(14, 'Happy Tails', 'Rakesh Yadav', 98100, 14),
(15, 'Feathered Nest', 'Nandini Rao', 98230, 95),
(16, 'Puppy Palace', 'Sudhir Deshmukh', 98240, 6),
(17, 'Wild Whiskers', 'Lalita Kumari', 98480, 11),
(18, 'Fishy Affairs', 'Mohammad Iqbal', 98380, 96),
(19, 'Pet Oasis', 'Jyoti Agarwal', 98490, 20),
(20, 'Bunny Burrow', 'Karan Kapoor', 98460, 77),
(21, 'Critter Cottage', 'Vishal Goyal', 98450, 18),
(22, 'Reptile Realm', 'Ashima Sinha', 98350, 98),
(23, 'Purr-fect Pets', 'Dhananjay Chatterjee', 98360, 7),
(24, 'Canine Corner', 'Chandni Sahni', 98100, 99),
(25, 'Birdie Boutique', 'Tara Joshi', 98230, 5),
(26, 'Aquarium Arcade', 'Devendra Bhatt', 98240, 16),
(27, 'Whiskers & Wag', 'Nikhil Menon', 98480, 93),
(28, 'Pet Pantry', 'Shubhangi Kulkarni', 98380, 10),
(29, 'Wild Woofs', 'Irfan Qureshi', 98490, 71),
(30, 'Feather & Fur', 'Simran Malhotra', 98460, 9),
(31, 'Buddy Bazaar', 'Parveen Malik', 98450, 86),
(32, 'Critter Castle', 'Jasmeet Dhillon', 98350, 92),
(33, 'Pawfect Store', 'Varun Trivedi', 98360, 4),
(34, 'Moggy Market', 'Preeti Dubey', 98100, 13),
(35, 'Beastly Bazaar', 'Kishore Nanavati', 98230, 74),
(36, 'Birdsong Boutique', 'Meena Swaminathan', 982401, 83),
(37, 'Fauna Fair', 'Zaheer Sheikh', 98480, 97),
(38, 'Reptile Ritz', 'Lavanya Raghav', 98380, 89);

-- Inserting Sample Data for retail stores
-- Table creation (for reference)



-- Inserting Sample Data fir pet_clinics
INSERT INTO PET_CLINIC (clinic_id, clinic_name, doctor_name, contact_number, address_id) VALUES
(1, 'PetWell Clinic', 'Dr. Rahul Sharma', 12345, 1),
(2, 'Healthy Paws Veterinary', 'Dr. Priya Desai', 54321, 2),
(3, 'VetCare Center', 'Dr. Arvind Patel', 23456, 3),
(4, 'Companion Care', 'Dr. Sunita Ray', 65432, 4),
(5, 'Animal Heal Hospital', 'Dr. Rakesh Mehta', 34567, 5),
(6, 'Urban Vet Clinic', 'Dr. Reena Pillai', 76543, 6),
(7, 'Paws & Whiskers Veterinary', 'Dr. Rajan Kapoor', 45678, 7),
(8, 'Nature Vet Clinic', 'Dr. Nalini Joshi', 87654, 8),
(9, 'Four-legged Friends Clinic', 'Dr. Omkar Bhatt', 56789, 9),
(10, 'Animal Kingdom Vet', 'Dr. Latha Krishnan', 98765, 10),
(11, 'Happy Tails Veterinary', 'Dr. Manish Yadav', 67890, 71),
(12, 'FaunaCare Center', 'Dr. Preeti Ghosh', 98760, 72),
(13, 'Animal Wellness Hospital', 'Dr. Tapan Sen', 67895, 73),
(14, 'LifeCare Vet Clinic', 'Dr. Vikas Nair', 12340, 74),
(15, 'Heart & Paw Veterinary', 'Dr. Sheetal Rane', 54310, 75),
(16, 'Animal Life Clinic', 'Dr. Suresh Agarwal', 23450, 76),
(17, 'GreenPaws Vet Care', 'Dr. Karuna Chatterjee', 65410, 77),
(18, 'Feather & Fur Veterinary', 'Dr. Irfan Qureshi', 34560, 78),
(19, 'Family Pet Clinic', 'Dr. Varsha Khanna', 76510, 79),
(20, 'City Pet Hospital', 'Dr. Bhavna Mistry', 45670, 80),
(21, 'Care & Cure Veterinary', 'Dr. Anirban Bose', 87650, 81),
(22, 'Trusty Tails Clinic', 'Dr. Chandrika Deshmukh', 56780, 82),
(23, 'Pawsitive Vet Care', 'Dr. Dipak Raut', 98750, 83),
(24, 'VetFriend Clinic', 'Dr. Mohini Patil', 67850, 84),
(25, 'Four Paws Vet Hospital', 'Dr. Prakash Verma', 12330, 85),
(26, 'AnimalGuard Clinic', 'Dr. Ranjana Sinha', 54320, 86),
(27, 'Pawfect Health Veterinary', 'Dr. Govind Rajan', 23440, 87),
(28, 'Feathered Friend Vet', 'Dr. Simran Kaur', 65420, 88),
(29, 'Healthy Tails Clinic', 'Dr. Dhruv Sharma', 34550, 89),
(30, 'SafePaws Veterinary', 'Dr. Ritu Agrawal', 76520, 90);





-- customer details : 
INSERT INTO CUSTOMER (customer_id, name, email, address_id, contact_number, sponsor, sponsor_amount) VALUES
(1, 'Rajesh Kumar', 'rajesh@email.com', 5, '9845012345', TRUE, 500),
(2, 'Sunita Patel', 'sunita@email.com', 73, '9835012346', FALSE, NULL),
(3, 'Amit Roy', 'amit@email.com', 13, '9836012347', TRUE, 300),
(4, 'Anil Sharma', 'anil@email.com', 80, '9810012348', FALSE, NULL),
(5, 'Sheetal Desai', 'sheetal@email.com', 17, '9823012349', TRUE, 250),
(6, 'Vijay Mehta', 'vijay@email.com', 4, '9824012350', TRUE, 1000),
(7, 'Girish Jain', 'girish@email.com', 86, '9848012351', FALSE, NULL),
(8, 'Farida Khan', 'farida@email.com', 2, '9838012352', TRUE, 450),
(9, 'Krishna Reddy', 'krishna@email.com', 71, '9849012353', FALSE, NULL),
(10, 'Latha Nair', 'latha@email.com', 9, '9846012354', TRUE, 750),
(11, 'Manoj Pillai', 'manoj@email.com', 15, '9845012355', TRUE, 350),
(12, 'Harpreet Singh', 'harpreet@email.com', 88, '9835012356', FALSE, NULL),
(13, 'Reena Bose', 'reena@email.com', 7, '9836012357', TRUE, 600),
(14, 'Rakesh Yadav', 'rakesh@email.com', 78, '9810012358', FALSE, NULL),
(15, 'Nandini Rao', 'nandini@email.com', 14, '9823012359', TRUE, 200),
(16, 'Sudhir Deshmukh', 'sudhir@email.com', 89, '9824012360', TRUE, 100),
(17, 'Lalita Kumari', 'lalita@email.com', 19, '9848012361', TRUE, 550),
(18, 'Mohammad Iqbal', 'mohammad@email.com', 11, '9838012362', FALSE, NULL),
(19, 'Jyoti Agarwal', 'jyoti@email.com', 3, '9849012363', TRUE, 650),
(20, 'Karan Kapoor', 'karan@email.com', 90, '9846012364', TRUE, 750);


-- Inserting Sample Data for National Parks
INSERT INTO ANIMAL_PLACE (place_id, name, address_id, type_of_place) VALUES
(1, 'Ranthambore National Park', 11, 'national park'),
(2, 'Pench National Park', 12, 'national park'),
(3, 'Bandhavgarh National Park', 13, 'national park'),
(4, 'Great Himalayan National Park', 14, 'national park'),
(5, 'Silent Valley National Park', 15, 'national park');

-- Inserting Sample Data for Zoos
INSERT INTO ANIMAL_PLACE (place_id, name, address_id, type_of_place) VALUES
(6, 'Nehru Zoological Park', 16, 'zoo'),
(7, 'Alipore Zoological Gardens', 17, 'zoo'),
(8, 'National Zoological Park', 18, 'zoo'),
(9, 'Lucknow Zoo', 19, 'zoo'),
(10, 'Mysuru Zoo', 20, 'zoo');


CREATE TABLE login_credentials (
    email VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255)
); 

-- Insert raw data into the login_credentials table
INSERT INTO login_credentials (email, password)
VALUES
('rajesh@email.com', 'hashed_password1'),
('sunita@email.com', 'hashed_password2'),
('amit@email.com', 'hashed_password3'),
('anil@email.com', 'hashed_password4'),
('sheetal@email.com', 'hashed_password5'),
('vijay@email.com', 'hashed_password6'),
('girish@email.com', 'hashed_password7'),
('farida@email.com', 'hashed_password8'),
('krishna@email.com', 'hashed_password9'),
('latha@email.com', 'hashed_password10'),
('manoj@email.com', 'hashed_password11'),
('harpreet@email.com', 'hashed_password12'),
('reena@email.com', 'hashed_password13'),
('rakesh@email.com', 'hashed_password14'),
('nandini@email.com', 'hashed_password15'),
('sudhir@email.com', 'hashed_password16'),
('lalita@email.com', 'hashed_password17'),
('mohammad@email.com', 'hashed_password18'),
('jyoti@email.com', 'hashed_password19'),
('karan@email.com', 'hashed_password20');


CREATE TABLE ANIMAL (
    animal_id INT PRIMARY KEY,
    description_info TEXT,
    animal_name VARCHAR(255),
    breed VARCHAR(255),
    allergens VARCHAR(255),
    size VARCHAR(50),
    diet_plan TEXT,
    gender VARCHAR(10),
    max_temp_of_survival DECIMAL(5,2),
    min_temp_of_survival DECIMAL(5,2),
    isDomestic BOOLEAN,
    common_animal_name VARCHAR(255),
    imageURL VARCHAR(255)
);

INSERT INTO ANIMAL 
(animal_id, description_info, animal_name, breed, allergens, size, diet_plan, gender, max_temp_of_survival, min_temp_of_survival, isDomestic, common_animal_name, imageURL) 
VALUES 
(31, 'Loyal and intelligent.', 'Dog', 'Golden Retriever', 'Dander', 'Medium', 'Dog food, meat, vegetables.', 'Male', 35, -10, TRUE, 'Dog', 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YW5pbWFsc3xlbnwwfHwwfHx8MA%3D%3D'),
(32, 'Sleek and mysterious.', 'Cat', 'Siamese', 'Dander', 'Small', 'Cat food, meat, fish.', 'Female', 38, -5, TRUE, 'Cat', 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YW5pbWFsc3xlbnwwfHwwfHx8MA%3D%3D'),
(33, 'Robust and strong.', 'Buffalo', 'Water Buffalo', 'Dander', 'Large', 'Grass, aquatic plants.', 'Male', 33, -10, FALSE, 'Buffalo', 'https://unsplash.com/photos/thC1uwWdMfM'),
(34, 'Calm and sociable.', 'Cow', 'Angus', 'Dander', 'Large', 'Grass, hay.', 'Female', 33, -15, TRUE, 'Cow', 'https://images.unsplash.com/photo-1570042225831-d98fa7577f1e?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y293fGVufDB8fDB8fHww'),
(35, 'Docile and woolly.', 'Sheep', 'Merino', 'Dander', 'Medium', 'Grass, hay.', 'Male', 30, -10, TRUE, 'Sheep', 'https://images.unsplash.com/photo-1588942173353-0c53a1bf9081?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c2hlZXB8ZW58MHx8MHx8fDA%3D'),
(36, 'Majestic and regal.', 'Eagle', 'Bald Eagle', 'Feather dust', 'Medium', 'Fish, small mammals.', 'Male', 40, 5, FALSE, 'Bird' ,'https://plus.unsplash.com/premium_photo-1674458852390-ac22d6c502d7?auto=format&fit=crop&q=80&w=2071&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(37, 'Stealthy and fierce.', 'Leopard', 'African Leopard', 'Dander', 'Medium', 'Meat, small mammals.', 'Female', 38, -5, FALSE, 'Wild Cat', 'https://images.unsplash.com/photo-1544985361-b420d7a77043?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGVvcGFyZHxlbnwwfHwwfHx8MA%3D%3D'),
(38, 'Elegant and swift.', 'Antelope', 'Springbok', 'None', 'Medium', 'Grass, shrubs.', 'Male', 35, -10, FALSE, 'Antelope', 'https://images.unsplash.com/photo-1566034356854-23137d8128de?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YW50ZWxvcGV8ZW58MHx8MHx8fDA%3D'),
(39, 'Sly and adaptable.', 'Fox', 'Red Fox', 'Dander', 'Small', 'Meat, insects, fruits.', 'Female', 33, -15, FALSE, 'Fox', 'https://images.unsplash.com/photo-1474511320723-9a56873867b5?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Rm94fGVufDB8fDB8fHww'),
(40, 'Massive and commanding.', 'Elephant', 'African Elephant', 'None', 'Large', 'Grass, fruits, bark.', 'Male', 36, 5, FALSE, 'Elephant', 'https://images.unsplash.com/photo-1603483080228-04f2313d9f10?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8RWxlcGhhbnR8ZW58MHx8MHx8fDA%3D');

INSERT INTO ANIMAL 
(animal_id, description_info, animal_name, breed, allergens, size, diet_plan, gender, max_temp_of_survival, min_temp_of_survival, isDomestic, common_animal_name, imageURL) 
VALUES 
(41, 'Dominant and strategic.', 'Lion', 'African Lion', 'Dander', 'Large', 'Meat, small mammals.', 'Male', 40, -5, FALSE, 'Wild Cat','https://images.unsplash.com/photo-1614027164847-1b28cfe1df60?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8TGlvbnxlbnwwfHwwfHx8MA%3D%3D'),
(42, 'Graceful long-necked grazer.', 'Giraffe', 'Masai Giraffe', 'None', 'Large', 'Leaves, fruits, flowers.', 'Female', 40, 5, FALSE, 'Giraffe', 'https://images.unsplash.com/photo-1547721064-da6cfb341d50?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z2lyYWZmZXxlbnwwfHwwfHx8MA%3D%3D'),
(43, 'Powerful and territorial.', 'Hippopotamus', 'Common Hippopotamus', 'None', 'Large', 'Grass, aquatic plants.', 'Male', 40, 5, FALSE, 'Hippopotamus', 'https://images.unsplash.com/photo-1619535211143-8e209a7b662c?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8SGlwcG9wb3RhbXVzfGVufDB8fDB8fHww'),
(44, 'Quick and cunning.', 'Cheetah', 'African Cheetah', 'Dander', 'Medium', 'Meat, small mammals.', 'Female', 38, 5, FALSE, 'Wild Cat', 'https://plus.unsplash.com/premium_photo-1673545660859-423a44316681?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Q2hlZXRhaHxlbnwwfHwwfHx8MA%3D%3D'),
(45, 'Calm and hefty.', 'Rhinoceros', 'White Rhinoceros', 'None', 'Large', 'Grass, leaves.', 'Male', 40, 5, FALSE, 'Rhinoceros', 'https://images.unsplash.com/photo-1598894000396-bc30e0996899?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Umhpbm9jZXJvc3xlbnwwfHwwfHx8MA%3D%3D'),
(46, 'Playful and intelligent.', 'Chimpanzee', 'Common Chimpanzee', 'Dander', 'Medium', 'Fruits, nuts, insects.', 'Male', 35, 5, FALSE, 'Primate', 'https://images.unsplash.com/photo-1495488448539-6fa4eae3a55c?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Q2hpbXBhbnplZXxlbnwwfHwwfHx8MA%3D%3D'),
(47, 'King of the jungle.', 'Tiger', 'Bengal Tiger', 'Dander', 'Large', 'Meat, fish.', 'Female', 38, 5, FALSE, 'Wild Cat', 'https://images.unsplash.com/photo-1615963244664-5b845b2025ee?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8VGlnZXJ8ZW58MHx8MHx8fDA%3D'),
(48, 'Large and lumbering.', 'Bear', 'Grizzly Bear', 'Dander', 'Large', 'Fish, berries, plants.', 'Male', 35, -10, FALSE, 'Bear','https://unsplash.com/photos/qQWV91TTBrE'),
(49, 'Ferocious and aquatic.', 'Crocodile', 'Saltwater Crocodile', 'None', 'Large', 'Fish, mammals, birds.', 'Male', 38, 5, FALSE, 'Reptile','https://images.unsplash.com/photo-1614065613125-17553fbc59f6?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q3JvY29kaWxlfGVufDB8fDB8fHww'),
(50, 'Vibrant and venomous.', 'Snake', 'King Cobra', 'None', 'Medium', 'Small mammals, birds.', 'Male', 35, 10, FALSE, 'Reptile','https://images.unsplash.com/photo-1570741066052-817c6de995c8?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8U25ha2V8ZW58MHx8MHx8fDA%3D'),
(51, 'Mighty and soaring.', 'Condor', 'Andean Condor', 'Feather dust', 'Large', 'Carrion.', 'Female', 25, 5, FALSE, 'Bird','https://plus.unsplash.com/premium_photo-1661809784790-aef66e922d8f?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Q29uZG9yfGVufDB8fDB8fHww'),
(52, 'Elusive and nocturnal.', 'Owl', 'Barn Owl', 'Feather dust', 'Medium', 'Mice, small mammals.', 'Female', 30, -5, FALSE, 'Bird','https://images.unsplash.com/photo-1553264701-d138db4fd5d4?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8b3dsfGVufDB8fDB8fHww'),
(53, 'Sleek and aquatic.', 'Seal', 'Harbor Seal', 'None', 'Medium', 'Fish, squid.', 'Male', 15, -10, FALSE, 'Mammal','https://images.unsplash.com/photo-1565413294262-fa587c396965?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2VhbHxlbnwwfHwwfHx8MA%3D%3D'),
(54, 'Spiky and insectivorous.', 'Echidna', 'Short-beaked Echidna', 'None', 'Small', 'Ants, termites.', 'Male', 35, 5, FALSE, 'Mammal','https://images.unsplash.com/photo-1635150657535-1af93bd99d47?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZWNoaWRuYXxlbnwwfHwwfHx8MA%3D%3D'),
(55, 'Colorful and solitary.', 'Pheasant', 'Golden Pheasant', 'Feather dust', 'Medium', 'Seeds, grains, insects.', 'Male', 25, -5, FALSE, 'Bird','https://images.unsplash.com/photo-1623184272516-eb68ee29c529?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8UGhlYXNhbnR8ZW58MHx8MHx8fDA%3D'),
(56, 'Intelligent and vocal.', 'Orangutan', 'Bornean Orangutan', 'Dander', 'Large', 'Fruits, leaves, insects.', 'Male', 35, 5, FALSE, 'Primate', 'https://images.unsplash.com/photo-1629413040378-ee8e305fbc07?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8b3Jhbmd1dGFufGVufDB8fDB8fHww'),
(57, 'Powerful and horned.', 'Bison', 'American Bison', 'Dander', 'Large', 'Grass, shrubs.', 'Male', 35, -20, FALSE, 'Bison', 'https://images.unsplash.com/flagged/photo-1575440172687-fdd4ddf4285f?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Qmlzb258ZW58MHx8MHx8fDA%3D'),
(58, 'Armored and ancient.', 'Tortoise', 'Aldabra Giant Tortoise', 'None', 'Large', 'Grass, leaves.', 'Female', 35, 10, FALSE, 'Reptile', 'https://images.unsplash.com/photo-1559041881-74dd9fd9b600?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8VG9ydG9pc2V8ZW58MHx8MHx8fDA%3D'),
(59, 'Tall and heavy.', 'Elephant', 'Asian Elephant', 'None', 'Large', 'Grass, fruits, bark.', 'Female', 36, 10, FALSE, 'Elephant','https://images.unsplash.com/photo-1551316679-9c6ae9dec224?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8QXNpYW4lMjBFbGVwaGFudHxlbnwwfHwwfHx8MA%3D%3D'),
(60, 'Vivid and agile.', 'Lizard', 'Komodo Dragon', 'None', 'Large', 'Meat, birds, eggs.', 'Male', 40, 10, FALSE, 'Reptile', 'https://images.unsplash.com/photo-1504450874802-0ba2bcd9b5ae?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGl6YXJkfGVufDB8fDB8fHww');

INSERT INTO ANIMAL 
(animal_id, description_info, animal_name, breed, allergens, size, diet_plan, gender, max_temp_of_survival, min_temp_of_survival, isDomestic, common_animal_name, imageURL) 
VALUES 
(16, 'Docile and easy-going.', 'Goat', 'Nubian', 'Dander', 'Medium', 'Hay, grains, greens.', 'Female', 38, -10, TRUE, 'Goat','https://images.unsplash.com/photo-1524024973431-2ad916746881?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8R29hdHxlbnwwfHwwfHx8MA%3D%3D'),
(17, 'Gentle and calm.', 'Cow', 'Jersey', 'Dander', 'Large', 'Grass, hay, silage.', 'Female', 35, -15, TRUE, 'Cow', 'https://images.unsplash.com/photo-1595365691689-6b7b4e1970cf?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8amVyc2V5JTIwY293fGVufDB8fDB8fHww'),
(18, 'Majestic and vibrant.', 'Peacock', 'Indian Blue', 'Feather dust', 'Large', 'Seeds, insects, small mammals.', 'Male', 40, 5, FALSE, 'Bird', 'https://images.unsplash.com/photo-1536514900905-0d5511b9d489?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVhY29ja3xlbnwwfHwwfHx8MA%3D%3D'),
(19, 'Playful and inquisitive.', 'Cub', 'Lion Cub', 'Dander', 'Medium', 'Meat, poultry.', 'Male', 38, -5, FALSE, 'Wild Cat', 'https://images.unsplash.com/photo-1603626127249-7c3932a000ab?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8TGlvbiUyMEN1YnxlbnwwfHwwfHx8MA%3D%3D'),
(20, 'Hardy and friendly.', 'Goat', 'Boer', 'Dander', 'Medium', 'Grains, hay.', 'Male', 38, -10, TRUE, 'Goat', 'https://images.unsplash.com/photo-1587622627361-14b33dcdff6f?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Qm9lcnxlbnwwfHwwfHx8MA%3D%3D'),
(21, 'Energetic and robust.', 'Cow', 'Holstein', 'Dander', 'Large', 'Grass, grains.', 'Female', 33, -15, TRUE, 'Cow','https://images.unsplash.com/photo-1647338720004-41b9b871ccf2?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8SG9sc3RlaW4lMjBjb3d8ZW58MHx8MHx8fDA%3D'),
(22, 'Curious and playful.', 'Rabbit', 'Holland Lop', 'Dander', 'Small', 'Hay, pellets, vegetables.', 'Female', 30, -5, TRUE, 'Rabbit','https://images.unsplash.com/photo-1518796745738-41048802f99a?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8UmFiYml0fGVufDB8fDB8fHww'),
(23, 'Sleek and agile.', 'Ferret', 'Standard', 'Dander', 'Small', 'Meat, commercial ferret food.', 'Male', 30, -2, TRUE, 'Ferret', 'https://images.unsplash.com/photo-1615087240969-eeff2fa558f2?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZmVycmV0fGVufDB8fDB8fHww'),
(24, 'Cheerful and energetic.', 'Cub', 'Tiger Cub', 'Dander', 'Medium', 'Meat, poultry.', 'Female', 40, -5, FALSE, 'Wild Cat', 'https://images.unsplash.com/photo-1516728778615-2d590ea1855e?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8VGlnZXIlMjBDdWJ8ZW58MHx8MHx8fDA%3D'),
(25, 'Gentle and affectionate.', 'Llama', 'Cria', 'Dander', 'Large', 'Hay, grains, grass.', 'Male', 32, -20, FALSE, 'Llama', 'https://images.unsplash.com/photo-1589182337358-2cb63099350c?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8TGxhbWF8ZW58MHx8MHx8fDA%3D'),
(26, 'Graceful and gentle.', 'Deer', 'White-Tailed', 'None', 'Medium', 'Grass, fruits, nuts.', 'Female', 34, -12, FALSE, 'Deer','https://images.unsplash.com/photo-1484406566174-9da000fda645?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8RGVlcnxlbnwwfHwwfHx8MA%3D%3D'),
(27, 'Tiny and chirpy.', 'Guinea Pig', 'American', 'Dander', 'Small', 'Guinea pig pellets, hay, veggies.', 'Male', 26, 5, TRUE, 'Rodent','https://images.unsplash.com/photo-1516467508483-a7212febe31a?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8R3VpZW5hJTIwcGlnfGVufDB8fDB8fHww'),
(28, 'Bright and colorful.', 'Iguana', 'Green', 'None', 'Medium', 'Leafy greens, fruits.', 'Female', 40, 18, FALSE, 'Reptile', 'https://images.unsplash.com/photo-1603826567635-2c9db43071fa?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8SWd1YW5hfGVufDB8fDB8fHww'),
(29, 'Small and active.', 'Turtle', 'Red-eared Slider', 'None', 'Small', 'Aquatic plants, insects, fish.', 'Male', 35, 10, FALSE, 'Reptile', 'https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8VHVydGxlfGVufDB8fDB8fHww'),
(30, 'Lively and noisy.', 'Duck', 'Mallard', 'Feather dust', 'Medium', 'Grains, insects, small fish.', 'Female', 33, -5, TRUE, 'Bird','https://images.unsplash.com/photo-1563409236302-8442b5e644df?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8RHVja3xlbnwwfHwwfHx8MA%3D%3D');


INSERT INTO PRODUCTS_LIST_OF_ALL_SHOPS (product_id, shop_id) VALUES
-- Shop 1
(5, 1),
(7, 1),
(12, 1),
(16, 1),
(20, 1),
(24, 1),
(28, 1),
(35, 1),

-- Shop 2
(3, 2),
(6, 2),
(10, 2),
(13, 2),
(15, 2),
(17, 2),
(25, 2),
(27, 2),
(29, 2),
(33, 2),
-- Shop 3
(1, 
3),
(4, 3),
(9, 3),
(11, 3),
(14, 3),
(22, 3),
(23, 3),
(30, 3),
(31, 3),
(36, 3),
(38, 3),

-- Shop 4
(2, 4),
(8, 4),
(18, 4),
(19, 4),
(21, 4),
(26, 4),
(32, 4),
(37, 4),

-- Shop 5
(3, 5),
(7, 5),
(10, 5),
(20, 5),
(34, 5),
(39, 5);

INSERT INTO PRODUCTS_LIST_OF_ALL_SHOPS (product_id, shop_id) VALUES
(5, 38),
(15, 38),
(24, 38),
(28, 38),
(35, 38),
(37, 38),
(40, 38);

INSERT INTO PRODUCTS_LIST_OF_ALL_SHOPS (product_id, shop_id) VALUES
(8, 6),
(15, 6),
(12, 7),
(24, 7),
(31, 7),
(4, 8),
(33, 8),
(5, 9),
(22, 9),
(39, 9),
(18, 10),
(28, 10),
(1, 11),
(21, 11),
(35, 11),
(11, 12),
(19, 12),
(3, 13),
(27, 13),
(36, 13),
(10, 14),
(25, 14),
(6, 15),
(23, 15),
(37, 15),
(2, 16),
(29, 16),
(13, 17),
(34, 17),
(40, 17),
(8, 18),
(15, 18),
(22, 18),
(4, 19),
(18, 19),
(12, 20),
(25, 20),
(38, 20),
(6, 21),
(33, 21),
(1, 22),
(21, 22),
(37, 22),
(9, 23),
(19, 23),
(28, 23),
(10, 24),
(30, 24),
(40, 24),
(5, 25),
(15, 25),
(7, 26),
(27, 26),
(37, 26),
(3, 27),
(13, 27),
(11, 28),
(22, 28),
(33, 28),
(4, 29),
(14, 29),
(24, 29),
(20, 30),
(31, 30),
(2, 31),
(12, 31),
(9, 32),
(19, 32),
(29, 32),
(6, 33),
(16, 33),
(26, 33),
(1, 34),
(21, 34),
(8, 35),
(18, 35),
(28, 35),
(3, 36),
(23, 36),
(33, 36),
(12, 37),
(22, 37),
(32, 37);

-- Stray Animals Management
CREATE TABLE StrayAnimalGuidelines (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    AnimalType VARCHAR(255) NOT NULL,
    Guidelines JSON
);

-- Inserting guidelines for dogs
INSERT INTO StrayAnimalGuidelines (AnimalType, Guidelines) VALUES
('Dog', '[
    {"title": "Approach Carefully", "content": "Always approach a stray dog cautiously and slowly. Avoid direct eye contact, which they may see as a threat."},
    {"title": "Check for Identification", "content": "Look for any collars or tags that may provide information about the dog\'s owner."},
    {"title": "Use Food to Gain Trust", "content": "Offer food or treats to gain the dog\'s trust. Make sure the food is suitable for dogs."},
    {"title": "Check Health Signs", "content": "Look for signs of illness or injury. Do not approach if the dog seems sick or aggressive."},
    {"title": "Use Leash If Possible", "content": "If you have a leash, carefully put it on the dog to gain better control."},
    {"title": "Observe Behavior", "content": "Spend some time observing the dog\'s behavior to gauge its temperament."},
    {"title": "Call Authorities", "content": "If the dog seems aggressive or severely ill, it\'s best to call animal control."},
    {"title": "Take to Safe Location", "content": "Once the dog is comfortable, take it to a safe location until you can find its owner or a new home."}]'
);

-- Inserting guidelines for cats
INSERT INTO StrayAnimalGuidelines (AnimalType, Guidelines) VALUES
('Cat', '[
    {"title": "Don\'t Chase", "content": "Never chase a stray cat as it may become frightened and run away."},
    {"title": "Offer Food", "content": "Offer some cat food or treats to attract the stray cat."},
    {"title": "Slow Movements", "content": "Make slow, deliberate movements to avoid startling the cat."},
    {"title": "Check for ID", "content": "If possible, check for a collar or any form of identification."},
    {"title": "Use Carrier", "content": "Use a carrier to safely transport the cat."},
    {"title": "Check for Health Issues", "content": "Look for signs like limping or distressed meowing, which might indicate health issues."},
    {"title": "Allow the Cat to Come to You", "content": "Sit or crouch down and extend your hand, allowing the cat to approach you."},
    {"title": "Call for Help", "content": "If the cat appears sick or injured, call animal welfare services immediately."}]'
);

INSERT INTO StrayAnimalGuidelines (AnimalType, Guidelines) VALUES
('Cow', '[
    {"title": "Keep Distance", "content": "Maintain a safe distance initially. Do not make sudden movements."},
    {"title": "Do Not Startle", "content": "Avoid loud noises or actions that might scare the cow."},
    {"title": "Check Identification", "content": "Look for any tags, brands, or other identifiers."},
    {"title": "Contact Local Authorities", "content": "Inform local animal control or farmers who might be searching for the stray cow."},
    {"title": "Provide Water and Food", "content": "Offer fresh water and suitable food like hay."},
    {"title": "Check for Illness", "content": "Observe the cow for signs of illness such as limping or labored breathing."},
    {"title": "Use Caution When Approaching", "content": "Approach the cow cautiously, especially if it appears anxious or agitated."},
    {"title": "Secure Area", "content": "If possible, guide the cow to a secured fenced area while waiting for authorities."}]'
);

-- Inserting guidelines for goats
INSERT INTO StrayAnimalGuidelines (AnimalType, Guidelines) VALUES
('Goat', '[
    {"title": "Approach Slowly", "content": "Move slowly to avoid frightening the goat."},
    {"title": "Check for Tags or Brands", "content": "Examine the goat for any form of identification like ear tags or brands."},
    {"title": "Offer Food", "content": "Offer grains or fresh vegetables to win its trust."},
    {"title": "Contact Owners or Authorities", "content": "If identification is found, contact the owners or else notify local animal control."},
    {"title": "Be Cautious of Horns", "content": "Some goats have horns and can use them when scared or threatened."},
    {"title": "Assess Health", "content": "Look for signs of illness or injury such as coughing, limping, or visible wounds."},
    {"title": "Use Rope for Control", "content": "If available, use a rope to guide the goat."},
    {"title": "Temporary Shelter", "content": "Provide a temporary shelter like a pen if you have one, until the owner or authorities arrive."}]'
);

select * from StrayAnimalGuidelines;

-- Creting adoption center table 



-- creating table to store list of animals in all the adoption center
CREATE TABLE ADOPTION_CENTER (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50),
  address_id INTEGER,
  contact_number VARCHAR(15),
  FOREIGN KEY (address_id) REFERENCES ADDRESS(address_id)
);
CREATE TABLE ANIMALS_LIST_IN_ADOPTION_CENTERS (
  animal_id INTEGER,
  center_id INTEGER,
  animal_count INTEGER,
  FOREIGN KEY (animal_id) REFERENCES ANIMAL(animal_id),
  FOREIGN KEY (center_id) REFERENCES ADOPTION_CENTER(id),
  PRIMARY KEY (animal_id, center_id)
);
-- Inserting Sample Data for Adoption Centers with Randomized Address IDs
INSERT INTO ADOPTION_CENTER (id, name, address_id, contact_number) VALUES
(1, 'Happy Paws', 1, '+91 98765 43210'),
(2, 'Animal Haven', 98, '+91 87654 32109'),
(3, 'Furry Friends', 15, '+91 76543 21098'),
(4, 'Paw Paradise', 77, '+91 65432 10987'),
(5, 'Rescue Ranch', 75, '+91 54321 09876'),
(6, 'Cuddly Corner', 5, '+91 43210 98765'),
(7, 'Kindred Spirits', 96, '+91 32109 87654'),
(8, 'Heavenly Creatures', 83, '+91 21098 76543'),
(9, 'Paws & Claws', 95, '+91 10987 65432'),
(10, 'Wagging Tails', 10, '+91 09876 54321'),
(11, 'Four-legged Palace', 80, '+91 12345 67890'),
(12, 'Furever Home', 91, '+91 23456 78901'),
(13, 'Critter Camp', 89, '+91 34567 89012'),
(14, 'Animal Kingdom', 74, '+91 45678 90123'),
(15, 'Barkville', 92, '+91 56789 01234'),
(16, 'Majestic Tails', 100, '+91 67890 12345'),
(17, 'Feathers & Fur', 84, '+91 78901 23456'),
(18, 'Meow Mansion', 71, '+91 89012 34567'),
(19, 'Woof Wonderland', 93, '+91 90123 45678'),
(20, 'Hearty Homes', 85, '+91 91234 56789');

INSERT INTO ANIMALS_LIST_IN_ADOPTION_CENTERS (animal_id, center_id, animal_count) VALUES
(18, 1, 17), (19, 1, 12), (24, 1, 8), (25, 1, 19), (26, 1, 9), (28, 1, 15), (29, 1, 11), (41, 1, 7), (42, 1, 18), (43, 1, 20),
(44, 2, 13), (45, 2, 6), (46, 2, 5), (47, 2, 19), (48, 2, 10), (49, 2, 12), (50, 2, 18), (51, 2, 16), (52, 2, 14), (53, 2, 7),
(54, 3, 17), (55, 3, 15), (56, 3, 11), (57, 3, 9), (58, 3, 19), (59, 3, 5), (60, 3, 8), (18, 3, 10), (19, 3, 6), (24, 3, 14),
(25, 4, 15), (26, 4, 9), (28, 4, 18), (29, 4, 7), (41, 4, 11), (42, 4, 16), (43, 4, 20), (44, 4, 5), (45, 4, 13), (46, 4, 12),
(47, 5, 17), (48, 5, 8), (49, 5, 6), (50, 5, 14), (51, 5, 19), (52, 5, 9), (53, 5, 10), (54, 5, 7), (55, 5, 15), (56, 5, 18),
(57, 6, 13), (58, 6, 11), (59, 6, 16), (60, 6, 20), (18, 6, 5), (19, 6, 8), (24, 6, 6), (25, 6, 10), (26, 6, 12), (28, 6, 7),
(29, 7, 9), (41, 7, 11), (42, 7, 13), (43, 7, 19), (44, 7, 5), (45, 7, 6), (46, 7, 8), (47, 7, 10), (48, 7, 12), (49, 7, 14),
(50, 8, 17), (51, 8, 18), (52, 8, 16), (53, 8, 15), (54, 8, 9), (55, 8, 8), (56, 8, 7), (57, 8, 6), (58, 8, 5), (59, 8, 19),
(60, 9, 20), (18, 9, 13), (19, 9, 12), (24, 9, 11), (25, 9, 10), (26, 9, 9), (28, 9, 8), (29, 9, 7), (41, 9, 6), (42, 9, 5),
(43, 10, 19), (44, 10, 18), (45, 10, 17), (46, 10, 16), (47, 10, 15), (48, 10, 14), (49, 10, 13), (50, 10, 12), (51, 10, 11), (52, 10, 10),
(53, 11, 9), (54, 11, 8), (55, 11, 7), (56, 11, 6), (57, 11, 5), (58, 11, 19), (59, 11, 18), (60, 11, 17), (18, 11, 16), (19, 11, 15),
(24, 12, 14), (25, 12, 13), (26, 12, 12), (28, 12, 11), (29, 12, 10), (41, 12, 9), (42, 12, 8), (43, 12, 7), (44, 12, 6), (45, 12, 5),
(46, 13, 19), (47, 13, 18), (48, 13, 17), (49, 13, 16), (50, 13, 15), (51, 13, 14), (52, 13, 13), (53, 13, 12), (54, 13, 11), (55, 13, 10),
(56, 14, 9), (57, 14, 8), (58, 14, 7), (59, 14, 6), (60, 14, 5), (18, 14, 19), (19, 14, 18), (24, 14, 17), (25, 14, 16), (26, 14, 15),
(28, 15, 14), (29, 15, 13), (41, 15, 12), (42, 15, 11), (43, 15, 10), (44, 15, 9), (45, 15, 8), (46, 15, 7), (47, 15, 6), (48, 15, 5),
(49, 16, 19), (50, 16, 18), (51, 16, 17), (52, 16, 16), (53, 16, 15), (54, 16, 14), (55, 16, 13), (56, 16, 12), (57, 16, 11), (58, 16, 10),
(59, 17, 9), (60, 17, 8), (18, 17, 7), (19, 17, 6), (24, 17, 5), (25, 17, 19), (26, 17, 18), (28, 17, 17), (29, 17, 16), (41, 17, 15),
(42, 18, 14), (43, 18, 13), (44, 18, 12), (45, 18, 11), (46, 18, 10), (47, 18, 9), (48, 18, 8), (49, 18, 7), (50, 18, 6), (51, 18, 5),
(52, 19, 16), (53, 19, 18), (54, 19, 7), (55, 19, 9), (56, 19, 13), (57, 19, 10), (58, 19, 11), (59, 19, 6), (60, 19, 12), (18, 19, 20),
(19, 20, 5), (24, 20, 17), (25, 20, 16), (26, 20, 15), (28, 20, 14), (29, 20, 13), (41, 20, 12), (42, 20, 11), (43, 20, 10), (44, 20, 9);


DELIMITER //
CREATE PROCEDURE AddCustomerAndCredentials(
    IN p_name VARCHAR(50),
    IN p_contact VARCHAR(15),
    IN p_email VARCHAR(50),
    IN p_password VARCHAR(50)
)
BEGIN
    DECLARE v_customer_id INT;
    DECLARE v_total_count INT;
    DECLARE v_address_id INT DEFAULT 84;
    DECLARE v_sponsor_amount INT DEFAULT 0;
    DECLARE v_sponsor boolean DEFAULT false; 

    -- Calculate the next customer_id based on total count + 1
    SELECT COUNT(*) INTO v_total_count FROM CUSTOMER;
    SET v_customer_id = v_total_count + 1;

    -- Insert into CUSTOMER table
    INSERT INTO CUSTOMER(customer_id, name, email, address_id, contact_number, sponsor, sponsor_amount)
    VALUES(v_customer_id, p_name, p_email, v_address_id, p_contact, v_sponsor, v_sponsor_amount);

    -- Insert into login_credentials table
    INSERT INTO login_credentials(email, password)
    VALUES(p_email, p_password);
END;
//
DELIMITER ;

