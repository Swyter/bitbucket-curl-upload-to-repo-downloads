# README #

A tiny cURL script which shows how to programmatically log-in into Bitbucket and automatically submit files to the download area of any repository you own. Useful for continuous integration and other unattended tasks.

Someone should make an API for this. Please encourage bitbucket/atlassian to add this by voting on the following issue:
<https://bitbucket.org/site/master/issues/3251/add-custom-file-uploads-to-rest-api-bb>

### Syntax ###

	upload-to-bitbucket.cmd <user> <password> <repo downloads page> <local file to upload>
### Example ###
	upload-to-bitbucket.cmd swyter secret1 /Swyter/tld-downloads/downloads myfile.zip