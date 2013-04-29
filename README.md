
<h1>PB archive scripts</h1>
<p>This is an up-to-date fork of Karel Bílek's scripts at <a href="http://runn1ng.github.io/">http://runn1ng.github.io/</a></p>

<h1>Pirate Bay archival</h1>

<p>Some time ago, I did an experiment on how small I can make ThePirateBay while keeping the important information. People apparently liked it.</p>

<p>Well, now some months later, I wanted to do two things - first, make it even smaller and correct all the mistakes I did before. Second - I wanted to create another version that will have all the additional information - most importantly, all the comments and text information. For me, pirate bay is not just the torrents, but mainly the additional information - "How fake is the file; what can I expect to find inside?"</p>

<p>So I did both.</p>

<p>The "smaller" file is for download <a href="http://thepiratebay.se/torrent/8156416">here</a> - it has 76 MB 7zipped and it really has just names and magnet links.</p>

<p>The "bigger" file is for download <a href="http://thepiratebay.se/torrent/8163015">here</a> - in 631 MB 7zipped, it has all the information about number of seeders, leechers (at the time of the download), magnet links, descriptions, size, and perhaps most importantly - <b>comments</b>. It does <i>not</i> contain the "big" torrent files. But apart from that, you can really reconstruct the whole Pirate Bay from it. (I will touch this later though.)</p>

<p>Note: since the downloading itself took quite long, the data in the older torrents can be slightly out of date.</p>

<h1>How I did it</h1>

<p>With this script! Unlike previously, this time I decided to output XML so people parsing it won't get so crazy.</p>

<p>Some people noticed that the XML files are not well-formed and valid. I am sorry for that, but 
Karel made perl scripts that will fix them both, see <a href="https://github.com/fr0stycl34r/pirateget/blob/master/correct.pl">https://github.com/fr0stycl34r/pirateget/blob/master/correct.pl</a>. The script needs Perl, Bash and Sed, so you will need GNU/Linux (OS X may be sufficient but I have nowhere to try).</p>

<p>Unfortunately, Pirate Bay admins always started blocking my computers (I guess they thought I am a evil attacker or something), so I had to switch from computer to computer. And because I wanted to make sure I really didn't miss any torrent, the whole thing took about half a year.</p>

<p>Also, ThePirateBay had some downtimes during the download. I tried to "catch" them, but I still lost about 100-300 torrents. I am too lazy to sort them out now. Sorry.</p>

<p>Anyway, you can run this script with:</p>

<pre><code>   perl  piratebay.pl
</code></pre>

<p>To correct the archive, run the script in Bash on any GNU/Linux distro like follows:</p>

<pre><code>   perl correct.pl poor outf_poor.xml poor.corrected.xml

   perl correct.pl rich outf_rich.xml rich.corrected.xml
</code></pre>

<p>It will make another file with corrected ampersands and added DOCTYPE and DTD definitons.</p>

<p>The scripts will probably work on OS X too, and maybe even Cygwin.</p>

<h3>Analyzing for fun</h3>

<p>Frankly, I can't wait to see what will people do with this stuff. And I like graphs, so I made some :)</p>

<h4>Uploaded torrents</h4>

<p>First, let's look at the most basic thing - how many torrents people upload a day? Is it growing or staying about the same? Let's put the days on X axis and number of torrents on Y axis.</p>

<p><a href="http://imgur.com/555rLCB"><img src="http://i.imgur.com/555rLCBl.png" title="Hosted by imgur.com" alt=""></a></p>

<p>Well, as we can see, the number is growing, even when it's not as smooth as it could be. We can see some drops to zero, I guess it's the days when Pirate Bay was off.</p>

<p>Let's look at the cumulative functions - how much is the number of torrents growing over time?</p>

<p><a href="http://imgur.com/ncPwKgU"><img src="http://i.imgur.com/ncPwKgUl.png" title="Hosted by imgur.com" alt=""></a></p>

<p>It's growing nicely. But despite what Pirate Bay says in its footer, I found only about 2 millions of torrents.</p>

<h4>Number of seeders</h4>

<p>Now, let's look at something else - is it true, that the newest torrents are seeded the most, or not? Let's put all the torrents on X axis, sort them by time, and put the number of seeders on Y axis. Once R finally crunches the numbers, we get this graph.</p>

<p><a href="http://imgur.com/TskOXyu"><img src="http://i.imgur.com/TskOXyul.png" title="Hosted by imgur.com" alt=""></a></p>

<p>We can see that except for some insanely popular torrents in the past, the more recent torrents are indeed the more seeded ones. However, when I tried to look at the seeder numbers closely, I realized one thing.</p>

<p>Slightly more than one third of the torrents have no seeders at all. Nothing. </p>

<p>Actually, more than 3/4 of the torrents have 4 seeders or less. </p>

<p>On the other hands, couple of torrents are insanely popular. </p>

<p>Of course, we can try to visualize this. If you try to graph the popularity on a linear scale and without cutting the very few outliers on the right, you get crazy graph like this. (On X is number of seeders, on Y number of torrents with that number of seeders.)</p>

<p><a href="http://imgur.com/v7lZ6OS"><img src="http://i.imgur.com/v7lZ6OSl.png" title="Hosted by imgur.com" alt=""></a></p>

<p>Yeah, this is not going to work. Let's cut the outliers on the right (say, torrents with &gt;2000 seeders) and let's put the y axis on logarithmic scale.</p>

<p><a href="http://imgur.com/mvZG6TT"><img src="http://i.imgur.com/mvZG6TTl.png" title="Hosted by imgur.com" alt=""></a></p>

