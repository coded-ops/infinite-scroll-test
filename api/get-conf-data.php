<?php
// suppress warnings leave all other error reporting enabled
// error_reporting(E_ALL ^ E_WARNING);
try {
    $conn = new mysqli('localhost', 'root', '', 'infinite_scroll_test');

    if ($conn->connect_errno) {
        error_log('Database connection error: ' . $conn->connect_errno);

        exit(json_encode([
            'errorCode'    => 'db-conn-error',
            'errorMessage' => 'There was an error connecting to the database',
        ]));
    }
} catch (Exception $e) {

    error_log('Database connection exception: ' . $e->getMessage());

    exit(json_encode([
        'errorCode'    => 'db-conn-error',
        'errorMessage' => 'There was an error connecting to the database',
    ]));
}

if (!isset($_POST['getData']) || $_POST['getData'] != 1) {
    exit(json_encode([
        'errorCode'    => 'not-get-data',
        'errorMessage' => 'getData not found in POST or not set as 1',
    ]));
}

$start = isset($_POST['start']) ? (is_numeric($_POST['start']) ? $_POST['start'] : 0) : 11;
$end   = isset($_POST['end']) ? (is_numeric($_POST['end']) ? $_POST['end'] : 0) : 13;

$start = $conn->real_escape_string($start);
$end   = $conn->real_escape_string($end);

$query  = "SELECT * FROM conferences LIMIT $start, $end";
$result = $conn->query($query);

if ($result->num_rows > 0) {

    $response = "";

    while ($row = $result->fetch_assoc()) {

        $response .= "
            <div class='info-card'>
                <div class='info-card__image-data'>
                    <div class='info-card__bg-image'></div>
                    <div class='info-card__pub-detail'>
                        <a href='#' class='info-card__author'><i class='fa fa-user'></i>" . $row['conf_speaker'] . "</a>
                        <span class='info-card__date'><i class='fa fa-calendar'></i>" . $row['conf_date'] . "</span>
                    </div>
                </div>

                <div class='info-card__post-data'>
                    <div class='info-card__title'>" . $row['conf_title'] . "</div>
                    <div class='info-card__subtitle'>" . $row['conf_subtitle'] . "</div>
                    <div class='info-card__post-blurb'>" . $row['conf_desc'] . "</div>
                    <div class='info-card__more-wrapper'>
                        <a href='#' class='info-card__more-link'>Read more</a>
                    </div>
                </div>
            </div>
        ";

    }

    echo json_encode([
        'errorCode'    => null,
        'errorMessage' => null,
        'status'       => 'success',
        'res'          => $response,
    ]);

} else {

    echo json_encode([
        'errorCode'    => null,
        'errorMessage' => null,
        'status'       => 'max-reached',
        'res'          => null,
    ]);

}
