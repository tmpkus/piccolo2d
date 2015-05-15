Platform-specific build instructions:


# MacOSX 10.6.x, Apple JDK 1.6.x, x86\_64 #

The Piccolo2D build will initially fail on Intel Macs (x86\_64) with MacOSX 10.6.x and Apple JDK 1.6.x due to the platform specific SWT dependency.  The failure can be resolved by editing swt/pom.xml to select the correct profile, downloading the correct version of SWT, and installing swt.jar manually into the local maven repository.

Running the SWT examples requires the `-XstartOnFirstThread` JDK command line option or the java process will hang.

For example, here is a complete walkthrough on MacOSX 10.6.2 with Apple JDK 1.6.0\_15-b03-219.  First, diagnosis information:

```
$ java -version
java version "1.6.0_15"
Java(TM) SE Runtime Environment (build 1.6.0_15-b03-219)
Java HotSpot(TM) 64-Bit Server VM (build 14.1-b02-90, mixed mode)

$ mvn -version
Maven version: 2.0.9
Java version: 1.6.0_15
OS name: "mac os x" version: "10.6.2" arch: "x86_64" Family: "mac"

$  mvn enforcer:display-info
[INFO] [enforcer:display-info]
[INFO] Maven Version: 2.0.9
[INFO] JDK Version: 1.6.0_15 normalized as: 1.6.0-15
[INFO] OS Info: Arch: x86_64 Family: mac Name: mac os x Version: 10.6.2

$ mvn help:active-profiles
[INFO] [help:active-profiles]
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-parent:pom:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-core:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-extras:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-swt:bundle:1.3-SNAPSHOT':
[INFO]   The following profiles are active:
[INFO]     - macosx_carbon (source: pom)
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-examples:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-swt-examples:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-complete:pom:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
```

The build will fail unit tests with the default MacOSX profile (macosx\_carbon) enabled.

