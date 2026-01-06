<!DOCTYPE html>
<html lang="en">

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
                        <li class="active"><a href="#">Recipes</a>
                            <ul class="sub-menu">
                                <li><a href="recipe.php">Recipe</a></li>
                                <li><a href="recipe.php">Recipe</a></li>
                                <li><a href="recipe.php">Recipe</a></li>
                                <li><a href="recipe.php">Recipe</a></li>
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

    <!-- Recipe Section Begin -->
    <?php
        include 'db.php';

        $sql = "
            SELECT 
                r.id,
                r.title,
                r.description,
                r.image_main,
                (
                    SELECT rt.tag 
                    FROM recipe_tags rt 
                    WHERE rt.recipe_id = r.id 
                    ORDER BY rt.id ASC 
                    LIMIT 1
                ) AS main_tag
            FROM recipes r
            ORDER BY r.created_at DESC
        ";

        $result = $conn->query($sql);
    ?>

    <section class="recipe-section spad">
        <div class="container">
            <div class="row">

                <?php while ($row = $result->fetch_assoc()): ?>

                <div class="col-lg-3 col-sm-6">
                    <div class="recipe-item">
                        <a href="recipe.php?id=<?= $row['id']; ?>">
                            <img src="<?= htmlspecialchars($row['image_main']); ?>"
                                alt="<?= htmlspecialchars($row['title']); ?>">
                        </a>

                        <div class="ri-text">
                            <div class="cat-name">
                                <?= htmlspecialchars($row['main_tag'] ?? 'Recipe'); ?>
                            </div>

                            <a href="recipe.php?id=<?= $row['id']; ?>">
                                <h4>
                                    <?= htmlspecialchars($row['title']); ?>
                                </h4>
                            </a>

                            <p>
                                <?= htmlspecialchars(mb_strimwidth($row['description'], 0, 110, '...')); ?>
                            </p>
                        </div>
                    </div>
                </div>

                <?php endwhile; ?>

            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="recipe-pagination">
                        <a href="#" class="active">01</a>
                        <a href="#">02</a>
                        <a href="#">03</a>
                        <a href="#">04</a>
                        <a href="#">Next</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Recipe Section End -->

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