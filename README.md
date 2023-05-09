# Cactus Package Manager
A wrapper for package managers to make them consistent for those of us who are
lazy. It's more like a package manager manager.

## Usage

```
$ cpm [i|r|l|u|U|s|S|I|F|f|c|h] [pkg]...
-> i|install install one or more packages
-> r|remove  remove one or more packages
-> l|list    list installed packages
-> C|count   count installed packages
-> u|update  update package lists
-> U|upgrade update package lists and upgrade all packages
-> s|search  search for a package
-> S|show    show information about a package
-> I|info    same as show
-> F|files   show file list of package
-> f|from    show package which owns a file
-> c|clean   clean up leftover files/caches/orphans
-> h|help    show this message
```

## Installation

```bash
git clone https://github.com/willeccles/cpm.git
cd cpm
sudo make install
```

## Supported package managers

- apk (Alpine/Adélie)
- apt (Debian/Ubuntu)
- pkgutils (CRUX)
- emerge (Gentoo)
- dnf (Fedora)
- rpm-ostree (Fedora Silverblue)
- guix (non-system-wide Guix)
- Homebrew
- lunar (Lunar)
- MacPorts (macOS)
- pacman (Arch)
- pkg (FreeBSD and OpenBSD)
- slackpkg (Slackware)
- sorcery (Source Mage)
- urpmi (Mageia)
- xbps (Void)
- zypper (OpenSUSE)

## Explicitly unsupported package managers

- Cargo
- Flatpak
- Nix
- NPM
- Pip
- Snap
- Yarn

## My package manager isn't supported!!1!!11!1

See CONTRIBUTING.md.
