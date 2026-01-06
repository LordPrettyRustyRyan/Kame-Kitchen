-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 04, 2026 at 09:47 PM
-- Server version: 8.0.44
-- PHP Version: 8.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kame_recipes`
--

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `image_main` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prep_time` int NOT NULL,
  `cook_time` int NOT NULL,
  `servings` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `description`, `notes`, `image_main`, `prep_time`, `cook_time`, `servings`, `created_at`) VALUES
(1, 'Egg Mayonnaise', 'A creamy and protein-rich egg-based spread made with boiled eggs, olive oil, and simple seasonings—perfect for quick snacks.', NULL, 'img/recipe/recipe-1.jpg', 2, 15, 6, '2026-01-04 21:11:20'),
(2, 'Dahi Cutlets / Kebabs', 'Crispy and creamy vegetarian cutlets made with hung curd, paneer, and spices—perfect as a tea-time snack or party appetizer.', NULL, 'img/recipe/recipe-2.jpg', 15, 10, 3, '2026-01-04 21:16:04'),
(3, 'Roti Pizza', 'A quick and cheesy Indian fusion snack made with half-cooked rotis, loaded with veggies, and topped like a pizza—crispy, fun, and flavorful!', NULL, 'img/recipe/recipe-3.jpg', 5, 10, 2, '2026-01-04 21:26:37'),
(4, 'Cocoa-Banana Bites', 'Frozen banana slices dipped in chocolatey yogurt for a refreshing, healthy dessert that’s perfect for summer cravings.', NULL, 'img/recipe/recipe-4.jpg', 120, 0, 2, '2026-01-04 21:26:46'),
(5, 'Egg-Rice Omelet', 'A fluffy and savory omelet made with eggs, cooked rice, veggies, and spices—perfect for a filling breakfast.', NULL, 'img/recipe/recipe-5.jpg', 10, 10, 2, '2026-01-04 21:26:54'),
(6, 'Banana Cake', 'A soft and wholesome banana cake made with oat flour, maple syrup, and peanut butter—naturally sweet and optionally vegan.', 'Can be made vegan using flax egg.', 'img/recipe/recipe-6.jpg', 10, 20, 1, '2026-01-04 21:27:01'),
(7, 'Buddha Bowl', 'A colorful and nutrient-rich Buddha Bowl loaded with quinoa, chickpeas, paneer, and vibrant veggies – perfect for a wholesome and satisfying meal.', NULL, 'img/recipe/recipe-7.jpg', 15, 15, 1, '2026-01-04 21:37:40'),
(8, 'Moonglet (Moong Dal Omelette)', 'A savory and fluffy Indian-style lentil pancake packed with veggies and protein — ideal for a nutritious breakfast or light dinner.', NULL, 'img/recipe/recipe-8.jpg', 10, 10, 2, '2026-01-04 21:37:51');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `list_type` enum('ingredient','accessory','extra') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'ingredient'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `item`, `list_type`) VALUES
(1, 1, 'Boiled eggs', 'ingredient'),
(2, 1, '2 tbsp olive oil (or any neutral oil)', 'ingredient'),
(3, 1, '1 tsp vinegar', 'ingredient'),
(4, 1, '1/3 cup water', 'ingredient'),
(5, 1, '1/2 tsp black pepper', 'ingredient'),
(6, 1, 'Salt (to taste)', 'ingredient'),
(7, 2, '½ cup hung curd', 'ingredient'),
(8, 2, '¼ cup diced onions', 'ingredient'),
(9, 2, '½ cup paneer or mozzarella cheese (grated)', 'ingredient'),
(10, 2, '2 tbsp chopped coriander', 'ingredient'),
(11, 2, '1 green chili (finely chopped)', 'ingredient'),
(12, 2, '5–6 cashews (chopped, optional)', 'ingredient'),
(13, 2, '½ tsp salt (adjust to taste)', 'ingredient'),
(14, 2, '¼ tsp black pepper', 'ingredient'),
(15, 2, '½ tsp jeera powder (cumin powder)', 'ingredient'),
(16, 2, '¼ tsp garam masala', 'ingredient'),
(17, 2, '6–8 bread slices', 'ingredient'),
(18, 2, 'Water (for moistening bread)', 'ingredient'),
(19, 2, 'Oil for frying or air frying', 'ingredient'),
(20, 3, '2 half-cooked rotis (chapati)', 'ingredient'),
(21, 3, '4 tbsp pizza sauce', 'ingredient'),
(22, 3, '½ cup mozzarella cheese (grated)', 'ingredient'),
(23, 3, '½ small onion (diced)', 'ingredient'),
(24, 3, '½ capsicum (diced)', 'ingredient'),
(25, 3, '¼ cup spinach (chopped)', 'ingredient'),
(26, 3, '2 tbsp sweet corn', 'ingredient'),
(27, 3, '1 tbsp coriander (chopped)', 'ingredient'),
(28, 3, '½ tsp oregano', 'ingredient'),
(29, 3, '½ tsp chili flakes', 'ingredient'),
(30, 3, '½ tsp butter (for tawa method)', 'ingredient'),
(31, 3, 'Optional veggies (mushrooms, olives, jalapeños)', 'ingredient'),
(32, 3, 'Paneer or tofu (small cubes, optional)', 'ingredient'),
(33, 4, '2 bananas (sliced)', 'ingredient'),
(34, 4, '½ cup Greek yogurt', 'ingredient'),
(35, 4, '2 tbsp cacao or cocoa powder', 'ingredient'),
(36, 5, '2 eggs', 'ingredient'),
(37, 5, '1 cup cooked rice', 'ingredient'),
(38, 5, '¼ onion (chopped)', 'ingredient'),
(39, 5, '¼ carrot (grated)', 'ingredient'),
(40, 5, '½ tsp pepper', 'ingredient'),
(41, 5, '½ tsp salt', 'ingredient'),
(42, 5, '¼ tsp turmeric', 'ingredient'),
(43, 5, '¼ tsp paprika', 'ingredient'),
(44, 5, '1 tbsp oil or butter', 'ingredient'),
(45, 6, '1 ripe banana (mashed)', 'ingredient'),
(46, 6, '1 egg or flax egg', 'ingredient'),
(47, 6, '2 tbsp peanut butter', 'ingredient'),
(48, 6, '¼ cup maple syrup', 'ingredient'),
(49, 6, '1 cup oat flour', 'ingredient'),
(50, 6, '½ tsp baking powder', 'ingredient'),
(51, 6, 'Chocolate chips (optional)', 'ingredient'),
(52, 7, '30–40 g quinoa (or brown rice, couscous, or millet)', 'ingredient'),
(53, 7, 'Water (for cooking quinoa)', 'ingredient'),
(54, 7, 'Salt (to taste)', 'ingredient'),
(55, 7, '30 g boiled chickpeas (or rajma, lobia, Bengal gram)', 'ingredient'),
(56, 7, '¼ cup chopped onion', 'ingredient'),
(57, 7, '¼ cup chopped bell pepper', 'ingredient'),
(58, 7, '¼ cup chopped carrot', 'ingredient'),
(59, 7, '¼ cup chopped capsicum', 'ingredient'),
(60, 7, 'Salt and black pepper (to taste)', 'ingredient'),
(61, 7, '40 g paneer (cubed or crumbled, or soya chunks)', 'ingredient'),
(62, 7, '½ tsp chaat masala', 'ingredient'),
(63, 7, 'A pinch of hing (asafoetida)', 'ingredient'),
(64, 7, '1 tsp garlic paste', 'ingredient'),
(65, 7, '1 tsp olive oil', 'ingredient'),
(66, 8, '1 cup moong dal (soaked 4–5 hours)', 'ingredient'),
(67, 8, 'Salt (to taste)', 'ingredient'),
(68, 8, '¼ tsp turmeric powder', 'ingredient'),
(69, 8, '¼ cup onion (finely chopped)', 'ingredient'),
(70, 8, '¼ cup tomato (finely chopped)', 'ingredient'),
(71, 8, '¼ cup capsicum (finely chopped)', 'ingredient'),
(72, 8, '¼ cup carrot (grated or finely chopped)', 'ingredient'),
(73, 8, '2 tbsp coriander leaves (chopped)', 'ingredient'),
(74, 8, '1 green chili (optional, finely chopped)', 'ingredient'),
(75, 8, 'A pinch of hing (asafoetida)', 'ingredient'),
(76, 8, '½ tsp baking soda or Eno (optional)', 'ingredient'),
(77, 8, 'Water (as needed for batter)', 'ingredient'),
(78, 8, 'Oil or ghee (for cooking)', 'ingredient');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_nutrition`
--

CREATE TABLE `recipe_nutrition` (
  `id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `total_fat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `calories` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `protein` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_nutrition`
