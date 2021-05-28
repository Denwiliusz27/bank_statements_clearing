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
        
        $iter = $i+1;
        print "$iter\n";
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
                    
                   # print " $asci_s ";
            }    
        }
    }
        
    @hand_l = split(//, $hand[-1]);
    @script_l = split(//, $script[-1]);    
        
    $hand_s = scalar @hand_l;
    $script_s = scalar @script_l;
            
        
    if ($hand_s != $script_s) {
        @hand_l = split(//, $hand[-2]);
        @script_l = split(//, $script[-1]);
        $hand_s = scalar @hand_l;
        $script_s = scalar @script_l;
    }   
    
    print "script: ";
    for $j (0..$script_s-1){
        $asci_s = ord($script_l[$j]);
        print " $asci_s ";
    }
                
    print "\nhandm:: ";
    for $j (0..$hand_s-1){
        $asci_h = ord($hand_l[$j]);
        print " $asci_h ";
    }
    print "\n";
        
        
    close (HAND);
    close (SCRIPT);
        
        
=put        
        if ($hand_s < 10) {
              
            print "$hand_s\n";
            print "script: ";
                
            for $j (0..$script_s-1){
                $asci_s = ord($script_l[$j]);
                print " $asci_s ";
            }
                
            print "\nhandm:: ";
            for $j (0..$hand_s-1){
                $asci_h = ord($hand_l[$j]);
                print " $asci_h ";
            }
                
            print "\n~~~~~~~~~~~~~~~~~\n";
            
        }
        
    }
    
    close (HAND);
    close (SCRIPT);
    
###########
    
    print "\n ~~~~~~~~~~~~~ \n";
    
    open( DATA2, "< $in_file") or die "nie moge otworzyc pliku";  # plik zrobiony recznie
    open( DATA3, "< $in_file") or die "nie moge otworzyc pliku";  # plik otrzymany przez skrypt

    @out = <DATA2>;
    for $i (0..$#out){
        @line = split(//, $out[$i]);
        @linein = split(//, $in[$i]);
        $size = scalar @line;

        print "$size : ";        
        for $j (0..$size-1){
            if ($line[$j] ne $linein[$j]) {
                print "som inne ===";
            }
            
            $asci = ord($line[$j]);
            print " $asci ";
        }
        print "\n";
    }
    
=cut
}

sub main() {
    compareFiles($ARGV[0], $ARGV[1]);
}

main();