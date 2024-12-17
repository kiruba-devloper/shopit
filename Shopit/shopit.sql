create database shoppingcart;
use shoppingcart;
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(100),
    stock_quantity INT NOT NULL,
    image_url VARCHAR(255),
    vendor_id  bigint,
    vendor_name varchar(50)
)auto_increment 100;
drop table products;
-- user details
create table users ( uname varchar(20) primary key, upass varchar(25), uemail varchar(40), umobile varchar(12) unique);
select * from users;
insert into users (uname,upass,uemail,umobile) value 
('user1','user','user1@gmail.com','9874561230'),
('user2','user','user2@gmail.com','9874561231'),
('user3','user','user3@gmail.com','9874561232');
drop table users;
create table item ( 
    uname VARCHAR(25) ,
    id int,
    pname varchar(50),
    category VARCHAR(100),
    dop date,
    qty INT,
    uprice DECIMAL(10, 2) NOT NULL,
    tprice DECIMAL(10, 2) NOT NULL);
    
    
    -- FOREIGN KEY (uname) REFERENCES users(uname));
select * from item;
drop table item;
-- vendor details
create table vendors ( vid int primary key auto_increment ,vname varchar(20) , vpass varchar(25), vemail varchar(40), vmobile varchar(12) unique, vloc varchar(50))auto_increment 1500;
select * from vendors;
drop table vendors;

-- Assuming a vendors table with vendor_id starting from 1500
INSERT INTO vendors (vid, vname,vpass,vemail,vmobile ,vloc) VALUES
(1500, 'Vendor1','vendor','vendor1@gmail.com','9876543210','salem'),
(1501, 'Vendor2','vendor','vendor2@gmail.com','9876543211','chennai'),
(1502, 'Vendor3','vendor','vendor3@gmail.com','9876543212','madurai'),
(1503, 'Vendor4','vendor','vendor4@gmail.com','9876543213','coimbatore'),
(1504, 'Vendor5','vendor','vendor5@gmail.com','9876543214','erode');

