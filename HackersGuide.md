# Preamble #

This guidelines are heavily inspired by http://subversion.tigris.org/hacking.html



(If you like this table of contents, say thank you at http://code.google.com/p/support/issues/detail?id=116)

# Participating in the community #

Piccolo2D was originally sponsored and hosted by the [Human-Computer Interaction Lab at the University of Maryland](http://www.cs.umd.edu/hcil/).
2008 it moved to [Google Code](http://code.google.com).

The community exists mainly through mailing lists and a Subversion repository. To participate:

Go to http://piccolo2d.googlecode.com/ and

  * Join the "[piccolo2d-dev](http://groups.google.com/group/piccolo2d-dev)", "[piccolo2d-users](http://groups.google.com/group/piccolo2d-users)", and "[piccolo2d-announce](http://groups.google.com/group/piccolo2d-announce)" groups. The piccolo2d-dev list, piccolo2d-dev@googlegroups.com, is where almost all discussion takes place. All development questions should go there, though you might want to check the list archives first.
  * Get a copy of the latest development sources as described in http://code.google.com/p/piccolo2d/wiki/CheckoutInstructions#Developer_access.
New development always takes place on trunk. Bugfixes, enhancements, and new features are backported from there to the various release branches.

There are many ways to join the project, either by **writing code**, or by **testing** and/or helping to **manage the bug database**. If you'd like to contribute, then look at:

  * The bugs/issues database http://code.google.com/p/piccolo2d/issues/

To submit code, simply send your patches to [mailto:piccolo2d-dev@googlegroups.com](mailto:piccolo2d-dev@googlegroups.com). No, wait, first read the rest of this page, then start sending in patches.

To help manage the issues database, read over the issue summaries, looking and testing for issues that are either invalid, or are duplicates of other issues. Both kinds are very common, the first because bugs often get unknowingly fixed as side effects of other changes in the code, and the second because people sometimes file an issue without noticing that it has already been reported. If you are not sure about an issue, post a question to [mailto:piccolo2d-dev@googlegroups.com](mailto:piccolo2d-dev@googlegroups.com).

Another way to help is to **set up automated builds** and test suite runs of Piccolo2D on some platform, and have the output sent to the [mailto:piccolo2d-dev@googlegroups.com](mailto:piccolo2d-dev@googlegroups.com) mailing list.


# Code to read #

Before you can contribute code, you'll need to familiarize yourself with the existing code base and interfaces.

Check out a copy of Piccolo2D (anonymously, if you don't yet have an account with commit access) — so you can look at the code.

Some good places to start are in the examples directory to see how Piccolo2D is used, and with the core Piccolo2D classes (PCanvas, PNode, PPath) to see how the graphics pipeline works.

# Directory layout #

As Piccolo2D comes in three flavors, there's multiple repository roots:

## Sources ##
  * `piccolo2d.java/trunk/` - Java
  * `piccolo2d.net/trunk/` - .Net
  * `pocketpiccolo2d.net/trunk/` - .Net targeted at mobile devices
## Documentation and supplementary material ##
  * `wiki/` - This wiki
  * `maven2/repository/` - decentral [maven](http://maven.apache.org/) (release) repository
  * `site/piccolo2d.java/release-1.2.1/` - documentation website (if any)
  * `site/piccolo2d.java/release-1.2.1/apidocs/` - javadoc output
  * `site/piccolo2d.net/release-1.2.1/apidocs/` - ndoc output
  * `site/pocketpiccolo2d.net/release-1.2.1/apidocs/` - ndoc output

# Coding style #

## Java ##
All Java Language source code in the repository must be written in conformance to the [Code Conventions for the Java Programming Language](http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html) as published by Sun.


Source code conventions are enforced using the Checkstyle plug-in.  Project-specific Checkstyle configuration files are located in the source tree at e.g.

```
piccolo2d.java/core/src/build/conf/checkstyle.xml
```



The maven site build creates a Checkstyle Results report.


For Eclipse users, there is an Eclipse formatter configuration that closely matches the Checkstyle configuration.  It is located in the source tree at

```
piccolo2d.java/core/src/build/conf/eclipse-formatting-conventions.xml
```

To use this in Eclipse, go to Window -> Preferences -> Java -> Code Style -> Formatter, click Import... and select this configuration file.  Thereafter, format a java source file using Source -> Format.


For emacs/xemacs users, the following mode provided by the Apache Jakarta project works well:

```
(defun apache-jakarta-mode ()
  "The Java mode specialization for Apache Jakarta projects."
  (if (not (assoc "apache-jakarta" c-style-alist))
      ;; Define the Apache Jakarta cc-mode style.
      (c-add-style "apache-jakarta" '("java" (indent-tabs-mode . nil))))

  (c-set-style "apache-jakarta")
  (c-set-offset 'substatement-open 0 nil)
  (setq mode-name "Apache Jakarta"))

;; Activate Jakarta mode.
(if (fboundp 'jde-mode)
    (add-hook 'jde-mode-hook 'apache-jakarta-mode)
  (add-hook 'java-mode-hook 'apache-jakarta-mode))
```


## .Net ##

TODO

# Documentation #

## Document Everything ##

Every function, whether public or internal, must start out with a documentation comment that describes what the function does. The documentation should mention every parameter received by the function, every possible return value, and (if not obvious) the conditions under which the function could return an error.

## Public API Documentation ##
### Java ###

TODO: ?

### .Net ###

TODO: ?

# Writing test cases before code #

We totally agree with http://subversion.tigris.org/hacking.html#write-test-cases-first:

```
From: Karl Fogel <kfogel@collab.net>
Subject: writing test cases
To: dev@subversion.tigris.org
Date: Mon, 5 Mar 2001 15:58:46 -0600

Many of us implementing the filesystem interface have now gotten into
the habit of writing the test cases (see fs-test.c) *before* writing
the actual code.  It's really helping us out a lot -- for one thing,


it forces one to define the task precisely in advance, and also it
speedily reveals the bugs in one's first try (and second, and
third...).

I'd like to recommend this practice to everyone.  If you're
implementing an interface, or adding an entirely new feature, or even
just fixing a bug, a test for it is a good idea.  And if you're going
to write the test anyway, you might as well write it first. :-)

Yoshiki Hayashi's been sending test cases with all his patches lately,
which is what inspired me to write this mail to encourage everyone to
do the same.  Having those test cases makes patches easier to examine,
because they show the patch's purpose very clearly.  It's like having
a second log message, one whose accuracy is verified at run-time.

That said, I don't think we want a rigid policy about this, at least
not yet.  If you encounter a bug somewhere in the code, but you only
have time to write a patch with no test case, that's okay -- having
the patch is still useful; someone else can write the test case.

As Subversion gets more complex, though, the automated test suite gets
more crucial, so let's all get in the habit of using it early.

-K
```


# Writing log messages #

Every commit needs a log message. And every log message must start with a reference to the according issue:
```
Issue 34 ; adding package-level javadoc to extras packages (piccolox.*)
```
The exact writing of the issue reference is not important, as long as it's reconized by GoogleCode and a link to the issue is created. This works at least for `issue#34, issue 34, Issue 34`

The intended audience for a log message is a developer who is already familiar with Piccolo2D, but not necessarily familiar with this particular commit. Usually when someone goes back and reads a change, he no longer has in his head all the context around that change. This is true even if he is the author of the change! All the discussions and mailing list threads and everything else may be forgotten; the only clue to what the change is about comes from the log message and the diff itself. People revisit changes with surprising frequency, too: for example, it might be months after the original commit and now the change is being ported to a maintenance branch.

TODO: refer to http://subversion.tigris.org/hacking.html#log-messages ?


# Crediting #

TODO: copy http://subversion.tigris.org/hacking.html#crediting here or just refer?


# Patch submission guidelines #

TODO: copy http://subversion.tigris.org/hacking.html#patches here or just refer?


# Filing bugs / issues #

TODO: copy http://subversion.tigris.org/hacking.html#filing-issues or just refer or skip it?


# Commit access #

After someone has successfully contributed a few non-trivial patches, some committer, usually whoever has reviewed and applied the most patches from that contributor, proposes them for commit access. This proposal is sent only to the other committers - the ensuing discussion is private, so that everyone can feel comfortable speaking their minds. Assuming there are no objections, the contributor is granted commit access. The decision is made by consensus; there are no formal rules governing the procedure, though generally if someone strongly objects the access is not offered, or is offered on a provisional basis.

The primary criterion for commit access is good judgment.

You do not have to be a technical wizard, or demonstrate deep knowledge of the entire codebase, to become a full committer. You just need to know what you don't know. If your patches adhere to the guidelines in this file, adhere to all the usual unquantifiable rules of coding (code should be readable, robust, maintainable, etc.), and respect the Hippocratic Principle of "first, do no harm", then you will probably get commit access pretty quickly. The size, complexity, and quantity of your patches do not matter as much as the degree of care you show in avoiding bugs and minimizing unnecessary impact on the rest of the code.

To assist developers in discovering new committers, we record patches and other contributions in a special crediting format, which is then can be parsed to produce a browser-friendly contribution list. If you're thinking of proposing someone for commit access and want to look over all their changes, that contribution list might be the most convenient place to do it.


## Requirements prior to checking in ##

All check-ins must be accompanied with an issue # in the commit message and pass all unit tests.

## Evolutionary vs. revolutionary changes ##

http://wiki.eclipse.org/Evolving_Java-based_APIs

Evolutionary changes may be committed directly into the trunk,

Revolutionary changes must be prepared and reviewed in a branch before merging into the trunk.

# Use lightweight branches #

If you're working on a feature or bugfix in stages involving multiple commits, and some of the intermediate stages aren't stable enough to go on trunk, then create a temporary branch in /branches. There's no need to ask — just do it. It's fine to try out experimental ideas in a temporary branch, too. And all the preceding applies to partial as well as full committers.

If you're just using the branch to "checkpoint" your code, and don't feel it's ready for review, please put some sort of notice at the top of the log message, such as:
```
   *** checkpoint commit -- please don't waste your time reviewing it ***
```

And if a later commit on that branch should be reviewed, then please supply, in the log message, the appropriate 'svn diff' command, since the diff would likely involve two non-adjacent commits on that branch, and reviewers shouldn't have to spend time figuring out which ones they are.

When you're done with the branch - when you've either merged it to trunk or given up on it - please remember to remove it.


# The configuration/build system #
http://subversion.tigris.org/hacking.html#configury
## Java ##
Currently [ant](http://ant.apache.org/) builds Piccolo2D, but within the next weeks we'll switch over to [maven](http://maven.apache.org/).

  * TODO maven snapshot and release repositories?
  * TODO where goes the maven site (snapshot / release)?
  * TODO can we set up a continuous build somewhere? (hudson, continuum or cruisecontrol?)

## .Net ##

TODO

## Pocket ##

TODO

# Release numbering, compatibility, and deprecation #

  * TODO who prepares a release?
  * TODO who publishes a release?





[![](http://piccolo2d.googlecode.com/svn/site/images/Piccolo2D-Logo-small.png)](http://piccolo2d.org)