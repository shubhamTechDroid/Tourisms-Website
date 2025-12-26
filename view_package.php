<?php 
if(isset($_GET['id'])){
    $packages = $conn->query("SELECT * FROM `packages` where md5(id) = '{$_GET['id']}'");
    if($packages->num_rows > 0){
        foreach($packages->fetch_assoc() as $k => $v){
            $$k = $v;
        }
    }
$review = $conn->query("SELECT r.*,concat(firstname,' ',lastname) as name FROM `rate_review` r inner join users u on r.user_id = u.id where r.package_id='{$id}' order by unix_timestamp(r.date_created) desc ");
$review_count =$review->num_rows;
$rate = 0;
$feed = array();
while($row= $review->fetch_assoc()){
    $rate += $row['rate'];
    if(!empty($row['review'])){
        $row['review'] = stripslashes(html_entity_decode($row['review']));
        $feed[] = $row;
    }
}
if($rate > 0 && $review_count > 0)
$rate = number_format($rate/$review_count,0,"");
$files = array();
if(is_dir(base_app.'uploads/package_'.$id)){
    $ofile = scandir(base_app.'uploads/package_'.$id);
    foreach($ofile as $img){
        if(in_array($img,array('.','..')))
        continue;
        $files[] = validate_image('uploads/package_'.$id.'/'.$img);
    }
}
}
?>
<section class="page-section">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div id="tourCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
                    <div class="carousel-inner h-100">
                        <?php foreach($files as $k => $img): ?>
                        <div class="carousel-item  h-100 <?php echo $k == 0? 'active': '' ?>">
                            <img class="d-block w-100  h-100" src="<?php echo $img ?>" alt="">
                        </div>
                        <?php endforeach; ?>
                    </div>
                    <a class="carousel-control-prev" href="#tourCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#tourCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="w-100">
                    <hr class="border-warning">
                    <h5>Ratings (<?php echo $review_count ?>)</h5>
                    <div>
                        <div class="stars">
                            <input disabled class="star star-5" id="star-5" type="radio" name="star"
                                <?php echo $rate == 5 ? "checked" : '' ?> /> <label class="star star-5"
                                for="star-5"></label>
                            <input disabled class="star star-4" id="star-4" type="radio" name="star"
                                <?php echo $rate == 4 ? "checked" : '' ?> /> <label class="star star-4"
                                for="star-4"></label>
                            <input disabled class="star star-3" id="star-3" type="radio" name="star"
                                <?php echo $rate == 3 ? "checked" : '' ?> /> <label class="star star-3"
                                for="star-3"></label>
                            <input disabled class="star star-2" id="star-2" type="radio" name="star"
                                <?php echo $rate == 2 ? "checked" : '' ?> /> <label class="star star-2"
                                for="star-2"></label>
                            <input disabled class="star star-1" id="star-1" type="radio" name="star"
                                <?php echo $rate == 1 ? "checked" : '' ?> /> <label class="star star-1"
                                for="star-1"></label>
                        </div>
                    </div>
                    <hr>
                    <div class="w-100 d-flex justify-content-between">
                        <span
                            class="rounded-0 btn-flat btn-sm btn-primary d-flex align-items-center  justify-content-between"><i
                                class="fa fa-tag"></i> <span
                                class="ml-1"><?php echo number_format($cost) ?></span></span>
                        <button class="btn btn-flat btn-warning" type="button" id="book">Book Now</button>
                    </div>
                </div>
            </div>
            <div class=" col-md-7">
                <h3><?php echo $title ?></h3>
                <hr class="border-warning">
                <small class='text-muted'>Location: <p id="location_detail"><?php echo $tour_location ?></p>
                </small>
                <h4 class="my-3">Details</h4>
                <hr>
                <div><?php echo stripslashes(html_entity_decode($description)) ?></div>
                <h4 class="my-3">Weather of <?php echo $tour_location ?></h4>
                <hr>
                <div class="weather-container" id="weather-container"
                    style="display:flex; justify-content:space-between; align-items:center;">
                    <span style="font-weight:bold; text-transform: capitalize;">Minimum Temp <p style="font-weight:400;"
                            id="tempmin">29°C</p>
                    </span>
                    <span style="font-weight:bold; text-transform: capitalize;">Maximum Temp <p style="font-weight:400;"
                            id="tempmax">31°C</p>
                    </span>
                    <span style="font-weight:bold; text-transform: capitalize;">Humidity <p style="font-weight:400;"
                            id="humidity">19 %</p>
                    </span>
                    <span style="font-weight:bold; text-transform: capitalize;">Pressure <p style="font-weight:400;"
                            id="pressure">1005 Pa</p>
                    </span>
                    <span style="font-weight:bold; text-transform: capitalize;">Temp Feels Like <p
                            style="font-weight:400;" id="feelslike">30°C
                        </p></span>
                    <span style="font-weight:bold; text-transform: capitalize;">Description <p style="font-weight:400;"
                            id="description_weather">clear
                            sky</p></span>
                </div>

                <h4 class="my-3">News About <?php echo $tour_location ?></h4>
                <div class="newsContainer" id="newsContainer"
                    style="min-height:10px; max-height:500px; overflow-y:scroll; overflow-x:hidden;">

                </div>

                <hr>
                <h5>Reviews (<?php echo count($feed) ?>)</h5>
                <hr class=" border-primary">
                <?php foreach($feed as $r): ?>
                <div class="w-100 d-flex justify-content-between  align-items-center">
                    <div class="d-flex align-items-center">
                        <img src="<?php echo validate_image('assets/img/user.jpg') ?>"
                            class="border mr-3 review-user-avatar" alt="">
                        <span><?php echo $r['name'] ?></span>
                    </div>
                    <span class='text-muted'><?php echo date("Y-m-d H:i A",strtotime($r['date_created'])) ?></span>
                </div>
                <div class="w-100 review-feedback">
                    <?php echo $r['review'] ?>
                </div>
                <hr class='border-light'>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</section>
