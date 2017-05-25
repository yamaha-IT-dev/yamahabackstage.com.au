<%
Dim strURL, strLocalURL, strDealer, strCatalogue
strLocalURL = Request.ServerVariables("LOCAL_ADDR")

strDealer = "<p><strong>For more information:</strong></p><a class=""btn btn-success"" href=""../dealers/"" role=""button"">Living Music Dealers &raquo;</a>"
strCatalogue = "<br><p align=""center""><a href=""../living-music-catalogue.pdf""  class=""btn btn-success"" role=""button"">Download Full Catalogue in PDF</a></p>"

if strLocalURL = "172.29.64.7" then
	strURL = "http://172.29.64.7:73/"
else
	strURL = "http://www.yamahabackstage.com.au/living/"
end if
%>
<div class="navbar navbar-fixed-top navbar-inverse" role="navigation"> 
  <!--<div class="container" style="padding-top:30px;">-->
  <div class="container" style="padding-top:15px;">
    <div align="center"><img src="<%= strURL %>images/main-banner.jpg" class="img-responsive"></div>
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
    </div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li<% if strSection = "home" then response.write " class=active" %>><a class="navbar-brand" href="<%= strURL %>" title="Home"><i class="fa fa-home"></i></a></li>
        <li class="dropdown<% if strSection = "products" then response.write " active" %>"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="<%= strURL %>drums/acoustic/">Drums</a></li>
            <li><a href="<%= strURL %>guitars/acoustic/">Guitars</a></li>
            <li><a href="<%= strURL %>pianos-keyboards/digital-pianos/">Pianos &amp; Keyboards</a></li>
            <li><a href="<%= strURL %>pro-audio/audio-interfaces/">Professional Audio</a></li>            
            <li><a href="<%= strURL %>recorders/">Recorders</a></li>
          </ul>
        </li>
        <li<% if strSection = "dealers" then response.write " class=active" %>><a href="<%= strURL %>dealers/">Find Your Store</a></li>
        <li<% if strSection = "catalogue" then response.write " class=active" %>><a href="<%= strURL %>catalogue/">Full Catalogue</a></li>
        <li<% if strSection = "redemptions" then response.write " class=active" %>><a href="<%= strURL %>redemption/">Redemptions</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a class="navbar-social" href="http://www.facebook.com/Yamahabackstagepass/" target="_blank"><i class="fa fa-facebook"></i></a></li>
        <li><a class="navbar-social" href="http://www.twitter.com/YamahaBackstage/" target="_blank"><i class="fa fa-twitter"></i></a></li>
        <li><a class="navbar-social" href="http://www.youtube.com/yamahaaustralia/" target="_blank"><i class="fa fa-youtube-play"></i></a></li>
        <li><a class="navbar-social" href="http://www.pinterest.com/yamahaaustralia/" target="_blank"><i class="fa fa-pinterest"></i></a></li>
        <li><a class="navbar-social farright" href="http://www.instagram.com/yamahabackstage/" target="_blank"><i class="fa fa-instagram"></i></a></li>
      </ul>
    </div>
  </div>
</div>