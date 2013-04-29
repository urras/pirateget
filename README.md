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

    perl  piratebay.pl

To correct the archive, run the script in Bash on any GNU/Linux distro like follows:

    perl correct.pl poor outf_poor.xml poor.corrected.xml

    perl correct.pl rich outf_rich.xml rich.corrected.xml

It will make another file with corrected ampersands and added DOCTYPE and DTD definitons.

The scripts will probably work on OS X too, and maybe even Cygwin.
Analyzing for fun

Frankly, I can't wait to see what will people do with this stuff. And I like graphs, so I made some :)
Uploaded torrents

First, let's look at the most basic thing - how many torrents people upload a day? Is it growing or staying about the same? Let's put the days on X axis and number of torrents on Y axis.

Well, as we can see, the number is growing, even when it's not as smooth as it could be. We can see some drops to zero, I guess it's the days when Pirate Bay was off.

Let's look at the cumulative functions - how much is the number of torrents growing over time?

It's growing nicely. But despite what Pirate Bay says in its footer, I found only about 2 millions of torrents.
Number of seeders

Now, let's look at something else - is it true, that the newest torrents are seeded the most, or not? Let's put all the torrents on X axis, sort them by time, and put the number of seeders on Y axis. Once R finally crunches the numbers, we get this graph.

We can see that except for some insanely popular torrents in the past, the more recent torrents are indeed the more seeded ones. However, when I tried to look at the seeder numbers closely, I realized one thing.

Slightly more than one third of the torrents have no seeders at all. Nothing.

Actually, more than 3/4 of the torrents have 4 seeders or less.

On the other hands, couple of torrents are insanely popular.

Of course, we can try to visualize this. If you try to graph the popularity on a linear scale and without cutting the very few outliers on the right, you get crazy graph like this. (On X is number of seeders, on Y number of torrents with that number of seeders.)

Yeah, this is not going to work. Let's cut the outliers on the right (say, torrents with >2000 seeders) and let's put the y axis on logarithmic scale.

Keep in mind that Y axis is on logarithmical scale. This is pretty crazy.

What's to take from this? Torrents on TPB are really, really unevenly seeded. Unfortunately, with no seeders, magnet links are useless. So, for about 1/3 of this archive, the magnet links are not really useful, and for 3/4, they are useful only if you are very lucky. OTOH, the torrents files would make this archive much more giant.

Well there you have it. All I have been able to squeeze from the archive for now, but I think more people will have more ideas. The links are on the top.

These scripts were made by Karel Bílek. If you want to contact him, send him an email atkb@karelbilek.com . Also, please send him bitcoins to 1CrwjoKxvdbAnPcGzYjpvZ4no4S71neKXT if you want.

Pirateget is maintained by fr0stycl34r
Tactile theme by Jason Long. 
