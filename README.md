#Cleaning up after closures in Flash

This example is an overview of various mechanisms to remove listeners to closures in Flash, thus preventing memory leaks.

[Check out the blog post](http://justinjmoses.wordpress.com/2011/08/19/cleaning-up-after-closures-in-flash/).

##Usage
Run the various closure techniques via the application using Flashbuilder's Profiler. Check the usage of the `MyTimer` class (which is what we're testing). It will increase into a hundred instances (for each item) for all tests, and then after running GC manually, will decrease back to 0 instances. 


##Third party dependencies
* [As3-Signals v0.8](https://github.com/robertpenner/as3-signals)

##Setup instructions
* *Flashbuilder*: Run the following maven goal to generate the project files from the pom.
        
	    mvn org.sonatype.flexmojos:flexmojos-maven-plugin:3.9:flashbuilder 

* *IntelliJ*: Use [the import wizard](http://blogs.jetbrains.com/idea/2009/09/flexmojos-inmaia/)

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
	

	

	