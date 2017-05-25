<%
Response.CacheControl = "no-cache" 
Response.AddHeader "cache-control","private"
Response.AddHeader "Pragma", "no-cache" 
Response.Expires = -1 

dim default_url
dim local_url
local_url = Request.ServerVariables("LOCAL_ADDR")

if local_url = "172.29.64.7" then
	default_url = "http://172.29.64.7:73/"
else
	default_url = "http://www.yamahabackstage.com.au/"
end if
%>
<tr>
  <td height="80"><table width="100%" cellpadding="0" cellspacing="0" border="0">
      <tr>
        <td align="left" valign="bottom"><a href="http://au.yamaha.com/" target="_blank"><img src="<%=default_url%>images/yamaha.jpg" border="0" /></a></td>
        <td rowspan="2" align="left" valign="bottom" style="padding-top:20px;"><table border="0" cellpadding="1">
            <tr>
              <td valign="bottom" style="padding-bottom:5px;"><a href="http://www.facebook.com/Yamahabackstagepass/" target="_blank"><img src="<%=default_url%>icons/facebook.gif" name="btn_facebook" border="0" id="btn_facebook" alt="Facebook" /></a></td>
              <td valign="bottom" style="padding-bottom:5px;"><a href="http://www.twitter.com/YamahaBackstage/" target="_blank"><img src="<%=default_url%>icons/twitter.gif" name="btn_twitter" border="0" id="btn_twitter" alt="Twitter" /></a></td>
              <td valign="bottom" style="padding-bottom:5px;"><a href="http://www.youtube.com/yamahaaustralia/" target="_blank"><img src="<%=default_url%>icons/youtube.gif" name="btn_youtube" border="0" id="btn_youtube" alt="YouTube" /></a></td>
              <td valign="bottom" style="padding-bottom:5px;"><a href="http://www.instagram.com/yamahabackstage/" target="_blank"><img src="<%=default_url%>icons/instagram.gif" name="btn_instagram" border="0" id="btn_instagram" alt="Instagram" /></a></td>
              <td valign="bottom" style="padding-bottom:5px;"><a href="http://www.pinterest.com/yamahaaustralia/" target="_blank"><img src="<%=default_url%>icons/pinterest.gif" name="btn_pinterest" border="0" id="btn_pinterest" alt="Pinterest" /></a></td>
              <td><a href="<%=default_url%>"><img src="<%=default_url%>images/logo_backstage.jpg" border="0" /></a></td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td align="left" valign="bottom"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><% if strSection = "home" then %>
                <img src="<%=default_url%>images/btn_home_roll.jpg" border="0" />
                <% else %>
                <a href="<%=default_url%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('home','','<%=default_url%>images/btn_home_roll.jpg',0)"><img src="<%=default_url%>images/btn_home.jpg" alt="home" name="home" border="0" id="home" /></a>
                <% end if %></td>
              <td><% if strSection = "whats-new" then %>
                <a href="<%=default_url%>whats-new/"><img src="<%=default_url%>images/btn_whatsnew_roll.jpg" border="0" /></a>
                <% else %>
                <a href="<%=default_url%>whats-new/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('whatsnew','','<%=default_url%>images/btn_whatsnew_roll.jpg',0)"><img src="<%=default_url%>images/btn_whatsnew.jpg" alt="whatsnew" name="whatsnew" border="0" id="whatsnew" /></a>
                <% end if %></td>
              <td><% if strSection = "events" then %>
                <a href="<%=default_url%>festival/"><img src="<%=default_url%>images/btn_events_roll.jpg" border="0" /></a>
                <% else %>
                <a href="<%=default_url%>festival/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('events','','<%=default_url%>images/btn_events_roll.jpg',0)"><img src="<%=default_url%>images/btn_events.jpg" alt="events" name="events" border="0" id="events" /></a>
                <% end if %></td>
              <td><% if strSection = "artists" then %>
                <a href="<%=default_url%>artists/"><img src="<%=default_url%>images/btn_artists_roll.jpg" border="0" /></a>
                <% else %>
                <a href="<%=default_url%>artists/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('artists','','<%=default_url%>images/btn_artists_roll.jpg',0)"><img src="<%=default_url%>images/btn_artists.jpg" alt="artists" name="artists" border="0" id="artists" /></a>
                <% end if %></td>
              <td><% if strSection = "promotions" then %>
                <a href="<%=default_url%>promotions/"><img src="<%=default_url%>images/btn_promotions_roll.jpg" border="0" /></a>
                <% else %>
                <a href="<%=default_url%>promotions/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('promotions','','<%=default_url%>images/btn_promotions_roll.jpg',0)"><img src="<%=default_url%>images/btn_promotions.jpg" alt="promotions" name="promotions" border="0" id="promotions" /></a>
                <% end if %></td>
              <td><% if strSection = "dealers" then %>
                <img src="<%=default_url%>images/btn_dealers_roll.jpg" border="0" />
                <% else %>
                <a href="<%=default_url%>dealers/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('dealers','','<%=default_url%>images/btn_dealers_roll.jpg',0)"><img src="<%=default_url%>images/btn_dealers.jpg" alt="dealers" name="dealers" border="0" id="dealers" /></a>
                <% end if %></td>
            </tr>
          </table></td>
      </tr>
    </table></td>
</tr>
