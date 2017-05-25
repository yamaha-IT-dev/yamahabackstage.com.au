<!-- #include virtual="/include/connection_live.asp" -->
<!-- #include virtual="/class/clsToken.asp" -->
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
<title>Line 6 Launch RSVP</title>
<link rel="stylesheet" href="../include/rsvp.css">
<script src="//code.jquery.com/jquery.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../include/rollover.js"></script>
<script src="../include/generic_form_validations.js"></script>
<script src="../include/usableforms.js"></script>
<script>
function validateForm(theForm) {
    var reason = "";
    var blnSubmit = true;

    console.log('validate ran');

    reason += validateEmptyField(theForm.txtFirstName,"First Name");
    reason += validateEmptyField(theForm.txtLastName,"Last Name");
    reason += validateEmail(theForm.txtEmail);
    reason += validateNumeric(theForm.txtMobile,"Mobile");
    if (theForm.cboDietary.value == 1) {
        reason += validateEmptyField(theForm.txtDietaryReq,"Dietary Requirements");
    }
    if (theForm.cboState.value != 'VIC') {
        reason += validateEmptyField(theForm.txtAirport,"Airport");
    }
    if (reason != "") {
        alert("Some fields need correction:\n" + reason);
        blnSubmit = false;

        return false;
    }

    if (blnSubmit == true) {
        theForm.Action.value = 'Register';
        return true;
    }
}
</script>
</head>
<body>
<%
sub addRegistration
    dim strSQL

    dim strSessionDate
    dim strFirstName
    dim strLastName
    dim strPreferredName
    dim strEmail
    dim intMobile
    dim strDietaryReq
    dim strState
    dim strAirport
    dim strFlightReq

    strSessionDate      = "2016-06-15"
    strFirstName        = Replace(Trim(Request("txtFirstName")),"'","''")
    strLastName         = Replace(Trim(Request("txtLastName")),"'","''")
    strPreferredName    = Replace(Trim(Request("txtPreferredName")),"'","''")
    strEmail            = Lcase(Trim(Request("txtEmail")))
    intMobile           = Trim(Request("txtMobile"))
    strDietaryReq       = Replace(Trim(Request("txtDietaryReq")),"'","''")
    strState            = Trim(Request("cboState"))
    strAirport          = Replace(Trim(Request("txtAirport")),"'","''")
    strFlightReq        = Replace(Trim(Request("txtFlightReq")),"'","''")

    Call OpenDataBase()

    strSQL = "INSERT INTO [yma1000].[tbl_rsvp_focus] ([sessionDate],[firstName],[lastName],[preferredName],[email],[mobile],[dietaryReq],[state],[airport],[flightReq]) VALUES ("
    strSQL = strSQL & "'" & strSessionDate & "',"
    strSQL = strSQL & "'" & Server.HTMLEncode(strFirstName) & "',"
    strSQL = strSQL & "'" & Server.HTMLEncode(strLastName) & "',"
    strSQL = strSQL & "'" & Server.HTMLEncode(strPreferredName) & "',"
    strSQL = strSQL & "'" & Server.HTMLEncode(strEmail) & "',"
    strSQL = strSQL & "'" & Server.HTMLEncode(intMobile) & "',"
    strSQL = strSQL & "'" & Server.HTMLEncode(strDietaryReq) & "',"
    strSQL = strSQL & "'" & Server.HTMLEncode(strState) & "',"
    strSQL = strSQL & "'" & Server.HTMLEncode(strAirport) & "',"
    strSQL = strSQL & "'" & Server.HTMLEncode(strFlightReq) & "')"

    'response.Write strSQL

    on error resume next
    conn.Execute strSQL

    'On error Goto 0

    if err <> 0 then
        strMessageText = err.description
    else
        Dim JMail
        Set JMail = CreateObject("JMail.Message")

        JMail.MailServerUserName = "yamahamusicau"
        JMail.MailServerPassword = "str0ppy@16"
        JMail.From      = "Marketing-AUS@music.yamaha.com"
        JMail.FromName  = "Yamaha Music Australia"
        JMail.AddRecipient (strEmail)
        JMail.Subject   = "FOCUS 2016 - RSVP"
        JMail.Body      = "Dear " & Trim(Request("txtFirstName")) & "," & vbCrLf _
                        & "" & vbCrLf _
                        & "Thank you. Your RSVP to FOCUS 2016 has been received." & vbCrLf _
                        & "" & vbCrLf _
                        & "Below is the confirmation of your details, please contact us on (03) 9693 5173 if these details are incorrect." & vbCrLf _
                        & "" & vbCrLf _
                        & "Session Date: " & Trim(strSessionDate) & vbCrLf _
                        & "First Name: " & Trim(Request("txtFirstName")) & vbCrLf _
                        & "Last Name: " & Trim(Request("txtLastName")) & vbCrLf _
                        & "Preferred Name: " & Trim(Request("txtPreferredName")) & vbCrLf _
                        & "Email: " & Trim(Request("txtEmail")) & vbCrLf _
                        & "Mobile: " & Trim(Request("txtMobile")) & vbCrLf _
                        & "Dietary Requirements: " & Trim(Request("txtDietaryReq")) & vbCrLf _
                        & "State: " & Trim(Request("cboState")) & vbCrLf _
                        & "Airport: " & Trim(Request("txtAirport")) & vbCrLf _
                        & "Special Flight Requests: " & Trim(Request("txtFlightReq")) & vbCrLf _
                        & "" & vbCrLf _
                        & "Your travel itinerary will be sent to the above email address and we look forward to seeing you at FOCUS 2016." & vbCrLf _
                        & "" & vbCrLf _
                        & "Regards," & vbCrLf _
                        & "" & vbCrLf _
                        & "The Yamaha Team"
        JMail.Send("smtp.sendgrid.net:25")
        set JMail = nothing

        response.Redirect("../thank-you.html")
    end if

    call CloseDataBase()
