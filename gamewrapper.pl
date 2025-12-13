#!/usr/bin/env perl
BEGIN {
    use FindBin qw($RealBin);
    use lib "$RealBin/lib";
}

use warnings;
use strict;
use Env qw(GAMESCOPE MANGOHUD ZINK);
my @cmdLine = ('%COMMAND%');

if ( not defined $GAMESCOPE or $GAMESCOPE != 0 ) {
    use Gamescope;
    Gamescope::SetConfig(
        'game-width'    => 1280,
        'game-height' => 960,
        'max-fps'     => 60,
        'keep-size'   => 1
    );
    unshift( @cmdLine, Gamescope::GetCommandLine );
}

if ( not defined $MANGOHUD or $MANGOHUD != 0 ) { use MangoHud; }

if ( not defined or $ZINK != 0 ) { use Zink; }

print join( " ", @cmdLine ) . "\n";
