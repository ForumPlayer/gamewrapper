package Zink;
our $VERSION = '1.00';

use Env qw(
  __GLX_VENDOR_LIBRARY_NAME
  MESA_LOADER_DRIVER_OVERRIDE
  GALLIUM_DRIVER
  LIBGL_KOPPER_DRI2
);

sub import { Load }
sub unimport { Unload }

sub Load {
    $__GLX_VENDOR_LIBRARY_NAME   = "mesa";
    $MESA_LOADER_DRIVER_OVERRIDE = "zink";
    $GALLIUM_DRIVER              = "zink";
    $LIBGL_KOPPER_DRI2           = "1";
}

sub Unload {
    undef $__GLX_VENDOR_LIBRARY_NAME;
    undef $MESA_LOADER_DRIVER_OVERRIDE;
    undef $GALLIUM_DRIVER;
    undef $LIBGL_KOPPER_DRI2;
}
