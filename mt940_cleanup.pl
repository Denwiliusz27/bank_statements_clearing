use warnings;
use feature 'state';

sub removeAttach {
        
    $in_file = $_[0];
    $out_file = $_[1];    
    
    if ($in_file eq $out_file) {
        $same = 1;
        $out_file = changeFileName($out_file);
    }
    
    
    open( DATA1, "< $in_file") or die "Cannot open first file"; # open file to read
    open( DATA2, "> $out_file") or die "Cannot open second file"; #open file to write;
    
    @in = <DATA1>;
    $copy = 0;
     
    for $i (0..$#in){
        @line = split(//, $in[$i]);  # split line into characters and put into array
       
        if ($copy) {  # when $copy is true then line is copied to output file
            if ((scalar(@line)) > 3) {
                $start =join('', @line[0..3]);            

                if ($start eq ':OS:') {
                    $copy = 0;            
                } elsif ($start eq ':20:'){
                    print DATA2 "$in[$i-1]";
                    print DATA2 "$in[$i]";
                }else {
                    #print "dodaje linie $i\n";
                    print DATA2 $in[$i];
                }
            }
            else {
                if (not ((ord($line[0]) == 13 or ord($line[0]) == 10))) {
                    print DATA2 $in[$i];  
                }              
            }
        } else {
            if ((scalar(@line)) > 3) {
                $start =join('', @line[0..3]);            

                if ($start eq ':20:') {
                    $copy = 1;
                    print DATA2 "$in[$i-1]";
                    print DATA2 "$in[$i]";
                }
            }
        }
    }
        
    close (DATA1);
    close (DATA2);

    if ($same == 1){
        rewriteFiles($in_file, $out_file);
    }
}

sub changeFileName(){
  
    #print "oba pliki takie same\n";
    #print "$in_file\n";
        
        
    @filename = split(//, $in_file);
        
        
    #print 'nowa nazwa:', @filename;
    #print "\n";
        
    $filename[-3] = 't';
    $filename[-2] = 'x';
    $filename[-1] = 't';
        
    #print 'nowa nazwa:', @filename;
    #print "\n";
        
    #$length = scalar(@filename);
    #print "dlugosc: ", $length;
        
    $out_file = join('',@filename);
    #print 'nowiusienka nazwa: ', $out_file;
        #$out_file = $filename
        
    return $out_file;
}


sub rewriteFiles() {
    $old_file = $_[0];
    $created_file = $_[1];

    open( DATA1, "< $created_file") or die "Cannot open first file"; # open file to read
    open( DATA2, "> $old_file") or die "Cannot open second file"; #open file to write;
    
    @line = <DATA1>;
    
    for $i (0..$#line) {
        print DATA2 @line;
    }
    
    
    
    close (DATA1);
    close (DATA2);
    
    unlink($created_file);
}




sub main() {
    $subroutine = $ARGV[0];
    
    if ($subroutine ne 'removeAttach') {
        print "Appropriate program name should be entered as first argument\n";
        return;
    }
    
    if (scalar(@ARGV) < 2) {
        print "Minimum one name of file should be entered\n";
        return;
    }
    elsif (scalar(@ARGV) == 2){
        #print "podano te sama nazwe pliku\n";
        &$subroutine($ARGV[1], $ARGV[1]);
        return;
    }
    
    
    &$subroutine($ARGV[1], $ARGV[2]);
}

main();