```
$ mvn install
[INFO] Scanning for projects...
[INFO] Reactor build order:
[INFO]   Piccolo2D Parent
[INFO]   Piccolo2D Core
[INFO]   Piccolo2D Extras
[INFO]   Piccolo2D SWT
[INFO]   Piccolo2D Examples
[INFO]   Piccolo2D SWT Examples
[INFO]   Piccolo2D
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D Parent
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
...
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D SWT
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] [resources:resources]
[INFO] Using default encoding to copy filtered resources.
[INFO] artifact org.eclipse.swt.carbon:macosx: checking for updates from central
Downloading: http://repo1.maven.org/maven2/org/eclipse/swt/carbon/macosx/3.3.0-v3346/macosx-3.3.0-v3346.pom
Downloading: http://repo1.maven.org/maven2/org/eclipse/swt/carbon/macosx/3.3.0-v3346/macosx-3.3.0-v3346.jar
[INFO] [compiler:compile]
[INFO] Compiling 15 source files to piccolo2d.java/swt/target/classes
[INFO] [resources:testResources]
[INFO] Using default encoding to copy filtered resources.
[INFO] [compiler:testCompile]
[INFO] Compiling 6 source files to piccolo2d.java/swt/target/test-classes
[INFO] [surefire:test]
[INFO] Surefire report directory: piccolo2d.java/swt/target/surefire-reports

-------------------------------------------------------
 T E S T S
-------------------------------------------------------
Running edu.umd.cs.piccolox.swt.PSWTTextTest
Tests run: 14, Failures: 0, Errors: 14, Skipped: 0, Time elapsed: 0.776 sec <<< FAILURE!
Running edu.umd.cs.piccolox.swt.PSWTHandleTest
Tests run: 4, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.022 sec
Running edu.umd.cs.piccolox.swt.PSWTImageTest
Tests run: 4, Failures: 0, Errors: 4, Skipped: 0, Time elapsed: 0.055 sec <<< FAILURE!
Running edu.umd.cs.piccolox.swt.PSWTBoundsHandleTest
Tests run: 5, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.01 sec
Running edu.umd.cs.piccolox.swt.PSWTPathTest
Tests run: 4, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.005 sec
Running edu.umd.cs.piccolox.swt.PSWTCanvasTest
Tests run: 7, Failures: 0, Errors: 7, Skipped: 0, Time elapsed: 0.051 sec <<< FAILURE!

Results :

Tests in error:
 testConstructorRemembersTextValue(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testTextPersistsTrainingAndInternalNewlines(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testDefaultPropertiesAreCorrect(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testDefaultFontIsCorrect(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testPenColorPersists(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testPenPaintPersists(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testTransparencyPersists(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testBackgroundColor(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testPenPaintAndPenColorAreSameThing(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testBackgroundColorAndPaintAreSameThing(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testGreekThresholdPersists(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testShrinkingFontShrinksBounds(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testTranslationsBehaveLogically(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testTranslatingDoesntAffectSize(edu.umd.cs.piccolox.swt.PSWTTextTest)
 testImageShouldDefaultToNull(edu.umd.cs.piccolox.swt.PSWTImageTest)
 testPaintShouldDoNothingWhenImageIsNull(edu.umd.cs.piccolox.swt.PSWTImageTest)
 testImageInConstructorPersists(edu.umd.cs.piccolox.swt.PSWTImageTest)
 testDisposingCanvasDisposesImage(edu.umd.cs.piccolox.swt.PSWTImageTest)
 testPanEventListenerIsInstalledByDefault(edu.umd.cs.piccolox.swt.PSWTCanvasTest)
 testZoomEventListenerIsInstalledByDefault(edu.umd.cs.piccolox.swt.PSWTCanvasTest)
 testAnimatingDefaultsToFalse(edu.umd.cs.piccolox.swt.PSWTCanvasTest)
 testInteractingDefaultsToFalse(edu.umd.cs.piccolox.swt.PSWTCanvasTest)
 testInteractingWorksByCountingCallsToSetInteracting(edu.umd.cs.piccolox.swt.PSWTCanvasTest)
 testCanvasIsDoubleBufferedByDefault(edu.umd.cs.piccolox.swt.PSWTCanvasTest)
 testDoubleBufferingPersists(edu.umd.cs.piccolox.swt.PSWTCanvasTest)

Tests run: 38, Failures: 0, Errors: 25, Skipped: 0

[INFO] ------------------------------------------------------------------------
[ERROR] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] There are test failures.
```

Edit swt/pom.xml, disable the macosx\_carbon profile and enable the macosx\_cocoa\_intel profile.  This must be done manually as maven currently does not appear to support profile activation with a combination of `<os>` and `<jdk>` settings.

Profile macosx\_carbon activated
```
<!--

    disable this profile to build on mac osx, jdk 1.6, x86_64

-->
    <profile>
      <id>macosx_carbon</id>
      <activation>
        <os>
          <name>mac os x</name>
        </os>
      </activation>
      <properties>
        <swt.groupId>org.eclipse.swt.carbon</swt.groupId>
        <swt.artifactId>macosx</swt.artifactId>
      </properties>
    </profile>
<!--

    enable this profile to build on mac osx, jdk 1.6, x86_64
      set MAVEN_OPTS="-Dd64", or unit tests will fail

    <profile>
      <id>macosx_cocoa_intel</id>
      <activation>
        <os>
          <name>mac os x</name>
          <arch>x86_64</arch>
        </os>
      </activation>
      <properties>
        <swt.groupId>org.eclipse.swt.cocoa</swt.groupId>
        <swt.artifactId>macosx</swt.artifactId>
      </properties>
    </profile>
-->
```

Profile macosx\_cocoa\_intel activated:
```
<!--

    disable this profile to build on mac osx, jdk 1.6, x86_64

    <profile>
      <id>macosx_carbon</id>
      <activation>
        <os>
          <name>mac os x</name>
        </os>
      </activation>
      <properties>
        <swt.groupId>org.eclipse.swt.carbon</swt.groupId>
        <swt.artifactId>macosx</swt.artifactId>
      </properties>
    </profile>
-->
<!--

    enable this profile to build on mac osx, jdk 1.6, x86_64
      set MAVEN_OPTS="-Dd64", or unit tests will fail

-->
    <profile>
      <id>macosx_cocoa_intel</id>
      <activation>
        <os>
          <name>mac os x</name>
          <arch>x86_64</arch>
        </os>
      </activation>
      <properties>
        <swt.groupId>org.eclipse.swt.cocoa</swt.groupId>
        <swt.artifactId>macosx</swt.artifactId>
      </properties>
    </profile>
```

