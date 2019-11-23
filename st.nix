with import <nixpkgs> {};

stdenv.mkDerivation rec {
    name = "st";
    version = "0.9";
    src = fetchFromGitHub {
	owner = "pacordova";
	repo = "st";
	rev = "d05c239be64d86fe95507b6d521e1c5d28883cd6";
        sha256 = null;
    };
    nativeBuildInputs = [ pkgconfig ];
    buildInputs = [ xorg.libX11 ncurses xorg.libXext xorg.libXft fontconfig ];
    installPhase = ''
        TERMINFO=$out/share/terminfo make install PREFIX=$out
        '';
}