<script>
$(function() {
    $('#book').click(function() {
        if ("<?php echo $_settings->userdata('id') ?>" > 0)
            uni_modal("Book Info", "book_form.php?package_id=<?php echo $id ?>");
        else
            uni_modal("", "login.php", "large");
    })
})


const location_detail = document.getElementById("location_detail");
let loc_det = location_detail.innerText;
let textArray = loc_det.split(",").map(item => item.trim());

async function weatherDetailsFetch(city, country) {
    const weatherApiUrl =
        `https://api.openweathermap.org/data/2.5/weather?q=${city},${country}&appid=19281a26448be18411057a10467dd830`;

    try {
        const response = await fetch(weatherApiUrl);
        if (!response.ok) {
            throw new Error(`
    Error fetching joke: $ {
        response.status
    }
    `);
        }
        const weatherData = await response.json();

        console.log(weatherData.main.temp_min);
        console.log(weatherData.main.temp_max);
        console.log(weatherData.main.humidity);
        console.log(weatherData.main.pressure);
        console.log(weatherData.main.feels_like);
        console.log(weatherData.weather[0].description);

        const tempmin = document.getElementById("tempmin");
        const tempmax = document.getElementById("tempmax");
        const humidity = document.getElementById("humidity");
        const pressure = document.getElementById("pressure");
        const feelslike = document.getElementById("feelslike");
        const description_weather = document.getElementById("description_weather");

        tempmin.innerText = `${Math.floor(weatherData.main.temp_min - 273.15)} °C`;
        tempmax.innerText = `${Math.floor(weatherData.main.temp_max - 273.15)} °C`;
        humidity.innerText = `${weatherData.main.humidity} %`;
        pressure.innerText = `${weatherData.main.pressure} Pa`;
        feelslike.innerText = `${Math.floor(feelslike.main.temp_min - 273.15)} °C`;
        description_weather.innerText = `${weatherData.weather[0].description}`;


    } catch (error) {
        console.error('An error occurred:', error);
    }
}


weatherDetailsFetch(textArray[0], textArray[1]);


const newsContainer = document.getElementById("newsContainer");
async function newsDetailsFetch(topic, countryCode) {
    const newsApiUrl =
        `https://real-time-news-data.p.rapidapi.com/search?query=${topic}&country=${countryCode}&lang=en`;
    const options = {
        method: 'GET',
        headers: {
            'X-RapidAPI-Key': '032a08e18cmsh1266bfd02369362p1b804djsn26b5d576c06f',
            'X-RapidAPI-Host': 'real-time-news-data.p.rapidapi.com'
        }
    };

    try {
        const response = await fetch(newsApiUrl, options);
        if (!response.ok) {
            throw new Error(`
    Error fetching joke: $ {
        response.status
    }
    `);
        }

        const newsData = await response.json();
        console.log(newsData);

        for (let i = 0; i < 10; i++) {

            let newslink = newsData.data[i].link;
            let newsTitle = newsData.data[i].title
            const count = 70;
            const count2 = 60;
            let linktext = newslink.slice(0, count) + (newslink.length > count ? "..." : "")
            let linktitle = newsTitle.slice(0, count2) + (newsTitle.length > count ? "..." : "")

            let htmlCode = `
            <div class="newsbox my-2" id="newsbox"
                        style="display:flex; justify-content:space-between; height:90px; width:100%; background-color:#f0f0f056; padding:5px;">

                        <div class="newsboximg" style="display:flex; justify-content:center; align-items:center;">
                        <img id="newsLogo" style="width:160px; height:40px; "
                                src="${(newsData.data[i].source_logo_url != null) ? newsData.data[i].source_logo_url : 'https://raw.githubusercontent.com/Shubham56-droid/Best-Animated-Wallpaper/main/welcome%20page/Screenshot%202024-04-29%20064327.png' }" />
                        </div>
                        <div class="newsboxdetails" style="width:75%;">
                            <p id="newsTitle" style="font-weight:bold;">${linktitle}</p>
                            <a id="newsLink"
                                href="${newsData.data[i].link}">${linktext}
                            </a>
                        </div>
                    </div>
            `;

            newsContainer.insertAdjacentHTML("afterbegin", htmlCode);
        }

    } catch (error) {
        console.error('An error occurred:', error);
    }
}


newsDetailsFetch(textArray[0], 'IN');
</script>