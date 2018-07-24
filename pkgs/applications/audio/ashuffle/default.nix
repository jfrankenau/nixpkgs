{ stdenv, fetchFromGitHub, pkgconfig, mpd_clientlib }:

stdenv.mkDerivation rec {
  name = "ashuffle-${version}";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner  = "joshkunz";
    repo   = "ashuffle";
    rev    = "v${version}";
    sha256 = "1inzgb5dlf1bk9y17acgdhz5j7i8dhvv2kwyns73jav1rap6rqmv";
  };

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [ mpd_clientlib ];

  makeFlags = [ "prefix=$(out)" ];

  installPhase = ''
    mkdir -p $out/bin
    cp ashuffle $out/bin/
  '';

  meta = with stdenv.lib; {
    description = "Automatic library-wide shuffle for mpd";
    homepage = https://github.com/joshkunz/ashuffle;
    license = licenses.mit;
    maintainers = with maintainers; [ jfrankenau ];
    platforms = platforms.all;
  };
}
