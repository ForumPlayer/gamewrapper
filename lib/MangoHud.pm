package MangoHud;
our $VERSION = '1.00';

my $MANGOLIB = "/usr/\$LIB/mangohud/libMangoHud_shim.so";

sub import { Load }

sub Load {
    use Env qw(@LD_PRELOAD $MANGOHUD);
    if ( join( ":", @LD_PRELOAD ) !~ /$MANGOLIB/ ) {
        push( @LD_PRELOAD, $MANGOLIB );
    }
    $MANGOHUD = 1;
}
