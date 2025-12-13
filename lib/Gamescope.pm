package Gamescope;

our $VERSION = '1.00';

my %Config = (

    #'game-width'        => 1280,
    #'game-height'       => 720,
    #'max-fps'           => 60,
    #'output-width'      => 0,
    #'output-height'     => 0,
    #'fullscreen'        => 0,
    #'borderless'        => 0,
    #'force-grab-cursor' => 0,
    #'expose-wayland'    => 0,
    #'xwayland-count'    => 1,
    #'steam-integration' => 0,
    'keep-size' => 0
);

#sub import {
#    print "Imported Gamescope!\n"
#}

sub GetConfig { return %Config; }

sub SetConfig {
    my %x = @_;
    foreach my $k ( keys %x ) { $Config{$k} = $x{$k}; }
}

sub GetCommandLine {
    my @cmdLine = ("gamescope");

    if ( defined $Config{'game-width'} ) {
        push( @cmdLine, ( "-w", $Config{'game-width'} ) );
    }
    if ( defined $Config{'game-height'} ) {
        push( @cmdLine, ( "-h", $Config{'game-height'} ) );
    }
    if ( defined $Config{'max-fps'} ) {
        push( @cmdLine, ( "-r", $Config{'max-fps'} ) );
    }

    if ( $Config{'keep-size'} ) {
        push( @cmdLine,
            ( "-W", $Config{'game-width'}, "-H", $Config{'game-height'} ) );
    } else {
        if ( defined $Config{'output-width'} ) {
            push( @cmdLine, ( "-W", $Config{'output-width'} ) );
        }
        if ( defined $Config{'output-height'} ) {
            push( @cmdLine, ( "-H", $Config{'output-height'} ) );
        }
    }

    if ( $Config{'fullscreen'} ) { push( @cmdLine, "--fullscreen" ); }
    if ( $Config{'borderless'} ) { push( @cmdLine, "--borderless" ); }
    if ( $Config{'force-grab-cursor'} ) { push( @cmdLine, "--force-grab-cursor" ); }

    if ( $Config{'expose-wayland'} ) { push( @cmdLine, "--expose-wayland" ); }
    if ( $Config{'xwayland-count'} >= 1 ) {
        push( @cmdLine, ( "--xwayland-count", $Config{'xwayland-count'} ) );
    }

    if ( $Config{'steam-integration'} ) { push( @cmdLine, "-e" ); }


    #if ( scalar @config >= 2 ) {
    return ( @cmdLine, "--" );
    #}
}

