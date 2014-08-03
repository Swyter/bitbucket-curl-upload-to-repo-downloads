# README #

A tiny cURL script which shows how to programmatically log-in into Bitbucket and automatically submit files to the download area of any repository you own. Useful for continuous integration and other unattended tasks.

Someone should make an API for this.

### Syntax ###

	upload-to-bitbucket.cmd <user> <password> <repo downloads page> <local file to upload>
### Example ###
	upload-to-bitbucket.cmd swyter secret1 /Swyter/tld-downloads/downloads myfile.zip