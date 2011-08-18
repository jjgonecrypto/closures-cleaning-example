#Cleaning up after closures in Flash

This example is an overview of various mechanisms to remove listeners to closures in Flash, thus preventing memory leaks.

[Check out the blog post](...).


##Third party dependencies
* [As3-Signals v0.8](https://github.com/robertpenner/as3-signals)

##Usage instructions
In Flashbuilder or IntelliJ, create a new project from the cloned source, and add the 3 SWC dependencies.

##Build instructions
To build on your machine via Maven. Follow these steps:

1. Ensure Maven 3.0.3 + is installed

2. Install local dependencies (add them to your local repository)
	
		cd libs
		
		mvn install:install-file 
			-Dfile=as3-signals-0.8.swc 
			-DgroupId=org.osflash
			-DartifactId=as3-signals 
			-Dversion=0.8 
			-Dpackaging=swc

3. Build

		mvn clean install
	

	

	