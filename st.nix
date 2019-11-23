with import <nixpkgs> {};

stdenv.mkDerivation rec {
    name = "st";
    version = "0.9";
    src = fetchFromGitHub {
	owner = "pacordova";
	repo = "st";
	rev = "a382e776c3e2ab613ad8d83d63d99b75334f9e10";
        sha256 = null;
    };
    nativeBuildInputs = [ pkgconfig ];
    buildInputs = [ xorg.libX11 ncurses xorg.libXext xorg.libXft fontconfig ];
    installPhase = ''
        TERMINFO=$out/share/terminfo make install PREFIX=$out
        '';
}
