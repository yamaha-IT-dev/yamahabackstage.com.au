<%
dim strSection
strSection = "home"
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.js"></script>
    <![endif]-->
    <title>Yamaha Backstage</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="bootstrap/css/carousel.css">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="js/analytics.js"></script>
    <script src="https://use.fontawesome.com/400e3bd755.js"></script>
</head>
<body>
    <!-- #include virtual="/include/header-new.asp" -->
    <div class="bg-section-heading-allbrands"></div>
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
                <li data-target="#myCarousel" data-slide-to="5"></li>
                <li data-target="#myCarousel" data-slide-to="6"></li>                
            </ol>
            <!-- Slides -->
            <div class="carousel-inner"> 
				<!--
				<div class="item active">
                    <a href="competition/">
                        <img src="competition/images/YMH0033_PaisteCompBanners_1140x500.jpg" alt="Sydney Drum Show Competition">
                    </a>
                </div> 			
				-->
				<div class="item">
                    <a href="events/hands-on-helix-tour/">
                        <img src="events/images/helix-workshop.jpg" alt="CVP Clavinova Cashback">
                    </a>
                </div> 
				<div class="item">
                    <a href="http://greatstart.yamahabackstage.com.au/">
                        <img src="greatstart/banners/mainbanner_greatstart.jpg" alt="Off to a Great Start">
                    </a>
                </div> 				
				<!--
				<div class="item">
                    <a href="products/namm_2017/">
                        <img src="products/images/mainbanner_namm_2017.jpg" alt="NAMM - 2017">
                    </a>
                </div>  				
				-->
                <div class="item">
                    <a href="products/paiste-go-bigger/">
                        <img src="products/images/mainbanner_paiste_go_bigger.jpg" alt="Paiste - Go Bigger - 17&Prime; 2002 Sound Edge Hats - 24&Prime; Swish Ride - 26&Prime; Giant Beat">
                    </a>
                </div>
                <div class="item">
                    <a href="products/yamaha-fg/">
                        <img src="products/images/mainbanner_yamaha_fg.jpg" alt="Yamaha - FG Series - It all starts here">
                    </a>
                </div>
                <div class="item">
                    <a href="products/paiste-big-beat/">
                        <img src="products/images/mainbanner_paiste_big_beat.jpg" alt="Paiste - 2002 Black Big Beat - Big Sound From Legendary DNA">
                    </a>
                </div>
                <div class="item">
                    <a href="products/recordingcustom/">
                        <img src="products/images/mainbanner_recordingcustom.jpg" alt="Yamaha Recording Custom - The story continues">
                    </a>
                </div>                                                
            </div>
        </div>
    </div>
    <!-- #include virtual="/include/footer-new.asp" -->
</body>
</html>