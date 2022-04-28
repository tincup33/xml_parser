#############################
# Simple XML parsing script #
# 4/19/22                   #
# Written by tincup33       #
#############################


#Variable declaration
	$fileloc = " <> Location of XML file(s) (use * for multiple XML files) "
	$searchterm = " <> Enter your search term (ex. email) "
	$outputloc = " <> Where would you like to save the the search results file? (ex. C:\results\results.csv) "
	$searchagain = " <> Would you like to enter another search term? (Y/N) "
	$addsearchterm = " <> Please enter another search term "

#Start script with a clear screen command
	cls

#Explanation of script being run
	Write-Host " *** XML PARSING SCRIPT *** " -ForegroundColor Green

#Pause before asking for user data
	sleep 1

#Prompt user for location of XML files
	$filepath = Read-Host -Prompt $fileloc

#Prompt user for search term
	$term = Read-Host -Prompt $searchterm

#Prompt user for output file location
	#$results = Read-Host -Prompt $outputloc

#Search XML document(s) for the search term entered by the user

	Select-Xml -Path $filepath -XPath //*/$term | ForEach-Object { $_.Node.InnerXML } | Write-Output
	#Select-Xml -Path $filepath -XPath //*/$term | ForEach-Object { $_.Node.InnerXML } | Out-File $results -Append

#Asking user if they would like to enter another search term
	Write-Host -nonewline $searchagain
	$answer = Read-Host

#Process answer given by user, if user answer != y then the script exits
	while ( $answer -eq "Y" ) {
		$term = Read-Host -Prompt $addsearchterm
		Select-Xml -Path $filepath -XPath //*/$term | ForEach-Object { $_.Node.InnerXML } | Write-Output
		#Select-Xml -Path $filepath -XPath //*/$term | ForEach-Object { $_.Node.InnerXML } | Out-File $results -Append
		Write-Host -nonewline $searchagain
		$answer = Read-Host
	}

#Exit script with clear screen command
	cls

#Script exit message
	Write-Host " *** EXITING *** " -ForegroundColor Green

#Pause before returning to command prompt
	sleep 1
