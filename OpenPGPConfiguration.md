# Introduction #

This is an edit of the Apache and Sonatype docs referenced below, re-ordered to read as a cookbook rather than a FAQ.


# OpenPGP Configuration #

Install GnuPG version 2.0.12 or later.

  * http://www.apache.org/dev/openpgp.html#key-gen-install-latest-gnupg


**todo:** include USB drive mounting per http://www.cryptnet.net/fdp/crypto/keysigning_party/en/keysigning_party.html?


<br />
Use SHA512 by default, edit `~/.gnupg/gpg.conf`

```
personal-digest-preferences SHA512
cert-digest-algo SHA512
default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed 
```

  * http://www.apache.org/dev/openpgp.html#sha-defaults


<br />
Generate a new key

```
$ gpg2 --gen-key
gpg (GnuPG) 2.0.12; Copyright (C) 2009 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
Your selection? 1
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 4096
Requested keysize is 4096 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 
Key does not expire at all
Is this correct? (y/N) y
```


<br />
Use a valid email address, `CODE SIGNING KEY` for the comment, and a strong passphrase.

```
GnuPG needs to construct a user ID to identify your key.

Real name: John Q. Developer
Email address: johnq@dev.org
Comment: CODE SIGNING KEY
You selected this USER-ID:
    "John Q. Developer (CODE SIGNING KEY) <johnq@dev.org>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
You need a Passphrase to protect your secret key.
```

  * http://www.apache.org/dev/openpgp.html#generate-key
  * http://www.apache.org/dev/release-signing.html#user-id
  * http://www.apache.org/dev/release-signing.html#key-comment
  * http://www.apache.org/dev/release-signing.html#passphrase


<br />
**todo:** generate a revocation certificate


<br />
Upload the new public key to a public keyserver.

Find the keyid

```
$ gpg --list-keys
...
```

and send to the MIT keyserver

```
$ gpg --keyserver hkp://pgp.mit.edu --send-keys ${keyid}
```

  * http://www.apache.org/dev/release-signing.html#keyserver-upload


<br />
Publish the new public key to a reliable, permanent URL.

```
$ gpg --ascii --export ${keyid} --output ${keyid}.asc
```

Copy the ASCII armoured public key file `${keyid}.asc` to say `http://dev.org/~johnq/${keyid}.asc`.  You may also wish to publish the public key and fingerprint embedded in a HTML page, e.g. http://people.apache.org/~rdonkin.


<br />
Publish the new public key to the KEYS file in the Piccolo2D source repository.

```
$ svn co https://.../KEYS
$ (gpg --list-sigs ${name} && gpg --armor --export ${name}) >> KEYS
$ svn commit -m "adding ${name} public key to KEYS" KEYS
```

**todo:** where in the source repository should the KEYS file live?

  * http://www.apache.org/dev/openpgp.html#update-KEYS
  * http://www.apache.org/dev/release-signing.html#keys-policy


<br />
Integrate the new public key into the web of trust.

  * http://www.apache.org/dev/openpgp.html#wot
  * http://www.apache.org/dev/release-signing.html#web-of-trust

It's not very likely that two or more Piccolo2D developers would ever be in the same room at the same time (at JavaOne 2010 perhaps?), so we may have to be clever about how best to achieve this.

<br />

# References #

  * Apache How To OpenPGP http://www.apache.org/dev/openpgp.html
  * Apache Signing Releases http://www.apache.org/dev/release-signing.html
  * Sonatype How to Generate PGP Signatures with Maven http://www.sonatype.com/people/2010/01/how-to-generate-pgp-signatures-with-maven
  * The Keysigning Party HOWTO http://www.cryptnet.net/fdp/crypto/keysigning_party/en/keysigning_party.html