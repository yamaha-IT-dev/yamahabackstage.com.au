<%
dim strSection
strSection = "steinberg"
%>
<!--#include virtual="/include/connection_live.asp" -->
<!--#include virtual="/class/clsSteinbergSupport.asp" -->
<%
sub main
	if Request.ServerVariables("REQUEST_METHOD") = "POST" then
		if Trim(Request("Action")) = "Submit" then			
				'response.write("SUBMITTED")
				
				dim strUsername, strProduct, intType, strNo, strEmail, intPhone, strIssue
				strUsername = Replace(Trim(Request.Form("txtUsername")),"'","''")
				strProduct	= Replace(Trim(Request.Form("txtProduct")),"'","''")
				intType		= Trim(Request.Form("cboType"))
				strNo 		= Trim(Request.Form("txtNo"))
				strEmail	= Trim(Request.Form("txtEmail"))
				intPhone	= Replace(Trim(Request.Form("txtPhone"))," ","")
				strIssue	= Replace(Trim(Request.Form("txtIssue")),"'","''")
				
				call addSteinbergSupport(strUsername, strProduct, intType, strNo, strEmail, intPhone, strIssue)			
		end if	
	end if
end sub

call main
%>
<!doctype html>
<html>
<head>
    <link rel="stylesheet" href="../../include/stylesheet.css">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="../../bootstrap/js/bootstrap.js"></script>
    <script src="../../include/rollover.js"></script>
    <script src="../../include/generic_form_validations.js"></script>
    <script src="https://use.fontawesome.com/400e3bd755.js"></script>
    <script>
    function validateFormOnSubmit(theForm) {
        var reason = "";
        var blnSubmit = true;
        
        reason += validateEmptyField(theForm.txtUsername,"Username");
        reason += validateSpecialCharacters(theForm.txtUsername,"Username");
        
        reason += validateEmptyField(theForm.txtProduct,"Product");
        reason += validateSpecialCharacters(theForm.txtProduct,"Product");
        
        reason += validateEmptyField(theForm.txtNo,"No");
        reason += validateSpecialCharacters(theForm.txtNo,"No");
        
        reason += validateEmail(theForm.txtEmail);
        
        reason += validateNumeric(theForm.txtPhone,"Mobile Phone");	
        
        reason += validateEmptyField(theForm.txtIssue,"Issue");
        reason += validateSpecialCharacters(theForm.txtIssue,"Issue");		
        
        if (reason != "") {
            alert("Some fields need correction:\n" + reason);
            
            blnSubmit = false;
            return false;
        }

        if (blnSubmit == true) {
            theForm.Action.value = 'Submit';  
            
            return true;
        }
    }
    </script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--[if lt IE 9]>
    <script src="../js/html5shiv.js"></script>
    <script src="../js/respond.js"></script>
    <![endif]-->
    <title>Steinberg Support</title>
</head>
<body>
<!-- #include virtual="/include/header-new.asp" -->
<div class="bg-section-heading steinberg"></div>
<div class="container">
  <h1>Steinberg Support</h1>
  <p>If you do not have a MySteinberg Account, please <a href="https://www.steinberg.net/en/mysteinberg.html" target="_blank">create one first</a>.</p>
  <form method="post" role="form" onsubmit="return validateFormOnSubmit(this)">
    <div class="form-group">
      <label for="txtUsername">MySteinberg Username<span style="color:red">*</span>:</label>
      <input type="text" class="form-control" id="txtUsername" name="txtUsername" placeholder="Username" maxlength="50" size="30" required>
    </div>
    <div class="form-group">
      <label for="txtProduct">Steinberg Product<span style="color:red">*</span>:</label>
      <input type="text" class="form-control" id="txtProduct" name="txtProduct" placeholder="Product" maxlength="50" size="30" required>
    </div>
    <div class="form-group">
      <label for="cboType">Type:</label>
      <select name="cboType" id="cboType" class="form-control">
        <option value="1">USB-eLicenser (Steinberg Key) no</option>
        <option value="2">Soft-eLicenser (SeL) no</option>
        <option value="3">Product Serial no</option>
      </select>
    </div>
    <div class="form-group">
      <label for="txtNo">No<span style="color:red">*</span>:</label>
      <input type="text" class="form-control" id="txtNo" name="txtNo" placeholder="No" maxlength="30" size="30" required>
    </div>
    <div class="form-group">
      <label for="txtEmail">Email<span style="color:red">*</span>:</label>
      <input type="email" class="form-control" id="txtEmail" name="txtEmail" placeholder="Email" maxlength="60" size="60" required>
    </div>
    <div class="form-group">
      <label for="txtPhone">Mobile Phone<span style="color:red">*</span>:</label>
      <input type="text" class="form-control" id="txtPhone" name="txtPhone" placeholder="E.g. 0400111000" maxlength="12" size="15" required>
    </div>
    <div class="form-group">
      <label for="txtIssue">Describe the issue<span style="color:red">*</span>:</label>
      <input type="text" class="form-control" id="txtIssue" name="txtIssue" placeholder="Issue" maxlength="500" size="50" required>
    </div>
    <div class="form-group">
      <input type="hidden" name="Action" />
      <input type="hidden" name="UserToken" value="<%= Session("user_token") %>" />
      <input type="submit" name="submit" id="submit" value="Submit" />
    </div>
  </form>
</div>
</body>
</html>