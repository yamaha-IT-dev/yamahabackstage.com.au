<%
dim strSection
strSection = "artists"

dim strLocation
strLocation = "paiste"
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--[if lt IE 9]>
    <script src="../../js/html5shiv.js"></script>
    <script src="../../js/respond.js"></script>
    <![endif]-->
    <title>Line 6 Artists</title>
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="../../bootstrap/js/bootstrap.js"></script>
    <script src="../../include/rollover.js"></script>
    <script src="../../js/analytics.js"></script>
    <script src="https://use.fontawesome.com/400e3bd755.js"></script>
</head>
<body>
<!-- #include virtual="/include/header-new.asp" -->
<div class="bg-section-heading Line6"></div>
<div class="container">
  <h1 align="center">Line 6 Artists</h1>

  <div class="float-left-artist" align="center">
    <a href="michael-gumley.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('danny-allen','','../images/michael-gumley-front.jpg',0)"><img src="../images/michael-gumley-front.jpg" alt="Michael Gumley" name="Michael Gumley" border="0"></a>
    <h3>Michael Gumley</h3>
    <strong>Hybrid Nightmares</strong>
  </div>

  <div class="float-left-artist" align="center">
    <a href="plini.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('phil-collings','','../images/plini-front.jpg',0)"><img src="../images/plini-front.jpg" alt="Plini" name="Plini" border="0"></a>
    <h3>Plini</h3>
    <strong>Independent</strong>
  </div>

</div>
<!-- #include virtual="/include/footer-new.asp" -->
</body>
</html>