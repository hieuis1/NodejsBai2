/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` date DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`food_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` date DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_food`;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Margherita Pizza', 'pizza1.jpg', 12.99, 'Classic tomato, mozzarella, and basil', 7);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Spaghetti Carbonara', 'pasta1.jpg', 14.99, 'Creamy pasta with bacon and eggs', 8);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Grilled Chicken Salad', 'salad1.jpg', 10.99, 'Fresh greens with grilled chicken', 5);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Chocolate Brownie', 'dessert1.jpg', 6.99, 'Warm chocolate brownie with ice cream', 3),
(5, 'Iced Tea', 'beverage1.jpg', 2.99, 'Refreshing iced tea', 4),
(6, 'California Roll', 'sushi1.jpg', 16.99, 'Sushi roll with avocado and crab', 11),
(7, 'Steak with Garlic Butter', 'steak1.jpg', 22.99, 'Juicy steak with garlic butter sauce', 13),
(8, 'Veggie Burger', 'burger1.jpg', 9.99, 'Vegetarian burger with all the fixings', 9),
(9, 'Tomato Soup', 'soup1.jpg', 7.99, 'Classic tomato soup', 6),
(10, 'Chicken Tandoori', 'indian1.jpg', 18.99, 'Spicy tandoori chicken', 18),
(11, 'Fish Tacos', 'mexican1.jpg', 12.99, 'Tacos with grilled fish', 19),
(12, 'Kung Pao Chicken', 'chinese1.jpg', 11.99, 'Spicy Chinese chicken dish', 20),
(13, 'Mushroom Risotto', 'pasta2.jpg', 15.99, 'Creamy mushroom risotto', 8),
(14, 'Avocado Toast', 'sandwich1.jpg', 8.99, 'Toasted bread with avocado', 10),
(15, 'Vegan Sushi', 'sushi2.jpg', 14.99, 'Sushi rolls with vegan ingredients', 11),
(16, 'Gluten-Free Pizza', 'pizza2.jpg', 13.99, 'Pizza with gluten-free crust', 17),
(17, 'Paneer Tikka', 'indian2.jpg', 16.99, 'Paneer cheese marinated and grilled', 18),
(18, 'Shrimp Scampi', 'seafood1.jpg', 20.99, 'Garlicky shrimp scampi', 12),
(19, 'Mango Lassi', 'beverage2.jpg', 3.99, 'Refreshing mango yogurt drink', 4),
(20, 'Crispy Tofu Burger', 'burger2.jpg', 10.99, 'Burger with crispy tofu patty', 16);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Appetizers');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Main Course');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Desserts');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Beverages'),
(5, 'Salads'),
(6, 'Soup'),
(7, 'Pizza'),
(8, 'Pasta'),
(9, 'Burgers'),
(10, 'Sandwiches'),
(11, 'Sushi'),
(12, 'Seafood'),
(13, 'Steak'),
(14, 'Chicken'),
(15, 'Vegetarian'),
(16, 'Vegan'),
(17, 'Gluten-Free'),
(18, 'Indian'),
(19, 'Mexican'),
(20, 'Chinese');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2023-02-10');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 2, '2023-02-24');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 3, '2023-02-25');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 6, '2023-02-02'),
(1, 7, '2023-02-19'),
(2, 1, '2023-02-20'),
(2, 2, '2023-02-11'),
(2, 5, '2023-02-26'),
(3, 1, '2023-12-09'),
(3, 3, '2023-02-12'),
(3, 10, '2023-02-21'),
(4, 2, '2023-02-22'),
(4, 4, '2023-02-13'),
(4, 7, '2023-02-27'),
(5, 5, '2023-02-14'),
(5, 6, '2023-02-23'),
(5, 8, '2023-02-28'),
(6, 1, '2023-02-10'),
(6, 2, '2023-02-10'),
(6, 3, '2023-02-10'),
(6, 4, '2023-02-10'),
(6, 5, '2023-02-10'),
(6, 6, '2023-02-15'),
(6, 7, '2023-02-10'),
(7, 7, '2023-02-16'),
(8, 8, '2023-02-17'),
(9, 9, '2023-02-18');

INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'ORDER123', '1,2');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 2, 1, 'ORDER123', '1,2');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 3, 2, 'ORDER144', '1,2,3');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 5, 2, 'ORDER123', '1,2'),
(2, 3, 1, 'ORDER124', '3'),
(3, 7, 3, 'ORDER125', '4,5,6'),
(4, 12, 1, 'ORDER126', '7'),
(5, 18, 2, 'ORDER127', '8,9'),
(6, 5, 4, 'ORDER128', '10,11,12,13'),
(7, 8, 2, 'ORDER129', '14,15'),
(8, 11, 3, 'ORDER130', '16,17,18'),
(9, 9, 1, 'ORDER131', '19'),
(10, 14, 2, 'ORDER132', '20'),
(11, 15, 1, 'ORDER133', '21'),
(12, 20, 3, 'ORDER134', '22,23,24'),
(13, 4, 2, 'ORDER135', '25,26'),
(14, 6, 1, 'ORDER136', '27'),
(15, 10, 4, 'ORDER137', '28,29,30,31'),
(16, 13, 2, 'ORDER138', '32,33'),
(17, 16, 1, 'ORDER139', '34'),
(18, 17, 3, 'ORDER140', '35,36,37'),
(19, 19, 2, 'ORDER141', '38,39'),
(20, 1, 1, 'ORDER143', '40'),
(20, 2, 1, 'ORDER142', '40');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 5, '2023-01-10');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 2, 5, '2023-01-19');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 3, 4, '2023-01-20');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 4, 5, '2023-12-11'),
(1, 7, 3, '2023-01-23'),
(2, 2, 4, '2023-01-11'),
(2, 5, 5, '2023-01-21'),
(2, 8, 5, '2023-01-24'),
(3, 3, 4, '2023-01-12'),
(3, 6, 5, '2023-01-22'),
(3, 8, 5, '2023-01-25'),
(4, 1, 4, '2023-01-26'),
(4, 4, 5, '2023-01-13'),
(4, 5, 5, '2023-01-27'),
(5, 1, 4, '2023-01-29'),
(5, 5, 4, '2023-01-14'),
(5, 8, 5, '2023-01-28'),
(6, 6, 4, '2023-01-15'),
(7, 7, 5, '2023-01-16'),
(8, 8, 4, '2023-01-17'),
(9, 9, 4, '2023-01-18');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Pizza Palace', 'restaurant1.jpg', 'A cozy pizzeria with a variety of pizza options.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Pasta Paradise', 'restaurant2.jpg', 'Italian restaurant specializing in pasta dishes.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Salad Sensation', 'restaurant3.jpg', 'Healthy salads made to order.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'Dessert Delight', 'restaurant4.jpg', 'Indulge in sweet treats and desserts.'),
(5, 'Beverage Bar', 'restaurant5.jpg', 'Quench your thirst with a wide range of beverages.'),
(6, 'Sushi Savor', 'restaurant6.jpg', 'Sushi restaurant offering fresh sushi rolls.'),
(7, 'Steakhouse Supreme', 'restaurant7.jpg', 'Savor the finest steaks and meats.'),
(8, 'Burger Bistro', 'restaurant8.jpg', 'Burgers made with quality ingredients.'),
(9, 'Soup Station', 'restaurant9.jpg', 'Warm up with a variety of soup options.'),
(10, 'Indian Flavors', 'restaurant10.jpg', 'Authentic Indian cuisine with a variety of spices.'),
(11, 'Mexican Fiesta', 'restaurant11.jpg', 'Taste the flavors of Mexico with our dishes.'),
(12, 'Chinese Cuisine', 'restaurant12.jpg', 'Chinese dishes made to perfection.');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Garlic Bread', 4.99, 7);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Caesar Salad', 5.99, 8);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Chocolate Chip Cookie', 2.99, 4);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Fries', 3.99, 9),
(5, 'Miso Soup', 2.99, 6),
(6, 'Pepperoni Pizza', 14.99, 7),
(7, 'Linguine Alfredo', 12.99, 8),
(8, 'Onion Rings', 4.99, 9),
(9, 'Green Tea', 2.99, 4),
(10, 'Tempura Roll', 18.99, 11),
(11, 'Ribeye Steak', 29.99, 13),
(12, 'Sweet Potato Fries', 4.99, 9),
(13, 'Minestrone Soup', 5.99, 6),
(14, 'Tofu Burger', 10.99, 9),
(15, 'Cucumber Roll', 14.99, 11),
(16, 'Pepperoni & Sausage Pizza', 16.99, 7),
(17, 'Spicy Penne Arrabbiata', 13.99, 8),
(18, 'Bacon Cheeseburger', 11.99, 9),
(19, 'Sashimi Platter', 22.99, 11),
(20, 'Gluten-Free Margherita Pizza', 15.99, 17);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Wick', 'wick@example.com', 'password25');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'John Doe', 'john@example.com', 'password1');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Jane Smith', 'jane@example.com', 'password2');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Alice Johnson', 'alice@example.com', 'password3'),
(5, 'Bob Brown', 'bob@example.com', 'password4'),
(6, 'Eva Davis', 'eva@example.com', 'password5'),
(7, 'Mike Wilson', 'mike@example.com', 'password6'),
(8, 'Olivia Lee', 'olivia@example.com', 'password7'),
(9, 'David Martin', 'david@example.com', 'password8'),
(10, 'Sophia Clark', 'sophia@example.com', 'password9'),
(11, 'Daniel Hall', 'daniel@example.com', 'password10'),
(12, 'Emily Anderson', 'emily@example.com', 'password11'),
(13, 'Liam Moore', 'liam@example.com', 'password12'),
(14, 'Chloe White', 'chloe@example.com', 'password13'),
(15, 'James Taylor', 'james@example.com', 'password14'),
(16, 'Ava Harris', 'ava@example.com', 'password15'),
(17, 'William Jones', 'william@example.com', 'password16'),
(18, 'Mia Brown', 'mia@example.com', 'password17'),
(19, 'Benjamin Smith', 'benjamin@example.com', 'password18'),
(20, 'Emma Davis', 'emma@example.com', 'password19'),
(21, 'Lucas Miller', 'lucas@example.com', 'password20');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;