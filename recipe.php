<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Awesome Food Recipes by Kame House">
    <meta name="keywords" content="Food, Recipes, Kame, Kitchen">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Kame Kitchen</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header-section-other">
        <div class="container-fluid">
            <div class="logo">
                <a href="./index.html"><img src="img/little-logo.png" alt=""></a>
            </div>
            <div class="nav-menu">
                <nav class="main-menu mobile-menu">
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="allRecipes.php">Recipes</a>
                            <ul class="sub-menu">
                                <li><a href="#">Recipe</a></li>
                                <li><a href="#">Recipe</a></li>
                                <li><a href="#">Recipe</a></li>
                                <li><a href="#">Recipe</a></li>
                            </ul>
                        </li>
                        <li><a href="allBlogs.html">Blogs</a>
                            <ul class="sub-menu">
                                <li><a href="blog.html">Blog</a></li>
                                <li><a href="blog.html">Blog</a></li>
                                <li><a href="blog.html">Blog</a></li>
                                <li><a href="blog.html">Blog</a></li>
                            </ul>
                        </li>
                        <li><a href="about-me.html">About Me</a></li>
                    </ul>
                </nav>
                <div class="nav-right search-switch">
                    <i class="fa fa-search"></i>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Hero Search Section Begin -->
    <div class="hero-search set-bg" data-setbg="img/search-bg.jpg">
        <div class="container">
            <div class="filter-table">
                <form action="#" class="filter-search">
                    <input type="text" placeholder="Search recipe">
                    <select id="category">
                        <option value="">Category</option>
                    </select>
                    <select id="tag">
                        <option value="">Tags</option>
                    </select>
                    <button type="submit">Search</button>
                </form>
            </div>
        </div>
    </div>
    <!-- Hero Search Section End -->

    <?php
        include 'db.php';

        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            die('Invalid recipe.');
        }

        $recipe_id = (int) $_GET['id'];

        /* ---- Recipe ---- */
        $stmt = $conn->prepare("SELECT * FROM recipes WHERE id = ?");
        $stmt->bind_param("i", $recipe_id);
        $stmt->execute();
        $recipe = $stmt->get_result()->fetch_assoc();

        if (!$recipe) {
            die('Recipe not found.');
        }

        /* ---- Tags ---- */
        $tags = [];
        $res = $conn->query("SELECT tag FROM recipe_tags WHERE recipe_id = $recipe_id");
        while ($row = $res->fetch_assoc()) {
            $tags[] = $row['tag'];
        }

        /* ---- Ingredients ---- */
        $ingredients = [
            'ingredient' => [],
            'accessory' => [],
            'extra' => []
        ];

        $res = $conn->query("
            SELECT item, list_type 
            FROM recipe_ingredients 
            WHERE recipe_id = $recipe_id
        ");
        while ($row = $res->fetch_assoc()) {
            $ingredients[$row['list_type']][] = $row['item'];
        }

        /* ---- Steps ---- */
        $steps = [];
        $res = $conn->query("
            SELECT step_number, instruction 
            FROM recipe_steps 
            WHERE recipe_id = $recipe_id
            ORDER BY step_number
        ");
        while ($row = $res->fetch_assoc()) {
            $steps[] = $row;
        }

        /* ---- Nutrition ---- */
        $nutrition = $conn
            ->query("SELECT * FROM recipe_nutrition WHERE recipe_id = $recipe_id")
            ->fetch_assoc();
    ?>

    <!-- Single Recipe Section Begin -->
    <section class="single-page-recipe py-5">
        <div class="recipe-top">
            <div class="container-fluid text-center px-4 mb-5"">
                <div class=" recipe-title">
                <h2>
                    <?= htmlspecialchars($recipe['title']); ?>
                </h2>
                <ul class="tags">
                    <?php foreach ($tags as $tag): ?>
                    <li>
                        <?= htmlspecialchars($tag); ?>
                    </li>
                    <?php endforeach; ?>
                </ul>
            </div>
            <div class="recipe-hero">
                <img src="<?= htmlspecialchars($recipe['image_main']); ?>" class="img-fluid">
            </div>
        </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="ingredients-item">
                        <div class="intro-item">
                            <img src="img/intro-img.jpg" alt="">
                            <h2>Chipotle Sweet Potato Noodle with Roasted Corn</h2>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="reviews">4.9 from 25 reviews</div>
                            <div class="recipe-time">
                                <ul>
                                    <li>Prep time: <span>
                                            <?= $recipe['prep_time']; ?> min
                                        </span></li>
                                    <li>Cook time: <span>
                                            <?= $recipe['cook_time']; ?> min
                                        </span></li>
                                    <li>Yield: <span>
                                            <?= $recipe['servings']; ?>
                                        </span></li>
                                </ul>

                            </div>
                        </div>
                        <div class="ingredient-list">
                            <div class="recipe-btn">
                                <a href="#">Print Recipe</a>
                                <a href="#" class="black-btn">Pin Recipe</a>
                            </div>
                            <div class="list-item">
                                <h5>Ingredients</h5>

                                <?php if (!empty($ingredients['ingredient'])): ?>
                                <ul>
                                    <?php foreach ($ingredients['ingredient'] as $item): ?>
                                    <li>
                                        <?= htmlspecialchars($item); ?>
                                    </li>
                                    <?php endforeach; ?>
                                </ul>
                                <?php endif; ?>

                                <?php if (!empty($ingredients['accessory'])): ?>
                                <h6>Accessories</h6>
                                <ul>
                                    <?php foreach ($ingredients['accessory'] as $item): ?>
                                    <li>
                                        <?= htmlspecialchars($item); ?>
                                    </li>
                                    <?php endforeach; ?>
                                </ul>
                                <?php endif; ?>

                                <?php if (!empty($ingredients['extra'])): ?>
                                <h6>Extras</h6>
                                <ul>
                                    <?php foreach ($ingredients['extra'] as $item): ?>
                                    <li>
                                        <?= htmlspecialchars($item); ?>
                                    </li>
                                    <?php endforeach; ?>
                                </ul>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                    <div class="nutrition-fact">
                        <div class="nutri-title">
                            <h6>Nutrition Facts</h6>
                        </div>
                        <ul>
                            <li>Total Fat:
                                <?= htmlspecialchars($nutrition['total_fat']); ?>
                            </li>
                            <li>Protein:
                                <?= htmlspecialchars($nutrition['protein']); ?>
                            </li>
                            <li>Calories:
                                <?= htmlspecialchars($nutrition['calories']); ?>
                            </li>
                        </ul>

                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="recipe-right">
                        <div class="recipe-desc">
                            <h3>Description</h3>
                            <p>
                                <?= nl2br(htmlspecialchars($recipe['description'])); ?>
                            </p>
                        </div>
                        <div class="instruction-list">
                            <h3>Instructions</h3>
                            <ul>
                                <?php foreach ($steps as $i => $step): ?>
                                <li>
                                    <span>
                                        <?= str_pad($i + 1, 2, '0', STR_PAD_LEFT); ?>.
                                    </span>
                                    <?= htmlspecialchars($step['instruction']); ?>
                                </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                        <?php if (!empty($recipe['notes'])): ?>
                        <div class="notes">
                            <h3>Notes</h3>
                            <div class="notes-item">
                                <span>i</span>
                                <p>
                                    <?= nl2br(htmlspecialchars($recipe['notes'])); ?>
                                </p>
                            </div>
                        </div>
                        <?php endif; ?>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Single Recipe Section End -->

    <!-- Similar Recipe Section Begin -->
    <section class="similar-recipe">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="similar-item">
                        <a href="#"><img src="img/cat-feature/small-7.jpg" alt=""></a>
                        <div class="similar-text">
                            <div class="cat-name">Vegan</div>
                            <h6>Italian Tiramisu with Coffe</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="similar-item">
                        <a href="#"><img src="img/cat-feature/small-6.jpg" alt=""></a>
                        <div class="similar-text">
                            <div class="cat-name">Vegan</div>
                            <h6>Dry Cookies with Corn</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="similar-item">
                        <a href="#"><img src="img/cat-feature/small-5.jpg" alt=""></a>
                        <div class="similar-text">
                            <div class="cat-name">Vegan</div>
                            <h6>Asparagus with Pork Loin and Vegetables</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Similar Recipe Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="fs-left">
                        <div class="logo">
                            <a href="./index.html">
                                <img src="img/footer-logo.png" alt="">
                            </a>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo
                            viverra maecenas accumsan lacus vel facilisis.</p>
                    </div>
                </div>
                <div class="col-lg-6 offset-lg-1">
                    <form action="#" class="subscribe-form">
                        <h3>Subscribe to our newsletter</h3>
                        <input type="email" placeholder="Your e-mail">
                        <button type="submit">Subscribe</button>
                    </form>
                    <div class="social-links">
                        <a href="#"><i class="fa fa-instagram"></i><span>Instagram</span></a>
                        <a href="#"><i class="fa fa-pinterest"></i><span>Pinterest</span></a>
                        <a href="#"><i class="fa fa-facebook"></i><span>Facebook</span></a>
                        <a href="#"><i class="fa fa-twitter"></i><span>Twitter</span></a>
                        <a href="#"><i class="fa fa-youtube"></i><span>Youtube</span></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="copyright-text">
                        &copy;
                        <script>document.write(new Date().getFullYear());</script> All rights reserved
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->
    <!-- Search model -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>