Maven must also be configured to run the JDK in 64-bit mode

```
$ export MAVEN_OPTS="-Dd64"
```

At this point, the macosx\_cocoa\_intel profile should be activated

```
$ mvn help:active-profiles
[INFO] [help:active-profiles]
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-parent:pom:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-core:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-extras:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-swt:bundle:1.3-SNAPSHOT':
[INFO]   The following profiles are active:
[INFO]      - macosx_cocoa_intel (source: pom)
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-examples:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-swt-examples:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-complete:pom:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
```

Maven will now report a missing dependency

```
$ mvn install
...
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D SWT
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] [resources:resources]
[INFO] Using default encoding to copy filtered resources.
[INFO] artifact org.eclipse.swt.cocoa:macosx: checking for updates from central
[INFO] ------------------------------------------------------------------------
[ERROR] BUILD ERROR
[INFO] ------------------------------------------------------------------------
[INFO] Failed to resolve artifact.

No versions are present in the repository for the artifact with a range [3.3.0-v3346,)
 org.eclipse.swt.cocoa:macosx:jar:null

from the specified remote repositories:
 central (http://repo1.maven.org/maven2)
```

An appropriate cocoa x86\_64 version of SWT must be downloaded manually from http://www.eclipse.org/swt.  As of this writing, the latest version is
3.5.1 and the actual download link is

http://download.eclipse.org/eclipse/downloads/drops/R-3.5.1-200909170800/download.php?dropFile=swt-3.5.1-cocoa-macosx-x86_64.zip

Extract the file swt.jar from this archive and copy it to the piccolo2d-java working directory.  Then install it to the local maven repository with

```
$ mvn install:install-file -Dfile=./swt.jar \
  -DgroupId=org.eclipse.swt.cocoa \
  -DartifactId=macosx \
  -Dversion=3.5.1 \
  -Dpackaging=jar
[INFO] Scanning for projects...
[INFO] Reactor build order:
[INFO]   Piccolo2D Parent
[INFO]   Piccolo2D Core
[INFO]   Piccolo2D Extras
[INFO]   Piccolo2D SWT
[INFO]   Piccolo2D Examples
[INFO]   Piccolo2D SWT Examples
[INFO]   Piccolo2D
[INFO] Searching repository for plugin with prefix: 'install'.
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D
[INFO]    task-segment: [install:install-file] (aggregator-style)
[INFO] ------------------------------------------------------------------------
[INFO] [install:install-file]
[INFO] Installing swt.jar to
~/.m2/repository/org/eclipse/swt/cocoa/macosx/3.5.1/macosx-3.5.1.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESSFUL
[INFO] ------------------------------------------------------------------------
```

The build now succeeds.

