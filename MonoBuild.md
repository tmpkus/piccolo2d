See http://code.google.com/p/piccolo2d/issues/detail?id=60

### Setup Mono on Gentoo Linux ###

  * [gentoo linux](http://www.gentoo.org/)
  * dev-util/git 1.5.6.4
  * dev-util/monodevelop 1.0
  * dev-dotnet/nant 0.85
  * dev-lang/mono 1.9.1
  * dev-util/mono-tools 1.2.1
  * dev-util/monodoc 1.9

Building monodevelop 1.0 required (on a stable amd64) the following `/etc/portage/package.keywords`:
```
# Mono Develop
dev-util/monodevelop ~amd64
dev-util/monodoc ~amd64
dev-dotnet/mono-addins ~amd64
dev-lang/mono ~amd64
dev-dotnet/libgdiplus ~amd64
dev-dotnet/gtksourceview-sharp ~amd64
dev-dotnet/gtk-sharp ~amd64
```

The installation:
```
$ emerge nant monodevelop
```


### Setup Mono for VMware ###

Download the Mono development VMware image from:

http://www.go-mono.com/mono-downloads


Follow the VMware image installation/configuration instructions at:

http://mono-project.com/VMware_Image


Specifically, update to the latest Mono release:

  1. Open a command line and login as root (you shouldn't need to type a password):
```
$ sudo -s
```
  1. List the updates available in the mono repo:
```
$ zypper -r lu -r mono
```
  1. Install the updates from the mono repo:
```
$ zypper -r up -r mono
```


Verify Mono is installed

```
linux@linux:~> mono --version
Mono JIT compiler version 1.9.1 (tarball)
Copyright (C) 2002-2007 Novell, Inc and Contributors. www.mono-project.com
        TLS:           __thread
        GC:            Included Boehm (with typed GC)
        SIGSEGV:       normal
        Notifications: epoll
        Architecture:  x86
        Disabled:      none

linux@linux:~> nant -v
NAnt 0.86 (Build 0.86.2898.0; beta1; 12/8/2007)
Copyright (C) 2001-2007 Gerry Shaw
http://nant.sourceforge.net
```

### Setup Mono on Windows ###

Download and install Cygwin

http://www.cygwin.com/


Download the Mono for Windows, Gtk#, and XSP installer from

http://www.go-mono.com/mono-downloads


Mono on Windows is currently missing mono-tools, per the installer release notes:

```
1.2.x:
 -Library version updates: 
   glib -> 2.12.3
   gtk -> 2.10.3
   gnome -> 2.16
   libglade -> 2.6
   glade -> 3
 -Removed mono-tools since it depends on gtkhtml-sharp2, which has 
  not been shipped on win32 yet
```


Verify Mono is installed

```
$ mono --version
Mono JIT compiler version 1.9.1 (tarball)
Copyright (C) 2002-2007 Novell, Inc and Contributors. www.mono-project.com
        TLS:           normal
        GC:            Included Boehm (with typed GC)
        SIGSEGV:       normal
        Notification:  Thread + polling
        Architecture:  x86
        Disabled:      none

$ nant -v
NAnt 0.86 (Build 0.86.2898.0; beta1; 12/08/2007)
Copyright (C) 2001-2007 Gerry Shaw
http://nant.sourceforge.net
```

### Setup Mono on Mac OSX ###

Download the Mono, Cocoa#, Gtk#, MonoDevelop installer from

http://www.go-mono.com/mono-downloads


Verify Mono is installed

```
$ mono --version
Mono JIT compiler version 1.9.1 (tarball)
Copyright (C) 2002-2007 Novell, Inc and Contributors. www.mono-project.com
	TLS:           normal
	GC:            Included Boehm (with typed GC)
	SIGSEGV:       normal
	Notification:  Thread + polling
	Architecture:  ppc
	Disabled:      none

$ nant -version
NAnt 0.86 (Build 0.86.2898.0; beta1; 12/8/2007)
Copyright (C) 2001-2007 Gerry Shaw
http://nant.sourceforge.net
```