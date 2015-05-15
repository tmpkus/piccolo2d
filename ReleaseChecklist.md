# Checklist #
### Verify Issues ###
  1. Verify that no Open issues exist with current release milestone:
    * [Milestone:3.1,Open issues](http://code.google.com/p/piccolo2d/issues/list?can=2&q=milestone=1.3.2&colspec=ID%20Type%20Status%20Priority%20Milestone%20Owner%20Toolkit%20Component%20Summary)
  1. Verify that no Fixed issues exist with the current release milestone
    * (All closed issues should be in Duplicate, WontFix, or Verified status
    * [Milestone:3.1,status=Fixed](http://code.google.com/p/piccolo2d/issues/list?can=1&q=Milestone:1.3.2%20status=Fixed&sort=status&colspec=ID%20Type%20Status%20Priority%20Milestone%20Owner%20Toolkit%20Component%20Summary)
### Verify build ###
  * For each of {beta, rc1, rc2, ...} release candidates:
    1. Verify that working directory builds and all tests pass on all platforms:
```
$ mvn install
```
    1. Verify that the examples run with the specified jdk version on all platforms
```
$ cd examples
$ mvn assembly:assembly
$ java -jar target/piccolo2d-examples-3.1-rc1-jar-with-dependencies.jar
```
    1. Verify that the SWT examples run with the specified jdk version on all platforms
```
$ cd ../swt-examples
$ mvn assembly:assembly
$ java -jar target/piccolo2d-swt-examples-3.1-rc1-jar-with-dependencies.jar
```
    1. Verify that `clirr` report shows no ERRORs where binary compatibility is required
      * For example, for minor release version 3.1, core must be binary compatible with the latest minor release version, 3.0.
```
$ clirr.sh --old-version piccolo2d-core-3.0.jar --new-version piccolo2d-core-3.1-rc1.jar --style text
```
    1. Verify that all source files have the Piccolo2D license header
    1. Class file format of all jar files matches the minimum required JDK version, currently 1.6
      * _Note: I did this by unzipping the built jars and using `javap`; there may be a better way to do this verification, or perhaps we should author a script._
    1. Update release notes and readme as necessary


### Maven Release Plugin ###

```
$ mvn -DautoVersionSubmodules=true release:prepare
```

```
$ mvn release:perform
```


### Update the website, wiki, and announce the release ###

  * http://code.google.com/p/piccolo2d/wiki/WebSiteHowTo
  * http://code.google.com/p/piccolo2d/issues/detail?id=42

# References #

  * Apache Commons [Preparations for a Release](http://commons.apache.org/releases/prepare.html)
  * Apache Commons [Cutting the Release](http://commons.apache.org/releases/release.html)
  * Apache Commons commons-parent [pom.xml](http://svn.apache.org/viewvc/commons/proper/commons-parent/trunk/pom.xml?view=annotate)
  * Maven [Release Plugin](http://maven.apache.org/plugins/maven-release-plugin/)