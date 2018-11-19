{ fetchurl, stdenv, autoreconfHook, pkgconfig, libxcb, xcbutilkeysyms, xcbutilimage,
  pam, libX11, libev, cairo, libxkbcommon, libxkbfile, xcbutilxrm }:

stdenv.mkDerivation rec {
  name = "i3lock-${version}";
  version = "2.11.1";

  src = fetchurl {
    url = "https://i3wm.org/i3lock/${name}.tar.bz2";
    sha256 = "015dn534m7cxjvqdncpvaq9p8b2r4w5hp1yanbdy2abmhbcc7a7j";
  };

  nativeBuildInputs = [ autoreconfHook pkgconfig ];
  buildInputs = [ libxcb xcbutilkeysyms xcbutilimage pam libX11
    libev cairo libxkbcommon libxkbfile xcbutilxrm ];

  makeFlags = "all";
  installFlags = "PREFIX=\${out} SYSCONFDIR=\${out}/etc";
  postInstall = ''
    mkdir -p $out/share/man/man1
    cp *.1 $out/share/man/man1
  '';

  meta = with stdenv.lib; {
    description = "A simple screen locker like slock";
    longDescription = ''
      Simple screen locker. After locking, a colored background (default: white) or
      a configurable image is shown, and a ring-shaped unlock-indicator gives feedback
      for every keystroke. After entering your password, the screen is unlocked again.
    '';
    homepage = https://i3wm.org/i3lock/;
    maintainers = with maintainers; [ garbas malyn domenkozar ];
    license = licenses.bsd3;
    platforms = platforms.all;
  };

}
