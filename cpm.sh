#!/bin/sh
# shellcheck shell=sh # Written to be posix compatible

# Created by Will Eccles identified using an electronic mail <will@eccles.dev> in 2020 under the terms of Mozilla Public License Version 2.0 <https://www.mozilla.org/en-US/MPL/2.0/>
# Concepted by Jacob Hrbek identified using an electronic mail <kreyren@rixotstudio.cz> with GPG identifier 0x765AED304211C28410D5C478FCBA0482B0AB9F10 in 18:57:52 CEST 06.09.2020-EU under license MPLv2 <https://www.mozilla.org/en-US/MPL/2.0/>

###! Cactus Package Manager
###! A wrapper for package managers to make them consistent for those of us who are lazy. It's more like a package manager manager.

[ -z "$EXIT" ] && EXIT="exit"
[ -z "$PRINTF" ] && PRINTF="printf"
[ -z "$SET" ] && SET="set"
[ -z "$LSB_RELEASE" ] && LSB_RELEASE="lsb_release"
[ -z "$TR" ] && TR="tr"
[ -z "$APT_GET" ] && APT_GET="apt-get"
[ -z "$PACMAN" ] && PACMAN="pacman"

# Exit on anything unexpected
"$SET" -e

die() { "$PRINTF" 'FATAL: %s\n' "$2"; "$EXIT" "$1" ;}

# Identify the kernel and store it's name lowercased in variable 'KERNEL'
if "$COMMAND" -v "$UNAME" 1>/dev/null; then
	KERNEL="$("$UNAME" -s | "$TR" [[:upper:]] [[:lower:]])"
elif ! "$COMMAND" -v "$UNAME" 1>/dev/null; then
	case "$LANG" in
		en-*|*)
			die 28 "Based on command '${COMMAND:-command}' command '${UNAME:-uname}' is not executable on this environment, unable to identify used kernel which prevents further runtime"
	esac
else
	case "$LANG" in
		en-*|*)
			die 255 "Unexpected happend while identifying used kernel"
	esac
fi

# Identify used distribution
if "$COMMAND" -v "$LSB_RELEASE" 1>/dev/null; then
	DISTRO="$("$LSB_RELEASE" -si | "$TR" [[:upper:]] [[:lower:]])"
elif ! "$COMMAND" -v "$LSB_RELEASE" 1>/dev/null; then
	case "$LANG" in
		en-*|*)
			die 28 "Concluded that command '${LSB_RELEASE:-lsb_release}' is not executable on this environment, unable to identify the used distribution"
	esac
else
	case "$LANG" in
		en-*|*)
			die 255 "Unexpected happend while trying to identify the distribution"
	esac
fi

# Process arguments
while [ "$#" -gt 0 ]; do case "$1" in
	install|i) # Used to install packages
		shift 1 # Shift the 'install'
		case "$KERNEL/$DISTRO" in
			"linux/devuan" | "linux/debian" | "linux/ubuntu")
				if "$COMMAND" -v "$APT_GET" 1>/dev/null; then
					apt-get install --yes "$*"
				elif "$COMMAND" -v "$APT_GET" 1>/dev/null; then
					die 1 "Command '${APT_GET:-apt-get}' is not executable in this environment"
				else
					die 255 "Unexpected happend while processing '$*' on kernel '${KERNEL:-unknown}' using distribution '${DISTRO:-unknown}'"
				fi
			;;
			"linux/archlinux")
				if "$COMMAND" -v "$PACMAN" 1>/dev/null; then
					pacman -Suy "$@"
				elif "$COMMAND" -v "$PACMAN" 1>/dev/null; then
					die 1 "Command '${PACMAN:-pacman}' is not executable in this environment"
				else
					die 255 "Unexpected happend while processing '$*' on kernel '${KERNEL:-unknown}' using distribution '${DISTRO:-unknown}'"
				fi
			;;
			*) die 28 "Kernel '${KERNEL:-unknown}' using distribution '${DISTRO:-unknown}' is not implemented"
		esac
	;;
	*)
		case "$LANG" in
			en-*|*) die 2 "Parsed argument '$1' is not recognized by this script"
		esac
esac; done
