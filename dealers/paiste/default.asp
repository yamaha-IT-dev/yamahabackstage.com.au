<%
Option Explicit

dim strSection
strSection = "dealers"

dim strLocation
strLocation = "paiste"
%>
<!-- #include virtual="/include/connection_live.asp" -->
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <title>Paiste Dealers</title>
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="../../bootstrap/js/bootstrap.js"></script>
    <script src="../../js/analytics.js"></script>
    <script src="https://use.fontawesome.com/400e3bd755.js"></script>
</head>
<body>
<%
sub displayDealer
	dim iRecordCount
	iRecordCount = 0
    dim strSearchTxt
    dim strSQL
	
	dim intRecordCount
	
	strSearchTxt = Request("txtSearch")

    call OpenDataBase()
	
	session("strState")  = trim(Request("cboState"))
		
	set rs = Server.CreateObject("ADODB.recordset")
	
	rs.CursorLocation = 3	'adUseClient
    rs.CursorType = 3		'adOpenStatic
	rs.PageSize = 500
	
	strSQL = "SELECT * FROM tbl_dealer "
	strSQL = strSQL & " 	WHERE (dealer_name LIKE '%" & request("txtSearch") & "%' "
	strSQL = strSQL & "			OR address LIKE '%" & request("txtSearch") & "%' "
	strSQL = strSQL & "			OR city LIKE '%" & request("txtSearch") & "%' "
	strSQL = strSQL & "			OR postcode LIKE '%" & request("txtSearch") & "%' "	
	strSQL = strSQL & "			OR website LIKE '%" & request("txtSearch") & "%') "
	strSQL = strSQL & "			AND state LIKE '%" & request("cboState") & "%' "
	strSQL = strSQL & "			AND paiste = '1' "
	strSQL = strSQL & "	ORDER BY state, dealer_name"
	
	rs.Open strSQL, conn	
	
	intRecordCount = rs.recordcount
    strDisplayList = ""
	
	if not DB_RecSetIsEmpty(rs) Then
	
		For intRecord = 1 To rs.PageSize 
			strDisplayList = strDisplayList & "<tr>"
			strDisplayList = strDisplayList & "<td><strong><a href=""" & trim(rs("website")) & """>" & rs("dealer_name") & "</a></strong></td>"
			strDisplayList = strDisplayList & "<td>" & rs("address") & "</td>"
			strDisplayList = strDisplayList & "<td>" & rs("city") & "</td>"
			strDisplayList = strDisplayList & "<td>" & rs("state") & "</td>"
			strDisplayList = strDisplayList & "<td>" & rs("postcode") & "</td>"					
			strDisplayList = strDisplayList & "<td>" & rs("phone") & "</td>"		
			strDisplayList = strDisplayList & "</tr>"
			
			rs.movenext
			iRecordCount = iRecordCount + 1	
			If rs.EOF Then Exit For 
		next

	else
        strDisplayList = "<tr><td colspan=""6"" align=""center"">No dealers found</td></tr>"
	end if
	
	strDisplayList = strDisplayList & "<tr>"
	strDisplayList = strDisplayList & "		<td colspan=""6"" align=center>"
    strDisplayList = strDisplayList & "			<input type=""hidden"" name=""txtSearch"" value=" & strSearchTxt & ">"
	strDisplayList = strDisplayList & "			<h2>Total: " & intRecordCount & " dealers</h2>"
    strDisplayList = strDisplayList & "		</td>"
    strDisplayList = strDisplayList & "</tr>"
	
    call CloseDataBase()
end sub

sub main    
    call displayDealer
end sub

call main

dim rs, intPageCount, intpage, intRecord, strDisplayList
%>

<!-- #include virtual="/include/header-new.asp" -->
<div class="bg-section-heading paiste"></div>
<div class="container">
  <h1 align="center">Paiste Dealers</h1>
  <hr>  
  <div class="table-responsive">
    <table class="table table-striped">
      <thead>
        <tr>
          <td width="30%" nowrap="nowrap">Dealer Name</td>
          <td width="25%">Address</td>
          <td width="10%" nowrap="nowrap">City</td>
          <td width="10%">State</td>
          <td width="10%">Postcode</td>
          <td width="15%" nowrap="nowrap">Phone</td>
        </tr>
      </thead>
      <tbody>
        <%= strDisplayList %>
      </tbody>
    </table>
  </div>
</div>
<!-- #include virtual="/include/footer-new.asp" -->

</body>
</html>