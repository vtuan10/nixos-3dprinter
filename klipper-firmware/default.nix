{ pkgs ? import <nixpkgs> { } }: rec {
  klipper-firmware = pkgs.callPackage ./klipper-firmware.nix { configFile = ./avr.cfg; };
  klipper-flash = pkgs.writeShellScriptBin "klipper-flash" ''
    ${pkgs.avrdude}/bin/avrdude -p atmega2560 -c wiring -P /dev/serial/by-id/usb-Arduino__www.arduino.cc__0042_55639303235351D01152-if00 -D -U "flash:w:${klipper-firmware}/klipper.elf.hex:i"
  '';
}
