A short and sweet hacking guide to Piccolo2D.  See also [HackersGuide](HackersGuide.md).

<br />
### Notes for committers ###


<br />
Try to commit work against some open issue.  We're all guilty of not following this sometimes, especially for e.g. checkstyle-related fixes.


<br />
When you create a new Issue, leave it as New and without an owner for a little while to allow for comment before assigning it to yourself, moving it to Accepted, assigning a Milestone, etc.


<br />
Include the Issue # in your svn commit message, e.g.
```
$ svn commit -m "Issue 123 ; fixed blah blah..."
```


<br />
Include the Revision # (either "[revision 123](https://code.google.com/p/piccolo2d/source/detail?r=123)" or "[r123](https://code.google.com/p/piccolo2d/source/detail?r=123)") as a comment in the Issue when you commit a fix against an issue.  This allows a reviewer to quickly find the diff and start the code review process if necessary.  A cut n' paste of the svn commit command gives you the "Committed [revision 123](https://code.google.com/p/piccolo2d/source/detail?r=123)" note at the bottom.

(or use "Fixes [Issue 123](https://code.google.com/p/piccolo2d/issues/detail?id=123)." in your svn commit message and this will automatically mark the issue as Fixed, check the [Google Code docs](http://code.google.com/p/support/wiki/IssueTracker#Integration_with_version_control) for details)


<br />
Fixed issues should be moved to Verified by either the original submitter or a developer other than the committer of the fix.


<br />
There is a checkstyle configuration and a matching Eclipse formatter configuration (though not all of us use Eclipse).  Try not to create too many new checkstyle errors, and try to commit formatting-only changes separate from coding changes.


<br />
Binary incompatible changes must bump major version numbers (e.g. 1.x --> 2.x).


<br />
Revolutionary changes should happen on a branch first.


<br />
Project owners/committers don't vote on things very often, it's more proceed until veto.