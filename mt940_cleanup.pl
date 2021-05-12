use warnings;
use feature 'state';

sub removeAttach {
        
    $in_file = $_[0];
    $out_file = $_[1];
    
    open( DATA1, "< $in_file") or die "nie moge otworzyc pliku"; # open file to read
    open( DATA2, "> $out_file") or die "nie moge otworzyc pliku"; #open file to write;
    
    @in = <DATA1>;
    $copy = 0;
    
    for $i (0..$#in){
        @line = split(//, $in[$i]);  # split line into characters and put into array
        
        if ($copy) {  # when $copy is true then line is copied to output file
            if ((scalar(@line)) > 3) {
                $start =join('', @line[0..3]);            

                if ($start eq ':86:') {
                    print  "$in[$i]";            
                } elsif ($start eq 'Sume') {
                    print  "$in[$i]";            
                }
            }
        } else {
            
            if ((scalar(@line)) > 3) {
                $start =join('', @line[0..3]);            

                if ($start eq ':20:') {
                    $copy = 1;
                    print  "\n$in[$i]";
                }
            }
        }
        
        
        
        
        
    }
    
    close (DATA1);
    close (DATA2);
}


sub main() {
    $subroutine = $ARGV[0];
    
    &$subroutine($ARGV[1], $ARGV[2]);
}

main();
