# Cactus Package Manager
A wrapper for package managers to make them consistent for those of us who are
lazy. It's more like a package manager manager.

## Usage

```
$ cpm [i|r|l|u|U|s|S|c|h] [pkg]...
-> i|install install one or more packages
-> r|remove  remove one or more packages
-> l|list    list installed packages
-> C|count   count installed packages
-> u|update  update package lists
-> U|upgrade upgrade all packages
-> s|search  search for a package
-> S|show    show information about a package
-> I|info    same as show
-> c|clean   clean up leftover files/caches/orphans
-> h|help    show this message
```

## Supported package managers:

- Apt
- Fedora
- MacPorts
- pacman
- XBPS

## Explicitly unsupported package managers:

- Homebrew

## My package manager isn't supported!!1!!11!1

See CONTRIBUTING.md.
