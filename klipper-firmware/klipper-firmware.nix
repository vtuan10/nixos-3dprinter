{ stdenv
, klipper
, gcc-arm-embedded
, lib
, pkgsCross
, python2
, configFile ? null
}: stdenv.mkDerivation rec {
  name = "klipper-firmware";
  version = klipper.version;
  src = klipper.src;

  buildInputs = [ python2 pkgsCross.avr.stdenv.cc ];

  postPatch = ''
    sed -i 's/return version/return "${version}"/g' ./scripts/buildcommands.py
  '';

  preBuild = lib.optionalString (configFile != null) "cp ${configFile} ./.config";

  installPhase = ''
    mkdir -p $out
    cp ./.config $out/config
    cp -r out/* $out
  '';
  dontFixup = true;
}