end sub

sub main
    if Request.ServerVariables("REQUEST_METHOD") = "POST" then
        if Trim(Request("Action")) = "Register" then
            if Trim(Session("user_token")) = Trim(Request.Form("UserToken")) then
                call addRegistration
            end if
        end if
    else
        call createToken
    end if
end sub

call main
%>
    <div class="container">
        <img src="../images/focus_2016.png" alt="Yamaha Focus 2016">
        <h2>RSVP</h2>
        <hr>
        <form method="post" name="form_rsvp" id="form_rsvp" onsubmit="return validateForm(this)">
            <table cellspacing="0" cellpadding="7" class="form_table" border="0">
                <tr>
                    <td width="30%">Date:</td>
                    <td width="70%">June 15<sup>th</sup> 2016</td>
                </tr>
                <tr>
                    <td>First Name <span class="mandatory">*</span> :</td>
                    <td><input type="text" id="txtFirstName" name="txtFirstName" maxlength="50" size="50" placeholder="As it appears on ID" /></td>
                </tr>
                <tr>
                    <td>Last Name <span class="mandatory">*</span> :</td>
                    <td><input type="text" id="txtLastName" name="txtLastName" maxlength="50" size="50" placeholder="As it appears on ID" /></td>
                </tr>
                <tr>
                    <td>Preferred Name:</td>
                    <td><input type="text" id="txtPreferredName" name="txtPreferredName" maxlength="50" size="50" /></td>
                </tr>
                <tr>
                    <td>Email <span class="mandatory">*</span> :</td>
                    <td><input type="email" id="txtEmail" name="txtEmail" maxlength="50" size="50" /></td>
                </tr>
                <tr>
                    <td>Mobile No <span class="mandatory">*</span> :</td>
                    <td><input type="text" id="txtMobile" name="txtMobile" maxlength="12" size="15" /></td>
                </tr>
                <tr>
                    <td>Any Special Dietary Requirements?</td>
                    <td>
                        <select name="cboDietary" id="cboDietary">
                            <option value="0" rel="none">No</option>
                            <option value="1" rel="diet">Yes</option>
                        </select>
                    </td>
                </tr>
                <tr rel="diet">
                    <td>Please specify <span class="mandatory">*</span> :</td>
                    <td><input type="text" id="txtDietaryReq" name="txtDietaryReq" maxlength="50" size="50" /></td>
                </tr>
                <tr>
                    <td>State :</td>
                    <td>
                        <select name="cboState" id="cboState">
                            <option value="VIC" rel="none">VIC</option>
                            <option value="NSW" rel="state">NSW</option>
                            <option value="ACT" rel="state">ACT</option>
                            <option value="QLD" rel="state">QLD</option>
                            <option value="NT" rel="state">NT</option>
                            <option value="WA" rel="state">WA</option>
                            <option value="SA" rel="state">SA</option>
                            <option value="TAS" rel="state">TAS</option>
                        </select>
                    </td>
                </tr>
                <tr rel="state">
                    <td colspan="2">
                        <p><em>We will fly you in the night before the event and fly you out the night of the event after 7pm.</em></p>
                    </td>
                </tr>
                <tr rel="state">
                    <td>Airport <span class="mandatory">*</span> :</td>
                    <td><input type="text" id="txtAirport" name="txtAirport" maxlength="50" size="50" /></td>
                </tr>
                <tr rel="state">
                    <td>Any Travel Requirements? :</td>
                    <td><textarea id="txtFlightReq" name="txtFlightReq" maxlength="400" rows="8" cols="51" placeholder="Please note any requests must be returned with your RSVP."></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="hidden" name="Action" />
                        <input type="hidden" name="UserToken" value="<%= Session("user_token") %>" />
                        <input type="submit" name="submit" id="submit" value="Submit" />
                    </td>
                </tr>
            </table>
        </form>

    </div>
</body>
</html>