```
$ mvn install
[INFO] Scanning for projects...
[INFO] Reactor build order:
[INFO]   Piccolo2D Parent
[INFO]   Piccolo2D Core
[INFO]   Piccolo2D Extras
[INFO]   Piccolo2D SWT
[INFO]   Piccolo2D Examples
[INFO]   Piccolo2D SWT Examples
[INFO]   Piccolo2D
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D Parent
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
...
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D SWT
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] [resources:resources]
[INFO] Using default encoding to copy filtered resources.
Downloading: http://repo1.maven.org/maven2/org/eclipse/swt/cocoa/macosx/3.5.1/macosx-3.5.1.pom
[INFO] [compiler:compile]
[INFO] Nothing to compile - all classes are up to date
[INFO] [resources:testResources]
[INFO] Using default encoding to copy filtered resources.
[INFO] [compiler:testCompile]
[INFO] Nothing to compile - all classes are up to date
[INFO] [surefire:test]
[INFO] Surefire report directory: swt/target/surefire-reports

-------------------------------------------------------
 T E S T S
-------------------------------------------------------
Running edu.umd.cs.piccolox.swt.PSWTTextTest
...

Results :

Tests run: 38, Failures: 0, Errors: 0, Skipped: 0

[INFO] [bundle:bundle]
[INFO] [install:install]
[INFO] Installing swt/target/piccolo2d-swt-1.3-SNAPSHOT.jar to
~/.m2/repository/org/piccolo2d/piccolo2d-swt/1.3-SNAPSHOT/piccolo2d-swt-1.3-SNAPSHOT.jar
...
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] ------------------------------------------------------------------------
[INFO] Piccolo2D Parent ...................................... SUCCESS
[INFO] Piccolo2D Core ........................................ SUCCESS
[INFO] Piccolo2D Extras ...................................... SUCCESS
[INFO] Piccolo2D SWT ......................................... SUCCESS
[INFO] Piccolo2D Examples .................................... SUCCESS
[INFO] Piccolo2D SWT Examples ................................ SUCCESS
[INFO] Piccolo2D ............................................. SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESSFUL
[INFO] ------------------------------------------------------------------------
```


# MacOSX 10.5.x, Apple JDK 1.5.x, x86\_64 #

The Piccolo2D build works fine on Intel Macs (x86\_64) with MacOSX 10.5.x and Apple JDK 1.5.x.

Running the SWT examples requires the `-XstartOnFirstThread` JDK command line option or the java process will hang.

For example, here is a complete walkthrough on MacOSX 10.5.8 with Apple JDK 1.5.0\_20-b02-315.  First, diagnosis information:

```
$ java -version
java version "1.5.0_20"
Java(TM) 2 Runtime Environment, Standard Edition (build 1.5.0_20-b02-315)
Java HotSpot(TM) Client VM (build 1.5.0_20-141, mixed mode, sharing)

$ mvn -version
Apache Maven 2.2.0 (r788681; 2009-06-26 06:04:01-0700)
Java version: 1.5.0_20
Java home: /System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home
Default locale: en_US, platform encoding: MacRoman
OS name: "mac os x" version: "10.5.8" arch: "i386" Family: "unix"

$ mvn enforcer:display-info
[INFO] [enforcer:display-info {execution: default-cli}]
[INFO] Maven Version: 2.2.0
[INFO] JDK Version: 1.5.0_20 normalized as: 1.5.0-20
[INFO] OS Info: Arch: i386 Family: unix Name: mac os x Version: 10.5.8

$ mvn help:active-profiles
[INFO] [help:active-profiles {execution: default-cli}]
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-parent:pom:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-core:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-extras:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-swt:bundle:1.3-SNAPSHOT':
[INFO]   The following profiles are active:
[INFO]     - macosx_carbon (source: pom)
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-examples:jar:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-swt-examples:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-complete:pom:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
```

and then the actual install:

