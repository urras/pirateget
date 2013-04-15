PB archive scripts 
=====================
Note: All credit goes to http://runn1ng.github.io/

Some people noticed that the XML files are not well-formed and valid. I am sorry for that, but I made perl scripts that will make them both, see https://github.com/fr0stycl34r/pirateget/blob/master/correct.pl. The script need perl, bash and sed, so you will need GNU/Linux (OS X will maybe be sufficient but I have nowhere to try).
Pirate Bay archival

Some time ago, I did an experiment on how small I can make all pirate bay while keeping the important information. People apparently liked it.

Well, now some months later, I wanted to do two things - first, make it even smaller and correct all the mistakes I did before. Second - I wanted to create another version that will have all the additional information - most importantly, all the comments and text information. For me, pirate bay is not just the torrents, but mainly the additional information - how fake is the file? What can I really expect inside?

So I did both.

Note: since the downloading itself took quite long, the data in the older torrents can be slightly out of date.
How I did it:

With this script. Unlike previously, this time I decided to output XML so people parsing it won't get so crazy.

Unfortunately, Pirate Bay admins always started blocking my computers (I guess they thought I am a evil attacker or something), so I had to switch from computer to computer. And because I wanted to make sure I really didn't miss any torrent, the whole thing took about half a year.

Also, PirateBay had some downtimes during the download. I tried to "catch" them, but I still lost about 100-300 torrents. I am too lazy to sort them out now. Sorry.
So, you can run this script with:
       
       perl  piratebay.pl
To correct the archive, run the script in Bash on any GNU/Linux distro like follows.

       perl correct.pl poor poor3.xml poor.corrected.xml

       perl correct.pl rich rich.xml rich.corrected.xml
It will make another file with corrected ampersands and added DOCTYPE and DTD definitons.

The scripts will probably work on OS X too, and maybe even cygwin.
(I did in fact copy this from  runn1ng.github.com. If I did something wrong, please tell me. I did this readme in a hurry, so it might look a bit messy).
