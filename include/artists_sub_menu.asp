<table width="100%" cellpadding="0" cellspacing="0" class="yamaha_artists_sub_menu_table">
  <tr>
    <% if strSubMenu = "drum" then %>
    <td class="artists_sub_menu_header_selected_left" align="center"><strong>Drums</strong></td>
    <% else %>
    <td class="artists_sub_menu_header_left" align="center"><a href="<%=default_url%>artists/yamaha-drum/" class="menu">Drums</a></td>
    <% end if %>
    <% if strSubMenu = "guitar" then %>
    <td class="artists_sub_menu_header_selected" align="center"><strong>Guitars</strong></td>
    <% else %>
    <td class="artists_sub_menu_header" align="center"><a href="<%=default_url%>artists/yamaha-guitar/" class="menu">Guitars</a></td>
    <% end if %>
    <% if strSubMenu = "keyboard" then %>
    <td class="artists_sub_menu_header_selected" align="center"><strong>Keyboards</strong></td>
    <% else %>
    <td class="artists_sub_menu_header" align="center"><a href="<%=default_url%>artists/yamaha-keyboards/" class="menu">Keyboards</a></td>
    <% end if %>
    <% if strSubMenu = "piano" then %>
    <td class="artists_sub_menu_header_selected" align="center"><strong>Pianos</strong></td>
    <% else %>
    <td class="artists_sub_menu_header" align="center"><a href="<%=default_url%>artists/yamaha-piano/" class="menu">Pianos</a></td>
    <% end if %>    
    <% if strSubMenu = "bo" then %>
    <td class="artists_sub_menu_header_selected" align="center"><strong>Band & Orchestral</strong></td>
    <% else %>
    <td class="artists_sub_menu_header" align="center"><a href="<%=default_url%>artists/yamaha-band-orchestral/" class="menu">Band & Orchestral</a></td>
    <% end if %>
  </tr>
</table>
