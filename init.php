<?php
$PROJECT_NAME = "/flavor_fusion";

date_default_timezone_set('Asia/Kolkata');

define("ASSETS_PATH", "$PROJECT_NAME/assets/");
define("ROOT", "$PROJECT_NAME/");
define("DB_ROOT", $_SERVER['DOCUMENT_ROOT'] . "$PROJECT_NAME/database/");

require_once(__DIR__ . '/database/Connection.php');

$servername = 'localhost';
$port = 3306;
$db_name = 'flavor_fusion_db';
$username = 'root';
$password = '';

$connection = new Connection($servername, $port, $db_name, $username, $password);

function displayStars($rating)
{
    $stars = "";
    for ($i = 1; $i <= 5; $i++) {
        if ($i <= floor($rating)) {
            $stars .= '<i class="fa-solid fa-star text-warning"></i> ';
        } elseif ($i - 0.5 <= $rating) {
            $stars .= '<i class="fa-solid fa-star-half-stroke text-warning"></i> ';
        } else {
            $stars .= '<i class="fa-regular fa-star text-secondary"></i> ';
        }
    }
    return $stars;
}

function getAverageRating($reviews)
{
    if (empty($reviews)) return 0;
    $totalRating = array_sum(array_column($reviews, "rating"));
    $reviewCount = count($reviews);
    $averageRating = $totalRating / $reviewCount;
    return round($averageRating, 1);
}

function parse_input($input)
{
    $parsed = trim($input);
    $parsed = stripslashes($parsed);
    $parsed = htmlspecialchars($parsed, ENT_QUOTES, "UTF-8");
    return $parsed;
}

function redirect($location)
{
    header('Location:' . ROOT . $location);
    exit(); 
}

function show_alert($message)
{
    echo '<div class="position-fixed start-50 translate-middle z-3 toast align-items-center show" role="alert" aria-live="assertive" aria-atomic="true" style="top: 20px;">
            <div class="d-flex">
                <div class="toast-body">
                    ' . htmlspecialchars($message) . '
                </div>
                <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
          </div>';
}


if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

function login($user, $type = 'user')
{
    if ($type == 'admin') {
        $_SESSION["admin_user"] = $user;
    } elseif ($type == 'staff') {
        $_SESSION["staff_user"] = $user;
    } else {
        $_SESSION["user"] = $user;
    }
}

function logout($type = 'user')
{
    if ($type == 'admin') {
        unset($_SESSION["admin_user"]);
    } elseif ($type == 'staff') {
        unset($_SESSION["staff_user"]);
    } else {
        unset($_SESSION["user"]);
    }
}

function get_auth_user()
{
    return $_SESSION["user"] ?? null;
}

function get_admin_user()
{
    return $_SESSION["admin_user"] ?? null;
}

function get_staff_user()
{
    return $_SESSION["staff_user"] ?? null;
}


function enable_unprotected_route()
{
    if (get_auth_user() !== null) {
        redirect("");
    }
}

function enable_protected_route()
{
    if (get_auth_user() === null) {
        redirect("login");
    }
}

function enable_admin_route()
{
    if (get_admin_user() === null) {
        redirect("admin/login");
    }
}

function enable_staff_route()
{
    if (get_staff_user() === null) {
        redirect("staff/login");
    }
}


function sendEmail($to, $subject, $message, $fromEmail = 'noreply@example.com', $fromName = 'Flavor Fusion')
{
    $headers = "From: $fromName <$fromEmail>\r\n";
    $headers .= "Reply-To: $fromEmail\r\n";
    $headers .= "MIME-Version: 1.0\r\n";
    $headers .= "Content-Type: text/html; charset=UTF-8\r\n";

    return mail($to, $subject, $message, $headers);
}
?>

