<?php
include_once "../init.php";
include_once DB_ROOT . 'database.php';

$products   = $connection->paginate("products", 4, 1);
$categories = $connection->findAll('categories');

$today         = date('Y-m-d');
$active_offers = [];

$check = $connection->customQuery("SHOW TABLES LIKE 'offers'");
if (!empty($check)) {
    $active_offers = $connection->customQuery(
        "SELECT * FROM offers
         WHERE off_status = 'active'
           AND off_start_date <= :today
           AND off_end_date   >= :today
         ORDER BY off_id DESC",
        ['today' => $today]
    );
    if (!is_array($active_offers)) {
        $active_offers = [];
    }
}

// ✅ Order Closed Logic (same as checkout)
$current_hour = (int)date('H');
$order_closed = $current_hour >= 20;
?>

<?php include_once '../includes/header.php' ?>
<?php include_once '../includes/nav.php' ?>

<style>
/* ── Order Closed Banner ── */
.order-closed-banner {
    background: linear-gradient(135deg, #c0392b, #e74c3c);
    color: #fff;
    padding: 14px 20px;
    text-align: center;
    position: relative;
    z-index: 999;
    box-shadow: 0 3px 12px rgba(192,57,43,0.35);
    animation: pulseBanner 2.5s ease-in-out infinite;
}
@keyframes pulseBanner {
    0%, 100% { box-shadow: 0 3px 12px rgba(192,57,43,0.35); }
    50%       { box-shadow: 0 3px 22px rgba(192,57,43,0.65); }
}
.order-closed-banner .banner-inner {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
    gap: 10px;
}
.order-closed-banner .banner-icon {
    font-size: 1.4rem;
    animation: rotateClock 4s linear infinite;
}
@keyframes rotateClock {
    0%   { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
.order-closed-banner .banner-text {
    font-size: 0.97rem;
    font-weight: 600;
    letter-spacing: 0.3px;
}
.order-closed-banner .banner-text strong {
    font-size: 1.05rem;
    text-decoration: underline dotted;
}
.order-closed-banner .banner-badge {
    background: rgba(255,255,255,0.22);
    border: 1.5px solid rgba(255,255,255,0.5);
    border-radius: 30px;
    padding: 3px 14px;
    font-size: 0.82rem;
    font-weight: 700;
    letter-spacing: 0.5px;
    white-space: nowrap;
}
.order-closed-banner .banner-dismiss {
    position: absolute;
    right: 16px;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(255,255,255,0.2);
    border: none;
    color: #fff;
    border-radius: 50%;
    width: 26px;
    height: 26px;
    font-size: 0.9rem;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background 0.2s;
}
.order-closed-banner .banner-dismiss:hover {
    background: rgba(255,255,255,0.35);
}

/* ── Offer Strip ── */
.offer-strip {
    background: linear-gradient(90deg,#c0392b,#e74c3c,#ff6600,#e74c3c,#c0392b);
    background-size: 300% auto;
    animation: stripAnim 4s linear infinite;
    padding: 8px 0;
    overflow: hidden;
}
@keyframes stripAnim {
    0%   { background-position: 0% center; }
    100% { background-position: 300% center; }
}
.offer-ticker-wrap { overflow: hidden; white-space: nowrap; }
.offer-ticker-inner {
    display: inline-block;
    animation: tickerMove 25s linear infinite;
}
@keyframes tickerMove {
    0%   { transform: translateX(100vw); }
    100% { transform: translateX(-100%); }
}
.offer-ticker-item {
    display: inline-block;
    color: #fff;
    font-weight: 600;
    font-size: 0.82rem;
    letter-spacing: 0.5px;
    margin-right: 60px;
}
.offers-section { background: #ffffff; padding: 20px 0 40px; }
.offers-section .sec-eyebrow { font-size: 0.7rem; font-weight: 700; letter-spacing: 3px; text-transform: uppercase; color: #e74c3c; margin-bottom: 5px; }
.offers-section .sec-title { font-size: clamp(1.5rem, 3vw, 2rem); font-weight: 800; color: #1a2a3a; margin-bottom: 4px; }
.offers-section .sec-title span { color: #ff6600; }
.offers-section .sec-sub { color: #777; font-size: 0.88rem; margin-bottom: 25px; }
.offer-card { background: #ffffff; border-radius: 18px; height: 100%; overflow: hidden; position: relative; border: 2.5px solid transparent; background-image: linear-gradient(white, white), linear-gradient(135deg, #e74c3c, #ff6600); background-origin: border-box; background-clip: content-box, border-box; box-shadow: 0 8px 20px rgba(0,0,0,0.04); transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275); }
.offer-card:hover { transform: translateY(-8px); background-image: linear-gradient(white, white), linear-gradient(135deg, #ff6600, #e74c3c); box-shadow: 0 15px 35px rgba(231, 76, 60, 0.12); }
.offer-img-wrap { height: 190px; overflow: hidden; position: relative; }
.offer-img-wrap img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.5s ease; }
.offer-body { padding: 18px; }
.offer-title { font-size: 1.05rem; font-weight: 700; color: #2c3e50; margin-bottom: 5px; }
.offer-desc { font-size: 0.82rem; color: #555; line-height: 1.5; margin-bottom: 12px; }
.offer-validity { font-size: 0.82rem; color: #555; margin-bottom: 10px; display: flex; align-items: center; gap: 6px; }
.offer-validity i { color: #e74c3c; }
.offer-coupon { display: flex; align-items: center; gap: 8px; background: #fff8f0; border: 1.5px dashed #ff6600; border-radius: 8px; padding: 8px 12px; margin-bottom: 12px; }
.coupon-label { font-size: 0.78rem; color: #888; font-weight: 600; white-space: nowrap; }
.coupon-code { font-size: 0.88rem; font-weight: 800; color: #e74c3c; letter-spacing: 1.5px; cursor: pointer; text-transform: uppercase; transition: color 0.2s; }
.coupon-code:hover { color: #ff6600; }
.offer-btn { display: flex; align-items: center; justify-content: center; gap: 8px; background: linear-gradient(135deg, #e74c3c, #ff6600); color: #fff !important; padding: 10px 0; border-radius: 10px; font-weight: 600; font-size: 0.85rem; text-decoration: none !important; transition: 0.3s; }
.offer-btn:hover { filter: brightness(1.1); box-shadow: 0 5px 15px rgba(192,57,43,0.3); }
.offer-badge { position: absolute; top: 10px; right: 10px; background: linear-gradient(135deg, #c0392b, #e74c3c); color: #fff; font-weight: 800; font-size: 0.8rem; padding: 4px 10px; border-radius: 6px; z-index: 2; }
</style>

<!-- ✅ Order Closed Banner (Only show after 8 PM) -->
<?php if ($order_closed): ?>
<div class="order-closed-banner" id="orderClosedBanner">
    <div class="banner-inner">
        <span class="banner-icon">🕗</span>
        <span class="banner-text">
            <strong>Orders are closed for today!</strong>
            &nbsp;We accept orders only until <strong>8:00 PM</strong>. Come back tomorrow morning 🌅
        </span>
        <span class="banner-badge">Opens Tomorrow</span>
    </div>
    <button class="banner-dismiss" onclick="dismissBanner()" title="Dismiss">✕</button>
</div>
<?php endif; ?>

<section class="hero-section">
    <div class="container">
        <h1 class="hero-title">Discover Premium Cakes</h1>
        <p class="hero-subtitle">Handpicked delicious treats delivered to your doorstep</p>
        <a href="<?= ROOT . 'shop' ?>" class="btn btn-primary me-2">
            Shop Now <i class="fas fa-arrow-right ms-2"></i>
        </a>
    </div>
</section>

<?php if (!empty($active_offers)) : ?>
<div class="offer-strip">
    <div class="offer-ticker-wrap">
        <div class="offer-ticker-inner">
            <?php foreach ($active_offers as $o) : ?>
                <span class="offer-ticker-item">
                    <i class="fas fa-tag"></i>
                    <?= htmlspecialchars($o['off_title']) ?> &mdash; <?= $o['off_discount_percent'] ?>% OFF
                    <?php if (!empty($o['off_coupon_code'])) : ?>
                        | Use Code: <strong><?= htmlspecialchars($o['off_coupon_code']) ?></strong>
                    <?php endif; ?>
                </span>
                <span class="offer-ticker-sep">✦</span>
            <?php endforeach; ?>
            <?php foreach ($active_offers as $o) : ?>
                <span class="offer-ticker-item">
                    <i class="fas fa-tag"></i>
                    <?= htmlspecialchars($o['off_title']) ?> &mdash; <?= $o['off_discount_percent'] ?>% OFF
                    <?php if (!empty($o['off_coupon_code'])) : ?>
                        | Use Code: <strong><?= htmlspecialchars($o['off_coupon_code']) ?></strong>
                    <?php endif; ?>
                </span>
                <span class="offer-ticker-sep">✦</span>
            <?php endforeach; ?>
        </div>
    </div>
</div>
<?php endif; ?>

<section class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-6 mb-4">
                <div class="feature-box">
                    <div class="feature-icon"><i class="fas fa-truck"></i></div>
                    <h5>Free Delivery</h5>
                    <p class="mb-0">On orders over ₹500</p>
                    <p class="mb-0">(we deliver only in ahmedabad)</p>
                </div>
            </div>
            <div class="col-md-3 col-6 mb-4">
                <div class="feature-box">
                    <div class="feature-icon"><i class="fas fa-cake"></i></div>
                    <h5>Custom Cake Available</h5>
                    <p class="mb-0">Order at least 1 day in advance on our contact number.</p>
                </div>
            </div>
            <div class="col-md-3 col-6 mb-4">
                <div class="feature-box">
                    <div class="feature-icon"><i class="fas fa-shield-alt"></i></div>
                    <h5>Secure Payment</h5>
                    <p class="mb-0">100% secure checkout</p>
                    <p class="mb-0">Refund Available</p>
                </div>
            </div>
            <div class="col-md-3 col-6 mb-4">
                <div class="feature-box">
                    <div class="feature-icon"><i class="fas fa-thumbs-up"></i></div>
                    <h5>Customer Satisfaction First</h5>
                    <p class="mb-0">Your happiness is our priority</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <h2 class="section-title">Our Categories</h2>
        <div class="row">
            <?php foreach ($categories as $category) : ?>
                <div class="col-md-3 col-6 mb-4">
                    <?php
                    $cat_name_lower = strtolower($category["category_name"]);
                    if ($cat_name_lower == 'customization') {
                        $link = ROOT . 'customize_cake.php';
                    } else {
                        $link = ROOT . 'shop?category=' . $cat_name_lower;
                    }
                    ?>
                    <a href="<?= $link ?>" class="d-block category-card link-underline link-underline-opacity-0 text-secondary">
                        <img src="<?= ROOT . 'assets/images/' . $category["category_image"] ?>"
                             class="category-img w-100"
                             alt="<?= htmlspecialchars($category["category_name"]) ?>">
                        <h5 class="category-title mt-2 text-center">
                            <?= htmlspecialchars($category["category_name"]) ?>
                        </h5>
                    </a>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>

<?php if (!empty($active_offers)) : ?>
<section class="offers-section">
    <div class="container">
        <div class="text-center">
            <p class="sec-eyebrow">🏷️ Limited Time</p>
            <h2 class="sec-title">Festival <span>Special Offers</span></h2>
            <p class="sec-sub">Grab the best deals before they expire!</p>
        </div>
        <div class="row justify-content-center">
            <?php foreach ($active_offers as $offer) : ?>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="offer-card">
                    <?php if (!empty($offer['off_image'])) : ?>
                        <div class="offer-img-wrap">
                            <img src="<?= ROOT . 'assets/images/' . $offer['off_image'] ?>" alt="<?= htmlspecialchars($offer['off_title']) ?>">
                            <div class="offer-badge">🏷️ <?= $offer['off_discount_percent'] ?>% OFF</div>
                        </div>
                    <?php else : ?>
                        <div class="offer-img-placeholder">
                            🎂
                            <div class="offer-badge">🏷️ <?= $offer['off_discount_percent'] ?>% OFF</div>
                        </div>
                    <?php endif; ?>
                    <div class="offer-body">
                        <h4 class="offer-title"><?= htmlspecialchars($offer['off_title']) ?></h4>
                        <?php if (!empty($offer['off_description'])) : ?>
                            <p class="offer-desc"><?= htmlspecialchars($offer['off_description']) ?></p>
                        <?php endif; ?>
                        <div class="offer-validity">
                            <i class="fas fa-clock"></i>
                            Valid till:
                            <strong style="color:#ff6600;"><?= date('d M Y', strtotime($offer['off_end_date'])) ?></strong>
                        </div>
                        <?php if (!empty($offer['off_coupon_code'])) : ?>
                        <div class="offer-coupon">
                            <span class="coupon-label"><i class="fas fa-ticket-alt me-1" style="color:#ff6600;"></i> Coupon:</span>
                            <span class="coupon-code" onclick="copyCoupon(this)" title="Click to copy">
                                <?= htmlspecialchars($offer['off_coupon_code']) ?>
                                <i class="fas fa-copy ms-1"></i>
                            </span>
                        </div>
                        <?php endif; ?>
                        <a href="<?= ROOT . 'shop' ?>" class="offer-btn">Shop Now <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>
<?php endif; ?>

<section class="py-5 bg-white">
    <div class="container">
        <h2 class="section-title">Featured Products</h2>
        <div class="scroll-container">
            <div class="row">
                <?php foreach ($products as $product) :
                    $reviews = $connection->find("reviews", ["product_id" => $product["product_id"]]);
                ?>
                    <div class="product-card col-md-3 mb-4">
                        <div class="position-relative">
                            <img src="<?= ROOT . 'assets/images/' . $product["product_image"] ?>"
                                 class="product-img w-100"
                                 alt="<?= htmlspecialchars($product["product_name"]) ?>">
                        </div>
                        <div class="card-body">
                            <h5 class="product-title"><?= htmlspecialchars($product["product_name"]) ?></h5>
                            <div class="product-rating">
                                <?= displayStars(getAverageRating($reviews)) ?>
                                <span class="text-muted ms-2">(<?= getAverageRating($reviews) ?>)</span>
                            </div>
                            <p class="product-price">₹<?= number_format($product["product_price"], 2) ?></p>
                            <a href="<?= ROOT . 'shop/view?id=' . $product['product_id'] ?>" class="btn btn-primary w-100">View Detail</a>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</section>

<script>
function copyCoupon(el) {
    const code = el.firstChild.textContent.trim();
    navigator.clipboard.writeText(code).then(() => {
        const orig = el.innerHTML;
        el.innerHTML = 'Copied! <i class="fas fa-check ms-1"></i>';
        el.style.color = '#27ae60';
        setTimeout(() => { el.innerHTML = orig; el.style.color = ''; }, 2000);
    }).catch(() => {
        const temp = document.createElement('textarea');
        temp.value = code;
        document.body.appendChild(temp);
        temp.select();
        document.execCommand('copy');
        document.body.removeChild(temp);
        const orig = el.innerHTML;
        el.innerHTML = 'Copied! <i class="fas fa-check ms-1"></i>';
        el.style.color = '#27ae60';
        setTimeout(() => { el.innerHTML = orig; el.style.color = ''; }, 2000);
    });
}

function dismissBanner() {
    const banner = document.getElementById('orderClosedBanner');
    if (banner) {
        banner.style.transition = 'all 0.4s ease';
        banner.style.maxHeight = banner.offsetHeight + 'px';
        requestAnimationFrame(() => {
            banner.style.maxHeight = '0';
            banner.style.padding = '0';
            banner.style.overflow = 'hidden';
            banner.style.opacity = '0';
        });
        setTimeout(() => banner.remove(), 420);
    }
}
</script>

<?php include_once "../includes/footer.php" ?>