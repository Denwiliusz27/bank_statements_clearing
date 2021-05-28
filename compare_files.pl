use warnings;
use feature 'state';

sub compareFiles {
    $hand_c = $_[0];
    $script_c = $_[1];

    open( HAND, "< $hand_c") or die "nie moge otworzyc pliku";
    open( SCRIPT, "< $script_c") or die "nie moge otworzyc pliku";
    
    @hand = <HAND>;
    @script = <SCRIPT>;

    for $i (0..$#hand){
    
        @hand_l = split(//, $hand[$i]);
        @script_l = split(//, $script[$i]);
        
        $hand_s = scalar @hand_l;
        $script_s = scalar @script_l;
        
        
        if ($hand_s != $script_s) {
            print "zla dlugosc lini -> hand: $hand_s , script: $script_s";
        }
        else {
            for $j (0..$script_s-1){
                    $asci_s = ord($script_l[$j]);
                    $asci_h = ord($hand_l[$j]);

                    if ($asci_h != $asci_h) {
                        print "zle ascii -> asci_h: $asci_h, asci_s: $asci_s ";
                    }
            }    
        }
    }
    
    close (HAND);
    close (SCRIPT);
   
}

sub main() {
    compareFiles($ARGV[0], $ARGV[1]);
}

main();