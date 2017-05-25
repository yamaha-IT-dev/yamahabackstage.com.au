<%
Dim strURL, strLocalURL
strLocalURL = Request.ServerVariables("LOCAL_ADDR")

if strLocalURL = "172.29.64.7" or strLocalURL = "172.29.64.26"  then
  strURL = "http://intranet:73/"
else
  strURL = "http://www.yamahabackstage.com.au/"
end if
%>
<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand hidden-sm" href="<%= strURL %>"><img src="<%= strURL %>logos/back-stage-YMA.jpg"></a>
    </div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="dropdown<% if strSection = "news" then response.write " active" %>"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">News <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="<%= strURL %>promotions/">Promotions</a></li>
            <li><a href="<%= strURL %>products/">Products</a></li>
            <li><a href="<%= strURL %>events/">Events</a></li>
          </ul>
        </li>
        <li class="dropdown<% if strSection = "artists" then response.write " active" %>"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Artists <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="<%= strURL %>artists/yamaha-band-orchestral/">Yamaha Band &amp; Orchestral</a></li>
            <li><a href="<%= strURL %>artists/yamaha-drum/">Yamaha Drums</a></li>
            <li><a href="<%= strURL %>artists/yamaha-guitar/">Yamaha Guitar</a></li>
            <li><a href="<%= strURL %>artists/yamaha-keyboards/">Yamaha Keyboard</a></li>
            <li><a href="<%= strURL %>artists/yamaha-piano/">Yamaha Piano</a></li>
            <li><a href="<%= strURL %>artists/paiste/">Paiste</a></li>
            <li><a href="<%= strURL %>artists/steinberg/">Steinberg</a></li>
            <li><a href="<%= strURL %>artists/vox/">Vox</a></li>
            <li><a href="<%= strURL %>artists/line6/">Line 6</a></li>
          </ul>
        </li>
        <li class="dropdown<% if strSection = "dealers" then response.write " active" %>"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dealers <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="http://au.yamaha.com/en/dealers/" target="_blank">Yamaha Dealers</a></li>
            <li><a href="<%= strURL %>dealers/paiste/">Paiste Dealers</a></li>
            <li><a href="<%= strURL %>dealers/steinberg/">Steinberg Dealers</a></li>
            <li><a href="<%= strURL %>dealers/vox/">Vox Dealers</a></li>
            <li><a href="<%= strURL %>dealers/line6/">Line 6 Dealers</a></li>
          </ul>
        </li>
        <li class="dropdown<% if strSection = "keyboard" then response.write " active" %>"> <a href="<%= strURL %>keyboard-festival/" class="dropdown-toggle">Keyboard Festival</a></li>
        <li class="dropdown<% if strSection = "steinberg" then response.write " active" %>"> <a href="<%= strURL %>steinberg/" class="dropdown-toggle">Steinberg Support</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right hidden-xs hidden-sm">
        <li><a class="navbar-social" href="http://www.facebook.com/Yamahabackstagepass/" target="_blank"><i class="fa fa-facebook"></i></a></li>
        <li><a class="navbar-social" href="http://www.twitter.com/YamahaBackstage/" target="_blank"><i class="fa fa-twitter"></i></a></li>
        <li><a class="navbar-social" href="http://www.youtube.com/yamahaaustralia/" target="_blank"><i class="fa fa-youtube-play"></i></a></li>
        <li><a class="navbar-social" href="http://www.pinterest.com/yamahaaustralia/" target="_blank"><i class="fa fa-pinterest"></i></a></li>
        <li><a class="navbar-social farright" href="http://www.instagram.com/yamahabackstage/" target="_blank"><i class="fa fa-instagram"></i></a></li>
      </ul>
    </div>
    <!-- /.nav-collapse -->
  </div>
  <!-- /.container --> 
</div>
<!-- /.navbar -->