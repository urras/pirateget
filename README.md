PB archive scripts
=
This is an up-to-date fork of Karel Bílek's scripts at http://runn1ng.github.io/
Pirate Bay archival
=
Some time ago, I did an experiment on how small I can make ThePirateBay while keeping the important information. People apparently liked it.

Well, now some months later, I wanted to do two things - first, make it even smaller and correct all the mistakes I did before. Second - I wanted to create another version that will have all the additional information - most importantly, all the comments and text information. For me, pirate bay is not just the torrents, but mainly the additional information - "How fake is the file; what can I expect to find inside?"

So I did both.

Note: since the downloading itself took quite long, the data in the older torrents can be slightly out of date.
How I did it

With this script! Unlike previously, this time I decided to output XML so people parsing it won't get so crazy.

Some people noticed that the XML files are not well-formed and valid. I am sorry for that, but Karel made perl scripts that will fix them both, see https://github.com/fr0stycl34r/pirateget/blob/master/correct.pl. The script needs Perl, Bash and Sed, so you will need GNU/Linux (OS X may be sufficient but I have nowhere to try).

Unfortunately, Pirate Bay admins always started blocking my computers (I guess they thought I am a evil attacker or something), so I had to switch from computer to computer. And because I wanted to make sure I really didn't miss any torrent, the whole thing took about half a year.

Also, ThePirateBay had some downtimes during the download. I tried to "catch" them, but I still lost about 100-300 torrents. I am too lazy to sort them out now. Sorry.

Anyway, you can run this script with:

    perl piratebay.pl

To correct the archive, run the script in Bash on any GNU/Linux distro like follows:

    perl correct.pl poor outf_poor.xml outf_poor.corrected.xml

    perl correct.pl rich outf_rich.xml outf_rich.corrected.xml

It will make another file with corrected ampersands and added DOCTYPE and DTD definitons.

The scripts will probably work on OS X too, and maybe even Cygwin.
Analyzing for fun


Well there you have it. All I have been able to squeeze from the archive for now, but I think more people will have more ideas. The links are on the top.

These scripts were made by Karel Bílek. If you want to contact him, send him an email atkb@karelbilek.com . Also, please send him bitcoins to 1CrwjoKxvdbAnPcGzYjpvZ4no4S71neKXT if you want.
