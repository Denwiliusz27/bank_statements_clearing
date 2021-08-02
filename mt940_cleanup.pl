use warnings;
use feature 'state';
use File::Copy qw(copy);


sub removeAttach {
        
    $in_file = $_[0];
    $out_file = $_[1];
    $same = 0;
    
    if ($in_file eq $out_file) {
        $same = 1;
        $out_file = changeFileName($out_file);
    }
    
    
    open( DATA1, "< $in_file") or die "\nERROR: cannot open first file - inappropriate name of file, inappropriate or missing extension, or file doesn't exist.\n\n"; # open file to read
    open( DATA2, "> $out_file") or die "\nERROR: cannot open second file - inappropriate name of file.\n\n"; #open file to write;
    
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
                    
                    @tab = (chr(13), chr(10));
                    $new_line = join("", @tab);
                    
                    print DATA2 $new_line;
                    print DATA2 "$in[$i]";
                }
            }
        }
    }
        
    close (DATA1);
    close (DATA2);

    if ($same == 1){
        copy($out_file, $in_file); 
        unlink($out_file);
    }
}


sub changeFileName(){
        
    @filename = split(//, $in_file);
     
    $filename[-4] = '_'; 
    $filename[-3] = 't';
    $filename[-2] = 'e';
    $filename[-1] = 's';
    push @filename, 't';    
        
    $out_file = join('',@filename);
        
    return $out_file;
}


sub main() {
    $subroutine = $ARGV[0];
    
    if (scalar(@ARGV) == 0) {
        print "\nERROR: name of method should be entered.\n\n";
        return;
    }
    
    if ($subroutine ne 'removeAttach') {
        print "\nERROR: inappropriate name of method entered.\n\n";
        return;
    }
    
    if (scalar(@ARGV) < 2) {
        print "\nERROR: minimum one name of existing file should be entered.\n\n";
        return;
    }
    elsif (scalar(@ARGV) == 2){
        &$subroutine($ARGV[1], $ARGV[1]);
        return;
    }elsif (scalar(@ARGV) > 3) {
        print "\nERROR: too much arguments entered.\n\n";
        return;
    }
        
    &$subroutine($ARGV[1], $ARGV[2]);
   
}

main();
