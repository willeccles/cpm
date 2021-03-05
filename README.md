# Cactus Package Manager
A wrapper for package managers to make them consistent for those of us who are
lazy. It's more like a package manager manager.

## Usage

```
$ cpm [i|r|l|u|U|s|S|I|f|c|h] [pkg]...
-> i|install install one or more packages
-> r|remove  remove one or more packages
-> l|list    list installed packages
-> C|count   count installed packages
-> u|update  update package lists
-> U|upgrade upgrade all packages
-> s|search  search for a package
-> S|show    show information about a package
-> I|info    same as show
-> f|files   show file list of package
-> f|from    show package which owns a file
-> c|clean   clean up leftover files/caches/orphans
-> h|help    show this message
```

## Installation
```
git clone https://github.com/willeccles/cpm.git
cd cpm/
sudo install -m755 cpm /bin/cpm
# do whatever you want from here
```

## Supported package managers

- apk (Alpine/Adélie)
- apt (Debian/Ubuntu)
- emerge (Gentoo)
- dnf (Fedora)
- MacPorts (MacOS)
- nix (Global/NixOS)
- pacman (Arch)
- slackpkg (Slackware)
- urpmi (Mageia)
- xbps (Void)

## Explicitly unsupported package managers

- Homebrew

## My package manager isn't supported!!1!!11!1

See CONTRIBUTING.md.
