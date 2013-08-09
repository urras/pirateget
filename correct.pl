$richpoor = $ARGV[0];
$from = $ARGV[1];
$to = $ARGV[2];

if ($richpoor ne "rich" && $richpoor ne "poor") {
    die "First argument must be  either 'rich' or 'poor'";
}



#Ok, this script is pretty embarassing and very quick and dirty but well I just want to get it done
system '(
    echo \'<?xml version="1.0" encoding="utf-8"?>'.
                            
                            
#Those are hosted on runn1ng's Github page
'    
<!DOCTYPE archive PUBLIC "piratebay'.$richpoor.'" "http://fr0stycl34r.github.io/pirateget/'.$richpoor.'.dtd">
<archive>\'; 
cat '.$from.'; 
echo "</archive>" ) | 
 perl -pne \'         #I want to escape every & -> &amp;, but not &lt; and &gt; that I escaped before
    while (/&((([^lg]|$)(.|$)(.|$))|((.|$)([^t]|$)(.|$))|((.|$)(.|$)([^;]|$)))/) {
        s/&((([^lg]|$)(.|$)(.|$))|((.|$)([^t]|$)(.|$))|((.|$)(.|$)([^;]|$)))/AAAmp;$1/g
    }; 
    s/AAAmp/&amp/g\' | 
        sed \'s/[[:cntrl:]]//g\' > '.$to;
        #I also want to escape all control chars