```
$ mvn install
[INFO] Scanning for projects...
[INFO] Reactor build order:
[INFO]   Piccolo2D Parent
[INFO]   Piccolo2D Core
[INFO]   Piccolo2D Extras
[INFO]   Piccolo2D SWT
[INFO]   Piccolo2D Examples
[INFO]   Piccolo2D SWT Examples
[INFO]   Piccolo2D
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D Parent
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] Installing parent/pom.xml to
~/.m2/repository/org/piccolo2d/piccolo2d-parent/1.3-SNAPSHOT/piccolo2d-parent-1.3-SNAPSHOT.pom
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D Core
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] Installing core/target/piccolo2d-core-1.3-SNAPSHOT.jar to
~/.m2/repository/org/piccolo2d/piccolo2d-core/1.3-SNAPSHOT/piccolo2d-core-1.3-SNAPSHOT.jar
[INFO] Installing org/piccolo2d/piccolo2d-core/1.3-SNAPSHOT/piccolo2d-core-1.3-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D Extras
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] Installing extras/target/piccolo2d-extras-1.3-SNAPSHOT.jar to
~/.m2/repository/org/piccolo2d/piccolo2d-extras/1.3-SNAPSHOT/piccolo2d-extras-1.3-SNAPSHOT.jar
[INFO] Installing org/piccolo2d/piccolo2d-extras/1.3-SNAPSHOT/piccolo2d-extras-1.3-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D SWT
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
Downloading: http://repo1.maven.org/maven2/org/eclipse/swt/carbon/macosx/3.3.0-v3346/macosx-3.3.0-v3346.pom

Downloading: http://repo1.maven.org/maven2/org/eclipse/swt/carbon/macosx/3.3.0-v3346/macosx-3.3.0-v3346.jar
[INFO] Installing swt/target/piccolo2d-swt-1.3-SNAPSHOT.jar to
~/.m2/repository/org/piccolo2d/piccolo2d-swt/1.3-SNAPSHOT/piccolo2d-swt-1.3-SNAPSHOT.jar
[INFO] Installing org/piccolo2d/piccolo2d-swt/1.3-SNAPSHOT/piccolo2d-swt-1.3-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D Examples
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] Installing examples/target/piccolo2d-examples-1.3-SNAPSHOT.jar to
~/.m2/repository/org/piccolo2d/piccolo2d-examples/1.3-SNAPSHOT/piccolo2d-examples-1.3-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D SWT Examples
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] Installing swt-examples/target/piccolo2d-swt-examples-1.3-SNAPSHOT.jar to
~/.m2/repository/org/piccolo2d/piccolo2d-swt-examples/1.3-SNAPSHOT/piccolo2d-swt-examples-1.3-SNAPSHOT.jar
[INFO] Installing org/piccolo2d/piccolo2d-swt-examples/1.3-SNAPSHOT/piccolo2d-swt-examples-1.3-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] Installing pom.xml to
~/.m2/repository/org/piccolo2d/piccolo2d-complete/1.3-SNAPSHOT/piccolo2d-complete-1.3-SNAPSHOT.pom
[INFO]
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] ------------------------------------------------------------------------
[INFO] Piccolo2D Parent ...................................... SUCCESS
[INFO] Piccolo2D Core ........................................ SUCCESS
[INFO] Piccolo2D Extras ...................................... SUCCESS
[INFO] Piccolo2D SWT ......................................... SUCCESS
[INFO] Piccolo2D Examples .................................... SUCCESS
[INFO] Piccolo2D SWT Examples ................................ SUCCESS
[INFO] Piccolo2D ............................................. SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESSFUL
[INFO] ------------------------------------------------------------------------
```

# MacOSX 10.5.x, Apple JDK 1.5.x, ppc #

The Piccolo2D build works fine on PowerPC Macs (ppc) with MacOSX 10.5.x and Apple JDK 1.5.x.

Running the SWT examples requires the `-XstartOnFirstThread` JDK command line option or the java process will hang.

For example, here is a complete walkthrough on MacOSX 10.5.8 with Apple JDK 1.5.0\_20-b02-315.  First, diagnosis information:

```
$ java -version
java version "1.5.0_20"
Java(TM) 2 Runtime Environment, Standard Edition (build 1.5.0_20-b02-315)
Java HotSpot(TM) Client VM (build 1.5.0_20-141, mixed mode, sharing)

$ mvn -version
Apache Maven 2.1.0 (r755702; 2009-03-18 14:10:27-0500)
Java version: 1.5.0_20
Java home: /System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home
Default locale: en_US, platform encoding: MacRoman
OS name: "mac os x" version: "10.5.8" arch: "ppc" Family: "unix"

$ mvn enforcer:display-info
[INFO] [enforcer:display-info]
[INFO] Maven Version: 2.1.0
[INFO] JDK Version: 1.5.0_20 normalized as: 1.5.0-20
[INFO] OS Info: Arch: ppc Family: unix Name: mac os x Version: 10.5.8

$ mvn help:active-profiles
[INFO] [help:active-profiles {execution: default-cli}]
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-parent:pom:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-core:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-extras:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-swt:bundle:1.3-SNAPSHOT':
[INFO]   The following profiles are active:
[INFO]     - macosx_carbon (source: pom)
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-examples:jar:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-swt-examples:bundle:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
[INFO] Active Profiles for Project 'org.piccolo2d:piccolo2d-complete:pom:1.3-SNAPSHOT':
[INFO]   There are no active profiles.
```

