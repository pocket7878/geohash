{set-property title "Geohash - Luscious, Lisp, Location"}
{include resources/header.md}

<div class="contents">
<div class="system-links">

  * [Mailing Lists][3]
  * [Getting it][4]
{remark  * [Documentation][5]}
  * [News][6]
  * [Test results][tr]
  * [Changelog][7]

   [3]: #mailing-lists
   [4]: #downloads
   [5]: documentation/ "documentation link"
   [6]: #news
   [7]: changelog.html
   [tr]: test-report.html
   
</div>
<div class="system-description">

### What it is

To quote the [Wikipedia][wiki-geohash]:

 [wiki-geohash]:  http://en.wikipedia.org/wiki/Geohash
 
> Geohash is a latitude/longitude geocode system invented by
Gustavo Niemeyer when writing the web service at geohash.org,
and put into the public domain. Geohashes offer properties
like arbitrary precision and the possibility of gradually
removing characters from the end of the code to reduce its
size (and gradually lose precision).

Geohash is also the name of a Common-Lisp that implements the
algorithm. For example:

    > (encode-lat/lon-to-string 42.584 -5.59 5)
    "ezs42"
    
    > (decode-string-to-lat/lon "ezs42")
    (42.60498 . -5.6030273)

The code hasn't been optimized but it passes the few tests
I've thrown at it. Suggestions welcome.

{anchor mailing-lists}

### Mailing Lists

  * [geohash-devel][devel-list]: A list for announcements,
    questions, patches, bug reports, and so on; It's for
    everything

{anchor downloads}

### Where is it

A [darcs][] repository is available. The command to get it is:

    darcs get http://common-lisp.net/project/geohash/

Geohash is also [ASDF installable][]. Its CLiki home is right
[where][cliki-home] you'd expect.

There's also a handy [gzipped tar file][tarball].

{anchor news}

### What is happening

 * 29 June 2008 - created the project
 
</div>
</div>

{include resources/footer.md}

