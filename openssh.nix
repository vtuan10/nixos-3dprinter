{ pkgs, ... }:
{

  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
    passwordAuthentication = false;
    ciphers = [
      "chacha20-poly1305@openssh.com"
      "aes256-gcm@openssh.com"
      "aes128-gcm@openssh.com"
      "aes256-ctr"
      "aes192-ctr"
      "aes128-ctr"
    ];
    kexAlgorithms = [
      "ecdh-sha2-nistp521"
      "ecdh-sha2-nistp384"
      "ecdh-sha2-nistp256"
      "diffie-hellman-group-exchange-sha256"
    ];
    macs = [
      "hmac-sha2-512-etm@openssh.com"
      "hmac-sha2-256-etm@openssh.com"
      "umac-128-etm@openssh.com"
      "hmac-sha2-512"
      "hmac-sha2-256"
      "umac-128@openssh.com"
    ];
    logLevel = "VERBOSE";
    extraConfig = ''
      # Password based logins are disabled - only public key based logins are allowed.
      AuthenticationMethods publickey
    '';
  };

}