-- Modified products insert statement with product_id starting from 100, vendor_id, and updated vendor names
INSERT INTO products (product_id, name, description, price, category, stock_quantity, image_url, vendor_id, vendor_name) VALUES  
(100, 'Wireless Headphones', 'High-quality wireless headphones with noise cancellation.', 99.99, 'Electronics', 120, 'https://dummyimage.com/600x400/000/fff&text=Headphones', 1500, 'Vendor1'),
(101, 'Smartphone', 'Latest model smartphone with excellent battery life.', 799.99, 'Electronics', 85, 'https://dummyimage.com/600x400/000/fff&text=Smartphone', 1500, 'Vendor1'),
(102, 'Laptop', 'Lightweight and powerful laptop, ideal for work and entertainment.', 1200.50, 'Electronics', 50, 'https://dummyimage.com/600x400/000/fff&text=Laptop', 1500, 'Vendor1'),
(103, 'Blender', 'Durable and powerful blender for all your kitchen needs.', 49.99, 'Home Appliances', 200, 'https://dummyimage.com/600x400/000/fff&text=Blender', 1501, 'Vendor2'),
(104, 'Gaming Console', 'Next-gen gaming console for immersive gaming experience.', 499.99, 'Electronics', 30, 'https://dummyimage.com/600x400/000/fff&text=Gaming+Console', 1500, 'Vendor1'),
(105, 'Running Shoes', 'Comfortable and lightweight running shoes.', 69.99, 'Sports', 100, 'https://dummyimage.com/600x400/000/fff&text=Running+Shoes', 1502, 'Vendor3'),
(106, 'LED TV', '50-inch 4K LED TV with HDR support.', 599.99, 'Electronics', 45, 'https://dummyimage.com/600x400/000/fff&text=LED+TV', 1500, 'Vendor1'),
(107, 'Microwave Oven', 'Compact microwave oven with multiple power settings.', 79.99, 'Home Appliances', 150, 'https://dummyimage.com/600x400/000/fff&text=Microwave+Oven', 1501, 'Vendor2'),
(108, 'Desk Chair', 'Ergonomic desk chair with lumbar support.', 129.99, 'Furniture', 70, 'https://dummyimage.com/600x400/000/fff&text=Desk+Chair', 1503, 'Vendor4'),
(109, 'Yoga Mat', 'Non-slip yoga mat perfect for home workouts.', 29.99, 'Sports', 300, 'https://dummyimage.com/600x400/000/fff&text=Yoga+Mat', 1502, 'Vendor3'),
(110, 'Wristwatch', 'Stylish analog wristwatch with leather strap.', 199.99, 'Accessories', 60, 'https://dummyimage.com/600x400/000/fff&text=Wristwatch', 1504, 'Vendor5'),
(111, 'Water Bottle', 'Stainless steel water bottle with 1L capacity.', 19.99, 'Accessories', 250, 'https://dummyimage.com/600x400/000/fff&text=Water+Bottle', 1504, 'Vendor5'),
(112, 'Backpack', 'Durable and spacious backpack for travel or school.', 49.99, 'Accessories', 90, 'https://dummyimage.com/600x400/000/fff&text=Backpack', 1504, 'Vendor5'),
(113, 'Sunglasses', 'Polarized sunglasses with UV protection.', 79.99, 'Accessories', 140, 'https://dummyimage.com/600x400/000/fff&text=Sunglasses', 1504, 'Vendor5'),
(114, 'Air Purifier', 'High-efficiency air purifier with HEPA filter.', 149.99, 'Home Appliances', 40, 'https://dummyimage.com/600x400/000/fff&text=Air+Purifier', 1501, 'Vendor2'),
(115, 'Fitness Tracker', 'Waterproof fitness tracker with heart rate monitor.', 89.99, 'Electronics', 110, 'https://dummyimage.com/600x400/000/fff&text=Fitness+Tracker', 1500, 'Vendor1'),
(116, 'Cookware Set', '10-piece non-stick cookware set.', 129.99, 'Home Appliances', 80, 'https://dummyimage.com/600x400/000/fff&text=Cookware+Set', 1501, 'Vendor2'),
(117, 'Electric Kettle', 'Quick-boil electric kettle with auto shut-off.', 39.99, 'Home Appliances', 190, 'https://dummyimage.com/600x400/000/fff&text=Electric+Kettle', 1501, 'Vendor2'),
(118, 'Gaming Mouse', 'Precision gaming mouse with customizable buttons.', 49.99, 'Electronics', 200, 'https://dummyimage.com/600x400/000/fff&text=Gaming+Mouse', 1500, 'Vendor1'),
(119, 'Office Desk', 'Spacious office desk with built-in storage.', 249.99, 'Furniture', 35, 'https://dummyimage.com/600x400/000/fff&text=Office+Desk', 1503, 'Vendor4'),
(120, 'Bluetooth Speaker', 'Portable Bluetooth speaker with deep bass.', 59.99, 'Electronics', 130, 'https://dummyimage.com/600x400/000/fff&text=Bluetooth+Speaker', 1500, 'Vendor1'),
(121, 'Coffee Maker', 'Single-serve coffee maker with reusable filter.', 89.99, 'Home Appliances', 120, 'https://dummyimage.com/600x400/000/fff&text=Coffee+Maker', 1501, 'Vendor2'),
(122, 'Smart Watch', 'Touchscreen smart watch with fitness tracking features.', 199.99, 'Electronics', 65, 'https://dummyimage.com/600x400/000/fff&text=Smart+Watch', 1500, 'Vendor1'),
(123, 'Electric Scooter', 'Foldable electric scooter with long battery life.', 299.99, 'Electronics', 25, 'https://dummyimage.com/600x400/000/fff&text=Electric+Scooter', 1500, 'Vendor1'),
(124, 'Hair Dryer', 'Compact and powerful hair dryer with multiple heat settings.', 39.99, 'Home Appliances', 170, 'https://dummyimage.com/600x400/000/fff&text=Hair+Dryer', 1501, 'Vendor2'),
(125, 'Tent', 'Waterproof 4-person camping tent.', 199.99, 'Sports', 50, 'https://dummyimage.com/600x400/000/fff&text=Tent', 1503, 'Vendor4'),
(126, 'Electric Toothbrush', 'Rechargeable electric toothbrush with multiple modes.', 49.99, 'Health', 130, 'https://dummyimage.com/600x400/000/fff&text=Electric+Toothbrush', 1504, 'Vendor5'),
(127, 'Frying Pan', 'Non-stick frying pan with comfortable grip handle.', 29.99, 'Home Appliances', 180, 'https://dummyimage.com/600x400/000/fff&text=Frying+Pan', 1501, 'Vendor2'),
(128, 'Robot Vacuum', 'Smart robot vacuum cleaner with app control.', 299.99, 'Electronics', 40, 'https://dummyimage.com/600x400/000/fff&text=Robot+Vacuum', 1500, 'Vendor1'),
(129, 'Standing Lamp', 'Adjustable standing lamp with LED bulb.', 59.99, 'Furniture', 75, 'https://dummyimage.com/600x400/000/fff&text=Standing+Lamp', 1503, 'Vendor4'),
(130, 'Sneakers', 'Breathable and lightweight sneakers.', 69.99, 'Sports', 90, 'https://dummyimage.com/600x400/000/fff&text=Sneakers', 1502, 'Vendor3'),
(131, 'Wireless Charger', 'Fast wireless charger compatible with most devices.', 29.99, 'Electronics', 160, 'https://dummyimage.com/600x400/000/fff&text=Wireless+Charger', 1500, 'Vendor1'),
(132, 'Barbecue Grill', 'Portable barbecue grill with adjustable temperature control.', 149.99, 'Outdoor', 40, 'https://dummyimage.com/600x400/000/fff&text=Barbecue+Grill', 1503, 'Vendor4'),
(133, 'Sleeping Bag', 'Warm and lightweight sleeping bag for cold weather.', 69.99, 'Outdoor', 110, 'https://dummyimage.com/600x400/000/fff&text=Sleeping+Bag', 1503, 'Vendor4'),
(134, 'Dumbbell Set', 'Adjustable dumbbell set for strength training.', 99.99, 'Sports', 80, 'https://dummyimage.com/600x400/000/fff&text=Dumbbell+Set', 1502, 'Vendor3'),
(135, 'Portable Projector', 'Mini portable projector with HD support.', 299.99, 'Electronics', 30, 'https://dummyimage.com/600x400/000/fff&text=Portable+Projector', 1500, 'Vendor1'),
(136, 'Electric Grill', 'Indoor electric grill with non-stick surface.', 89.99, 'Home Appliances', 95, 'https://dummyimage.com/600x400/000/fff&text=Electric+Grill', 1501, 'Vendor2'),
(137, 'Mountain Bike', 'Sturdy mountain bike with 21-speed gears.', 499.99, 'Outdoor', 25, 'https://dummyimage.com/600x400/000/fff&text=Mountain+Bike', 1503, 'Vendor4'),
(138, 'Smart Thermostat', 'Smart thermostat with remote app control.', 199.99, 'Electronics', 60, 'https://dummyimage.com/600x400/000/fff&text=Smart+Thermostat', 1500, 'Vendor1'),
(139, 'Rug', 'Soft and durable rug for living room or bedroom.', 79.99, 'Furniture', 90, 'https://dummyimage.com/600x400/000/fff&text=Rug', 1503, 'Vendor4'),
(140, 'Blender Bottle', 'Shaker bottle for protein drinks and smoothies.', 19.99, 'Accessories', 220, 'https://dummyimage.com/600x400/000/fff&text=Blender+Bottle', 1504, 'Vendor5'),
(141, 'Smart Light Bulb', 'Wi-Fi enabled smart light bulb with dimming feature.', 24.99, 'Electronics', 180, 'https://dummyimage.com/600x400/000/fff&text=Smart+Light+Bulb', 1500, 'Vendor1'),
(142, 'Electric Shaver', 'Rechargeable electric shaver with precision blades.', 49.99, 'Health', 140, 'https://dummyimage.com/600x400/000/fff&text=Electric+Shaver', 1504, 'Vendor5'),
(143, 'Treadmill', 'Foldable treadmill with multiple workout modes.', 699.99, 'Sports', 15, 'https://dummyimage.com/600x400/000/fff&text=Treadmill', 1502, 'Vendor3'),
(144, 'Cordless Vacuum', 'Lightweight cordless vacuum cleaner with strong suction.', 199.99, 'Home Appliances', 70, 'https://dummyimage.com/600x400/000/fff&text=Cordless+Vacuum', 1501, 'Vendor2'),
(145, 'Instant Pot', 'Multi-cooker with pressure cooking and slow cooking modes.', 119.99, 'Home Appliances', 60, 'https://dummyimage.com/600x400/000/fff&text=Instant+Pot', 1501, 'Vendor2'),
(146, 'Patio Set', 'Outdoor patio furniture set with table and chairs.', 349.99, 'Furniture', 20, 'https://dummyimage.com/600x400/000/fff&text=Patio+Set', 1503, 'Vendor4'),
(147, 'Fishing Rod', 'Durable fishing rod with spinning reel.', 79.99, 'Outdoor', 100, 'https://dummyimage.com/600x400/000/fff&text=Fishing+Rod', 1504, 'Vendor5'),
(148, 'Basketball', 'Official size and weight basketball for outdoor use.', 29.99, 'Sports', 140, 'https://dummyimage.com/600x400/000/fff&text=Basketball', 1502, 'Vendor3'),
(149, 'Electric Bike', 'Electric bike with removable battery and long-range.', 999.99, 'Outdoor', 10, 'https://dummyimage.com/600x400/000/fff&text=Electric+Bike', 1503, 'Vendor4');

select * from products;
select * from products where category='Accessories';