<p>Keep in mind that Y axis is on logarithmical scale. This is pretty crazy.</p>

<p>What's to take from this? Torrents on TPB are really, really unevenly seeded. Unfortunately, with no seeders, magnet links are useless. So, for about 1/3 of this archive, the magnet links are not really useful, and for 3/4, they are useful only if you are very lucky. OTOH, the torrents files would make this archive much more giant.</p>

<h4>Words</h4>

<p>Last but not the least, you can do fun stuff with the descriptions and comments themselves. Unluckily, I currently have no time to play with it, so I just looked at the names of the torrents, did some primitive tokenization and looked at the most favourite words in the torrent names. Well, the results speak for themselves :)</p>

<table>
<tr>
<td><b>Order</b></td>
<td><b>Appearances</b></td>
<td><b>Word</b></td>
</tr>
<tr>
<td> 1 </td>
<td> 184015 </td>
<td>XviD</td>
</tr>
<tr>
<td> 2 </td>
<td> 177920</td>
<td> The</td>
</tr>
<tr>
<td>3 </td>
<td> 137824</td>
<td> HDTV</td>
</tr>
<tr>
<td> 4 </td>
<td> 86804 </td>
<td>x264</td>
</tr>
<tr>
<td> 5 </td>
<td> 74855 </td>
<td>DVDRip</td>
</tr>
<tr>
<td> 6 </td>
<td> 65450 </td>
<td>720p</td>
</tr>
<tr>
<td> 7 </td>
<td> 48845 </td>
<td>XXX</td>
</tr>
<tr>
<td> 8 </td>
<td> 39148 </td>
<td>2011</td>
</tr>
<tr>
<td> 9 </td>
<td> 34117 </td>
<td>2012</td>
</tr>
<tr>
<td> 10 </td>
<td> 32547 </td>
<td>2010</td>
</tr>
<tr>
<td> 11 </td>
<td> 31453 </td>
<td>avi</td>
</tr>
<tr>
<td> 12 </td>
<td> 28516 </td>
<td>PDTV</td>
</tr>
<tr>
<td> 13 </td>
<td> 27057 </td>
<td>VA</td>
</tr>
<tr>
<td> 14 </td>
<td> 24888 </td>
<td>2009</td>
</tr>
<tr>
<td> 15 </td>
<td> 24527 </td>
<td>com</td>
</tr>
<tr>
<td> 16 </td>
<td> 22558 </td>
<td>AC3</td>
</tr>
<tr>
<td> 17 </td>
<td> 22072 </td>
<td>A</td>
</tr>
<tr>
<td> 18 </td>
<td> 21019 </td>
<td>2</td>
</tr>
<tr>
<td> 19 </td>
<td> 19167 </td>
<td>WS</td>
</tr>
<tr>
<td> 20 </td>
<td> 18563 </td>
<td>2008</td>
</tr>
<tr>
<td> 21 </td>
<td> 18065 </td>
<td>1</td>
</tr>
<tr>
<td> 22 </td>
<td> 17836 </td>
<td>480p</td>
</tr>
<tr>
<td> 23 </td>
<td> 16610 </td>
<td>SWESUB</td>
</tr>
<tr>
<td> 24 </td>
<td> 16140 </td>
<td>12</td>
</tr>
<tr>
<td> 25 </td>
<td> 16123 </td>
<td>of</td>
</tr>
<tr>
<td> 26 </td>
<td> 14861 </td>
<td>the</td>
</tr>
<tr>
<td> 27 </td>
<td> 14300 </td>
<td>Of</td>
</tr>
<tr>
<td> 28 </td>
<td> 13706 </td>
<td>Big</td>
</tr>
<tr>
<td> 29 </td>
<td> 12662 </td>
<td>and</td>
</tr>
<tr>
<td> 30 </td>
<td> 12592 </td>
<td>BluRay</td>
</tr>
<tr>
<td> 31 </td>
<td> 12563 </td>
<td>DVDRiP</td>
</tr>
<tr>
<td> 32 </td>
<td> 12421 </td>
<td>mSD</td>
</tr>
<tr>
<td> 33 </td>
<td> 12233 </td>
<td>3</td>
</tr>
<tr>
<td> 34 </td>
<td> 12019 </td>
<td>s</td>
</tr>
<tr>
<td> 35 </td>
<td> 11701</td>
<td> XViD</td>
</tr>
<tr>
<td> 36 </td>
<td> 11532 </td>
<td>2007</td>
</tr>
<tr>
<td> 37 </td>
<td> 10978 </td>
<td>I</td>
</tr>
<tr>
<td> 38 </td>
<td> 10898 </td>
<td>2HD</td>
</tr>
<tr>
<td> 39 </td>
<td> 10556 </td>
<td>LOL</td>
</tr>
<tr>
<td> 40 </td>
<td> 10504</td>
<td> 10</td>
</tr>
</table><p>Well there you have it. All I have been able to squeeze from the archive for now, but I think more people will have more ideas. The links are on the top.</p>

<p> These scripts were made by Karel Bílek. If you want to contact him, send him an email atkb@karelbilek.com . Also, please send him bitcoins to 1CrwjoKxvdbAnPcGzYjpvZ4no4S71neKXT if you want.
</p>
 </section>

<footer>
Pirateget is maintained by <a href="https://github.com/fr0stycl34r">fr0stycl34r</a><br>
Tactile theme by <a href="https://twitter.com/jasonlong">Jason Long</a>.
</footer>

        
   </div>
   </div>
  </body>
</html>
