#!/usr/bin/perl
use warnings;
use feature 'state';

=begin

print ("Hello world\n");

@array1 = (1, 2, 'hello');

print ("@array1\n");
print ("$array1[0]\n");
print ("$array1[1]\n");
print ("$array1[2]\n");

@array1 = qw/jacek zje placek/;
print ("@array1\n");
print ("$array1[0]\n");
print ("$array1[1]\n");
print ("$array1[2]\n");

@array1 = qw/Monday
Tuesday
Sunday/;

print ("@array1\n");

@a = (1..12);

print ("@a\n");
print ("size: ", scalar @a, "\n");
print ("max index: ",  $#a, "\n");

push(@a, "ala");
print ("push: @a\n");

unshift(@a, "poczatek");
print ("@a\n");

pop(@a);
print ("@a\n");

shift(@a);
print ("@a\n");

@tablica = qw/pon wt sr czw pt sb ndz/;
@t1 = @tablica[2,3,4];

print ("@t1\n");

@liczby = (1..13);
print ("before: @liczby\n");

splice(@liczby, 5, 3, ("ala", "kuba", "ela"));
print ("after: @liczby\n");

$text = "ala-ma-kota-i-psa";
@text1 = split("-", $text);

print ("@text1\n");

$new_text = join("_", @text1);
print "join: $new_text\n";

@l = (1,5,2,3,6,5,9,0,4);
@l = sort(@l);
print "sort: @l\n";

@ar =(1,2,3,(5,6,7));
print "@ar\n";

@a1 = ("ala", "ela");
@a2 = ("kamil", "jan");

@ar = (@a1, @a2);
print "tablica skladana: @ar\n";

$zmienna = (1,2,3,4,5)[3];
print "zmienna = $zmienna\n";

@tab = (1,2,3,4,5,6,7)[1..3];
print "tablica: @tab\n";

%h = ('ala', 33, 'jan', 25, 'ela', 46);
print "\$h{'ala'} = $h{'ala'}\n";
print "\$h{'ela'} = $h{'ela'}\n";

$h{'ela'} = 11;
print "\$h{'ela'} = $h{'ela'}\n";


@arraj = @h{'ala', 'jan'};
print "@arraj\n";

@keys = keys %h;
print "klucze: @keys\n";

@val = values %h;
print "values: @val\n";

if (exists($h{'ala'})) {
    print "ala is $h{'ala'} years old\n";
}else {
    print 'nie znam ali';
}

$size = @keys;
print "size: $size\n";

$h{'anna'} = 23;
@keys = keys %h;
print "klucze: @keys\n";
print "\$h{'anna'} = $h{'anna'}\n";


delete $h{'anna'};
@keys = keys %h;
print "klucze: @keys\n";

$name = 'jan';
$age = 70;

($age > 60)? print 'stary\n': print 'mlody\n';



####################################################

sub Hello {
    print "no witam\n";
}

Hello();

sub add {
    $suma = 0;

    foreach $item (@_) {
        $suma += $item;
    }
    
    print "suma = $suma\n";
}

add(1,2,3,4,5);

sub list_as_arg {
    @ar = @_;
    @arg1 = $_[1];
    print "lista arg: @ar\n";
    return @arg1;
}

@a = (1,2,3);

@listka = list_as_arg('ala', @a);
print "otrzymalem liste: @listka\n";

sub hashe {
    %lista = @_;
    
    foreach $item (keys %lista) {
        $value = $lista{$item};
        print "key: $item, value: $value\n";
    }
}

hashe('jan', 12, 'ala', 43, 'ela', 36);


$variable = "jestem globalna";

sub fun {
    my $variable = "a ja wewnetrzna";
    print "$variable\n";
}

fun();
print "$variable\n";


sub state_val {
    state $amount = 0;
    
    print "\$amount = $amount\n";
    $amount++;
}

for (1..6){
    state_val();
}


$wartosc = 10;

$ref = \$wartosc;
print "ref = $$ref \n";
print "ref is", ref($ref), "\n";

@wartosc = (1,2,3);
$ref = \@wartosc;
print "ref = @$ref \n";
print "ref is", ref($ref), "\n";

%wartosc = ('ala' => 22, 'jan'=> 41);
$ref = \%wartosc;
print "wartosc = %$ref \n";
print "ref is", ref($ref), "\n";

=cut

############################################

open( DATA1, "<BWMDA1GQ.txt") or die "nie moge otworzyc pliku"; # open file to read
open( DATA2, ">out.txt") or die "nie moge otworzyc pliku"; #open file to write;

@in = <DATA1>;

foreach $item (@in){
    @line = split(//, $item);  # split line into characters and put into array
    
    
    #print "@line + ", scalar(@line), "\n";
    if ((scalar(@line)) > 1) {
        $start =join('', @line[0..3]);
        
        if ($item eq '^:20:\d{7}\n') {
            #while ($start ne ':86:') {
                
            #}
            
            print  "$item";
        } elsif ($start eq ':86:') {
            print  "$item";            
        } elsif ($start eq 'Sume') {
            print  "$item";            
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


