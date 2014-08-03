@echo off

if "%1"=="" goto :bad
if "%2"=="" goto :bad
if "%3"=="" goto :bad
if "%4"=="" goto :bad


:start
	set usr=%1
	set pwd=%2
	set pge=%3
	set fil=%4

	:: GET initial csrf, dropped in the cookie, final 32 chars of the line containing that word
	curl -v -k -c cookies.txt https://bitbucket.org/account/signin/ > nul
	
	for /f "tokens=1 delims=" %%A in ('type cookies.txt ^| find "csrf"') do set csrf=%%A
	set csrf=%csrf:~-32%
	
	:: and login using POST, to get the final session cookies, then redirect it to the right page
	curl -v -k -c cookies.txt -b cookies.txt -d "username=%usr%&password=%pwd%&submit=&next=%pge%&csrfmiddlewaretoken=%csrf%" --referer "https://bitbucket.org/account/signin/" -L https://bitbucket.org/account/signin/ > nul

	for /f "tokens=1 delims=" %%A in ('type cookies.txt ^| find "csrf"') do set csrf=%%A
	set csrf=%csrf:~-32%
	
	:: now that we're logged-in and at the right page, upload whatever you want to your repository...
	curl -v -k -c cookies.txt -b cookies.txt --referer "https://bitbucket.org/%pge%" -L --form csrfmiddlewaretoken=%csrf% --form token= --form file=@"%fil%" https://bitbucket.org/%pge% > nul
	
	goto :end

:bad
	echo  [!] error: missing parameters :(
	echo. 
	echo  syntax: upload-to-bitbucket.cmd ^<user^> ^<password^> ^<repo download page^> ^<local file to upload^>
	echo example: upload-to-bitbucket.cmd swyter secret1 /Swyter/tld-downloads/downloads myfile.zip
	echo. 
	
	pause

:end