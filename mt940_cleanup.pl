use warnings;
use feature 'state';

sub removeAttach {
        
    $in_file = $_[0];
    $out_file = $_[1];
    
    open( DATA1, "< $in_file") or die "nie moge otworzyc pliku"; # open file to read
    open( DATA2, "> $out_file") or die "nie moge otworzyc pliku"; #open file to write;
    
    @in = <DATA1>;
    
    for $i (0..$#in){
        @line = split(//, $in[$i]);  # split line into characters and put into array
        
        
        #print "@line + ", scalar(@line), "\n";
        if ((scalar(@line)) > 1) {
            
            @line = map {defined $_ ? $_ : 'NULL'} @line;
            $start =join('', @line[0..3]);
            
            if ($start eq ':20:') {
                #while ($start ne ':86:') {
                    
                #}
                
                print  "$in[$i]";
            } elsif ($start eq ':86:') {
                print  "$in[$i]";            
            } elsif ($start eq 'Sume') {
                print  "$in[$i]";            
            }
            
            
            #print "@line[0..3]\n";
            #print "=========\n";
        }
    
        
        #if ($item[0..3] eq ':20:') {
        #    print "$item";   
        #}
    }
    
    close (DATA1);
    close (DATA2);

}


sub main() {
    $subroutine = $ARGV[0];
    
    &$subroutine($ARGV[1], $ARGV[2]);
}

main();