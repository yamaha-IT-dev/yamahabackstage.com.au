<%
function addSteinbergSupport(strUsername, strProduct, intType, strNo, strEmail, intPhone, strIssue)
	dim strSQL
	
	call OpenDataBase()
	
	strSQL = "INSERT INTO tbl_steinberg_support (steUsername, steProduct, steType, steNo, steEmail, stePhone, steIssue) VALUES ("
	strSQL = strSQL & "'" & Server.HTMLEncode(Trim(strUsername)) & "',"
	strSQL = strSQL & "'" & Server.HTMLEncode(Trim(strProduct)) & "',"
	strSQL = strSQL & "'" & Server.HTMLEncode(Trim(intType)) & "',"
	strSQL = strSQL & "'" & Server.HTMLEncode(Trim(strNo)) & "',"	
	strSQL = strSQL & "'" & Server.HTMLEncode(Trim(strEmail)) & "',"
	strSQL = strSQL & "'" & Server.HTMLEncode(Trim(intPhone)) & "',"
	strSQL = strSQL & "'" & Server.HTMLEncode(Trim(strIssue)) & "')"
	
	'response.Write strSQL
	
	on error resume next
	conn.Execute strSQL
	
	if err <> 0 then
		strMessageText = err.description
	else
		dim JMail
	
		Set JMail = CreateObject("JMail.Message")
		
		JMail.Subject	= "New Support Request"
		JMail.From		= "au_webmaster@gmx.yamaha.com"
		JMail.FromName	= "Steinberg Support"
		'JMail.AddRecipient  ("harsono.setiono@music.yamaha.com")
		'JMail.AddRecipient  ("alexander.yabsley@music.yamaha.com")
		JMail.AddRecipient  ("jarrod.bayliss@music.yamaha.com")
		JMail.Body    	= "G'day!" & vbCrLf _
						& "" & vbCrLf _
						& "There is a new Steinberg Support request." & vbCrLf _
						& "" & vbCrLf _	
						& "Username: " & strUsername & vbCrLf _
						& "Product: " & strProduct & vbCrLf _
						& "Type: " & intType & vbCrLf _
						& "No: " & strNo & vbCrLf _
						& "Email: " & strEmail & vbCrLf _
						& "Phone: " & intPhone & vbCrLf _
						& "Issue: " & strIssue & vbCrLf _					
						& "" & vbCrLf _	
						& "*Type 1 = USB eLicenser" & vbCrLf _
						& "*Type 2 = Soft eLicenser" & vbCrLf _
						& "*Type 3 = Product Serial no" & vbCrLf _
						& "" & vbCrLf _
						& "(This is an automated email)"															
		JMail.Send("localhost")
		
		set JMail = nothing
	
		response.Redirect("thank-you.asp")
	end if
	
	call CloseDataBase()
end function
%>