and then the actual install:

```
$ mvn install
[INFO] Scanning for projects...
[INFO] Reactor build order:
[INFO]   Piccolo2D Parent
[INFO]   Piccolo2D Core
[INFO]   Piccolo2D Extras
[INFO]   Piccolo2D SWT
[INFO]   Piccolo2D Examples
[INFO]   Piccolo2D SWT Examples
[INFO]   Piccolo2D
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D Parent
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] Installing parent/pom.xml to
~/.m2/repository/org/piccolo2d/piccolo2d-parent/1.3-SNAPSHOT/piccolo2d-parent-1.3-SNAPSHOT.pom
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D Core
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] Installing core/target/piccolo2d-core-1.3-SNAPSHOT.jar to
~/.m2/repository/org/piccolo2d/piccolo2d-core/1.3-SNAPSHOT/piccolo2d-core-1.3-SNAPSHOT.jar
[INFO] Installing org/piccolo2d/piccolo2d-core/1.3-SNAPSHOT/piccolo2d-core-1.3-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D Extras
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] Installing extras/target/piccolo2d-extras-1.3-SNAPSHOT.jar to
~/.m2/repository/org/piccolo2d/piccolo2d-extras/1.3-SNAPSHOT/piccolo2d-extras-1.3-SNAPSHOT.jar
[INFO] Installing org/piccolo2d/piccolo2d-extras/1.3-SNAPSHOT/piccolo2d-extras-1.3-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D SWT
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
Downloading: http://repo1.maven.org/maven2/org/eclipse/swt/carbon/macosx/3.3.0-v3346/macosx-3.3.0-v3346.pom

Downloading: http://repo1.maven.org/maven2/org/eclipse/swt/carbon/macosx/3.3.0-v3346/macosx-3.3.0-v3346.jar
[INFO] Installing swt/target/piccolo2d-swt-1.3-SNAPSHOT.jar to
~/.m2/repository/org/piccolo2d/piccolo2d-swt/1.3-SNAPSHOT/piccolo2d-swt-1.3-SNAPSHOT.jar
[INFO] Installing org/piccolo2d/piccolo2d-swt/1.3-SNAPSHOT/piccolo2d-swt-1.3-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D Examples
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] Installing examples/target/piccolo2d-examples-1.3-SNAPSHOT.jar to
~/.m2/repository/org/piccolo2d/piccolo2d-examples/1.3-SNAPSHOT/piccolo2d-examples-1.3-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D SWT Examples
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] Installing swt-examples/target/piccolo2d-swt-examples-1.3-SNAPSHOT.jar to
~/.m2/repository/org/piccolo2d/piccolo2d-swt-examples/1.3-SNAPSHOT/piccolo2d-swt-examples-1.3-SNAPSHOT.jar
[INFO] Installing org/piccolo2d/piccolo2d-swt-examples/1.3-SNAPSHOT/piccolo2d-swt-examples-1.3-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] Building Piccolo2D
[INFO]    task-segment: [install]
[INFO] ------------------------------------------------------------------------
[INFO] Installing pom.xml to
~/.m2/repository/org/piccolo2d/piccolo2d-complete/1.3-SNAPSHOT/piccolo2d-complete-1.3-SNAPSHOT.pom
[INFO]
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] ------------------------------------------------------------------------
[INFO] Piccolo2D Parent ...................................... SUCCESS
[INFO] Piccolo2D Core ........................................ SUCCESS
[INFO] Piccolo2D Extras ...................................... SUCCESS
[INFO] Piccolo2D SWT ......................................... SUCCESS
[INFO] Piccolo2D Examples .................................... SUCCESS
[INFO] Piccolo2D SWT Examples ................................ SUCCESS
[INFO] Piccolo2D ............................................. SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESSFUL
[INFO] ------------------------------------------------------------------------
```