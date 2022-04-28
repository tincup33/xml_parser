# xml_parser
Just a simple XML parser in Powershell

I created this script for a project that required specific data be pulled from ~3700 XML files.

I chose to make the script interactive in case the user wanted to search for more than one term at a time without having to launch the script for each search term.  I have the output set to console for debugging purposes but I have also included code to write (append) output to a CSV file.  I have also commented out the prompt that asks the user for a file output location because it made no sense with output set to console.

As written in the description, this script is simple but it works well.

That said...

If the script fails to run, please see below...
- You may have to run the following command before running the script depending on policy "Set-ExecutionPolicy RemoteSigned"
- It is possible that this command may also be needed before the script will be allowed to run "Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass"
- If the user does not have permission to access the XML file location, the script will return an error.
- If the user does not have permission to save files to the output location, the script will return an error.
