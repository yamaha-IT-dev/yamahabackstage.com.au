<!--#INCLUDE FILE = "dbase/DB_adovbs.inc" -->
<!--#INCLUDE FILE = "dbase/DB_sqlerror.asp" -->
<!--#INCLUDE FILE = "dbase/DB_database.asp" -->
<!--#INCLUDE FILE = "tools/UTL_utilities.asp" -->
<%
dim conn

Sub OpenDataBase()
	set conn=Server.CreateObject("ADODB.Connection")	
	'conn.Open = "Provider=SQLOLEDB; Data Source=MSSQL.yamahabackstage.com.au; Initial Catalog=yma_yamahabackstage_com_au; User ID=yma1000; Password=vjcx06q4"	
	conn.Open = "Provider=SQLOLEDB; Data Source=MSSQL2008.yamahabackstage.com.au; Initial Catalog=yma_yamahabackstage_com_au; User ID=yma1000; Password=vjcx06q4"	
	'conn.Open = "Driver={SQL Server};Server=mssql2008.yamahabackstage.com.au;Database=yma_yamahabackstage_com_au;Uid=yma1000;Pwd=vjcx06q4;"
End Sub

Sub CloseDataBase()
	conn.close
	set conn = nothing
End Sub

%>