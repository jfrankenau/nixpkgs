{ stdenv, fetchurl, unzip }:

stdenv.mkDerivation rec {
  name = "roomeqwizard-${version}";
  version = "5.18";

  src = fetchurl {
    url = "https://www.roomeqwizard.com/installers/REW_linux_${builtins.replaceStrings ["."] ["_"] version}.sh";
    sha256 = "05j1ksr5lhscnrzs1brrps9yy54k06a5yixl1693lsngd5jjhq8h";
  };

  dontBuild = true;

  unpackCmd = ''
    # MojoSetups have a ZIP file at the end. ZIP’s magic string is
    # most often PK\x03\x04. This has worked for all past updates,
    # but feel free to come up with something more reasonable.
    dataZipOffset=$(grep --max-count=1 --byte-offset --only-matching --text ''$'PK\x03\x04' $curSrc | cut -d: -f1)
    dd bs=$dataZipOffset skip=1 if=$curSrc of=data.zip 2>/dev/null
    unzip -q data.zip "data/*"
    rm data.zip
  '';

  nativeBuildInputs = [ unzip ];

  installPhase = ''
  '';

}
