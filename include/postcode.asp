<script>		
function validatePostcode(theForm) {
	var reason = "";
	var blnSubmit = true;
	
	reason += validateEmptyField(theForm.txtPostcode,"Postcode");
	reason += validateSpecialCharacters(theForm.txtPostcode,"Postcode");		
	
  	if (reason != "") {
    	alert("Some fields need correction:\n" + reason);
    	
		blnSubmit = false;
		return false;
  	}

	if (blnSubmit == true){
        theForm.action.value = 'add';
		//alert("SUBMIT!");
		return true;
    }
}
</script>
<%
function setPostcodeSession
	session("enteredPostcode") = Trim(Request("txtPostcode"))
end function

function getLink(intPostcode, strProductCode)
	dim strSQL		
		
	Call OpenDataBase()
	
	strSQL = "SELECT linkURL, linkDealer FROM tbl_link WHERE linkProduct = '" & strProductCode & "' AND linkPostcodeStart <= '" & intPostcode & "' AND linkPostcodeEnd >= '" & intPostcode & "' "
	
	'response.Write strSQL	
	
	set rs = Server.CreateObject("ADODB.recordset")			
	
	rs.Open strSQL, conn
	
	'On error Goto 0
	if rs.EOF then
    	strLinkText = "<p><a href='http://www.yamahabackstage.com.au/living/dealers/' class=""btn btn-success btn-lg"" style=""color:white"">All Stores</a></p>"
    else
		strLinkText = "<h4>Your local dealer is " & rs("linkDealer") & "</h4><p><a href='" & rs("linkURL") & "' class=""btn btn-success btn-lg"" target=""_blank"" style=""color:white"">Shop Here &raquo;</a></p>"
	end if	
	
	call CloseDataBase()		
end function

sub main
	if Request("action") = "change" then
		session("enteredPostcode") = ""
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
	else	
		if Request.ServerVariables("REQUEST_METHOD") = "POST" then
			if Trim(Request("action")) = "add" then
				call setPostcodeSession			
			end if
		end if
	end if
	
end sub

call main
dim strLinkText
%>
<% if len(session("enteredPostcode")) < 1 then %>

<div style="padding-top:5px; padding-bottom:5px;">
  <div class="form-inline" align="right">
    <form method="post" name="form-postcode" id="form-postcode" onsubmit="return validatePostcode(this)">
      <div class="form-group"> <i class="fa fa-info-circle"></i> Enter your postcode to shop online:
        <input type="text" class="form-control" id= "txtPostcode" name="txtPostcode" style="width:85px;" placeholder="Postcode" maxlength="4" size="5" pattern=".{4,}" title="4 digit minimum" required>
      </div>
      <div class="form-group">
        <input type="hidden" name="action" />
        <input type="submit" class="btn btn-primary" name="submit" id="submit" value="Submit" />
      </div>
    </form>
  </div>
</div>
<% else %>
<div style="padding-top:5px; padding-bottom:1px;">
  <h2 align="right">Your postcode: <strong><%=  session("enteredPostcode")%></strong> <small><a href="?action=change">Change</a></small></h2>
</div>
<% end if %>
