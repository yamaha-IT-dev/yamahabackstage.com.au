<table width="100%" cellpadding="0" cellspacing="0">
  <tr>  	
    <td class="whatsnew_sub_menu">
	<% if strLocation = "yamaha" then %>
    	<img src="<%=default_url%>images/menu_yamaha.jpg" border="0" />
    <% else %>
    	<a href="<%=default_url%>events/yamaha/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('yamaha','','<%=default_url%>images/menu_yamaha.jpg',0)"><img src="<%=default_url%>images/menu_yamaha_des.jpg" name="yamaha" border="0" id="yamaha" /></a>
    <% end if %>
    </td>
    <td class="whatsnew_sub_menu">
    <% if strLocation = "steinberg" then %>
    	<img src="<%=default_url%>images/menu_steinberg.jpg" border="0" />
    <% else %>
    	<a href="<%=default_url%>events/steinberg/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('steinberg','','<%=default_url%>images/menu_steinberg.jpg',0)"><img src="<%=default_url%>images/menu_steinberg_des.jpg" name="steinberg" border="0" id="steinberg" /></a>
    <% end if %>    
        </td>
    <td class="whatsnew_sub_menu">
    <% if strLocation = "vox" then %>
    	<img src="<%=default_url%>images/menu_vox.jpg" border="0" />
    <% else %>
    	<a href="<%=default_url%>events/vox/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('vox','','<%=default_url%>images/menu_vox.jpg',0)"><img src="<%=default_url%>images/menu_vox_des.jpg" name="vox" border="0" id="vox" /></a>
    <% end if %>    
        </td>
    <td>
    <% if strLocation = "paiste" then %>
    	<img src="<%=default_url%>images/menu_paiste.jpg" border="0" />
    <% else %>
    	<a href="<%=default_url%>events/paiste/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('paiste','','<%=default_url%>images/menu_paiste.jpg',0)"><img src="<%=default_url%>images/menu_paiste_des.jpg" name="paiste" border="0" id="paiste" /></a>
    <% end if %>    
        </td>
  </tr>
</table>