--

INSERT INTO `recipe_nutrition` (`id`, `recipe_id`, `total_fat`, `calories`, `protein`) VALUES
(1, 1, '7 g', '90 kcal', '5 g'),
(2, 2, '12 g', '180 kcal', '8 g'),
(3, 3, '14 g', '220 kcal', '9 g'),
(4, 4, '4 g', '110 kcal', '4 g'),
(5, 5, '11 g', '260 kcal', '13 g'),
(6, 6, '10 g', '320 kcal', '9 g'),
(7, 7, '14 g', '420 kcal', '18 g'),
(8, 8, '9 g', '260 kcal', '14 g');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_steps`
--

CREATE TABLE `recipe_steps` (
  `id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `step_number` int NOT NULL,
  `instruction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_steps`
--

INSERT INTO `recipe_steps` (`id`, `recipe_id`, `step_number`, `instruction`) VALUES
(1, 1, 1, 'Peel the boiled eggs and cut them into halves. Measure out olive oil, vinegar, water, pepper, and salt.'),
(2, 1, 2, 'Add boiled eggs, olive oil, vinegar, water, pepper, and salt into a grinder or blender. Grind until the mixture is smooth and creamy.'),
(3, 2, 1, 'In a mixing bowl, add hung curd, diced onions, grated paneer or mozzarella, chopped coriander, and green chili. Add chopped cashews if using. Season with salt, black pepper, jeera powder, and garam masala. Mix well until creamy and evenly combined.'),
(4, 2, 2, 'Lightly moisten a bread slice with water. Place a spoonful of the filling in the center and roll the bread tightly to seal. Use plastic wrap or the bread’s plastic cover to help shape and secure the roll. Repeat for remaining bread slices.'),
(5, 2, 3, 'Option 1 – Deep Frying: Heat oil over medium heat and fry the bread rolls until golden brown and crispy. Remove and place on paper towels to absorb excess oil.'),
(6, 2, 4, 'Option 2 – Air Frying: Preheat the air fryer to 180°C (350°F). Lightly brush the rolls with oil and air fry for 10–12 minutes, flipping halfway, until golden and crispy.'),
(7, 3, 1, 'Spread pizza sauce evenly over the half-cooked roti.'),
(8, 3, 2, 'Top with mozzarella cheese, veggies, coriander, oregano, and chili flakes.'),
(9, 3, 3, 'Air Fry Method: Preheat air fryer to 180°C and cook for 4–5 minutes until cheese melts and turns golden.'),
(10, 3, 4, 'Oven Method: Bake at 200°C for 6–8 minutes until crispy.'),
(11, 3, 5, 'Tawa Method: Heat butter on low flame, place roti, cover with lid, and cook until cheese melts.'),
(12, 4, 1, 'Slice bananas into even rounds.'),
(13, 4, 2, 'Mix yogurt and cacao powder until smooth.'),
(14, 4, 3, 'Dip banana slices into chocolate yogurt and coat evenly.'),
(15, 4, 4, 'Freeze on lined tray for 2 hours until firm.'),
(16, 4, 5, 'Serve straight from freezer.'),
(17, 5, 1, 'Chop onions and carrots finely.'),
(18, 5, 2, 'Beat eggs and mix with rice, veggies, and spices.'),
(19, 5, 3, 'Cook mixture in pan until golden on both sides.'),
(20, 5, 4, 'Serve warm.'),
(21, 6, 1, 'Mash banana until smooth.'),
(22, 6, 2, 'Mix egg, peanut butter, and maple syrup.'),
(23, 6, 3, 'Add oat flour, baking powder, and chocolate chips.'),
(24, 6, 4, 'Bake at 175°C for 15–20 minutes.'),
(25, 6, 5, 'Cool slightly before serving.'),
(26, 7, 1, 'Cook quinoa with water and salt in a pressure cooker for 2 whistles. Let pressure release naturally, fluff, and set aside.'),
(27, 7, 2, 'Dry roast boiled chickpeas in a pan for 4–5 minutes until slightly crispy. Set aside.'),
(28, 7, 3, 'Sauté onion, bell pepper, carrot, and capsicum with salt and black pepper for 2–3 minutes until slightly tender but crunchy.'),
(29, 7, 4, 'Season paneer with salt and chaat masala. Lightly pan-fry if desired.'),
(30, 7, 5, 'Assemble bowl with quinoa base, chickpeas, veggies, and paneer. Drizzle hing, garlic paste, olive oil, and adjust seasoning. Serve mixed or layered.'),
(31, 8, 1, 'Wash and soak moong dal for 4–5 hours. Drain and blend with minimal water into a smooth batter.'),
(32, 8, 2, 'Transfer batter to a bowl and mix in salt, turmeric, vegetables, coriander, green chili, and hing. Add baking soda or Eno just before cooking if using.'),
(33, 8, 3, 'Heat oil or ghee in a pan. Pour thick batter like an omelet and cook on low-medium heat until golden underneath.'),
(34, 8, 4, 'Poke small holes to allow even cooking, flip carefully, and cook the other side until crispy and cooked through.');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_tags`
--

CREATE TABLE `recipe_tags` (
  `id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_tags`
--

INSERT INTO `recipe_tags` (`id`, `recipe_id`, `tag`) VALUES
(1, 1, 'eggs'),
(2, 1, 'snack'),
(3, 1, 'protein'),
(4, 2, 'snack'),
(5, 2, 'party starter'),
(6, 2, 'air fryer'),
(7, 3, 'snack'),
(8, 4, 'dessert'),
(9, 4, 'sweet'),
(10, 4, 'snack'),
(11, 5, 'breakfast'),
(12, 5, 'protein'),
(13, 5, 'quick'),
(14, 5, 'eggs'),
(15, 5, 'lunch'),
(16, 6, 'dessert'),
(17, 7, 'healthy'),
(18, 7, 'protein'),
(19, 7, 'lunch'),
(20, 8, 'breakfast'),
(21, 8, 'healthy'),
(22, 8, 'protein');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipe_nutrition`
--
ALTER TABLE `recipe_nutrition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipe_steps`
--
ALTER TABLE `recipe_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `recipe_nutrition`
--
ALTER TABLE `recipe_nutrition`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `recipe_steps`
--
ALTER TABLE `recipe_steps`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipe_nutrition`
--
ALTER TABLE `recipe_nutrition`
  ADD CONSTRAINT `recipe_nutrition_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipe_steps`
--
ALTER TABLE `recipe_steps`
  ADD CONSTRAINT `recipe_steps_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  ADD CONSTRAINT `recipe_tags_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
