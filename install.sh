#!/bin/bash

trap 'echo exiting cleanly...; exit 1;' SIGINT SIGTSTP

function checkroot {
	if [[ "$(id -u)" -ne 0 ]]; then
		printf "\e[1;77mPlease, run this program as root!\n\e[0m"
		exit 1
	fi
}
checkroot

(trap '' SIGINT SIGTSTP && command -v tor > /dev/null 2>&1 || { printf >&2  "\e[1;92mInstalling tor, please wait...\n\e[0m"; apt-get update > /dev/null && apt-get -y install tor > /dev/null || printf "\e[1;91mTor Not installed.\n\e[0m"; }) & wait $!

(trap '' SIGINT SIGTSTP && command -v openssl > /dev/null 2>&1 || { printf >&2  "\e[1;92mInstalling openssl, please wait...\n\e[0m"; apt-get update > /dev/null && apt-get -y install openssl > /dev/null || printf "\e[1;91mOpenssl Not installed.\n\e[0m"; }) & wait $! 

(trap '' SIGINT SIGTSTP && command -v curl > /dev/null 2>&1 || { printf >&2  "\e[1;92mInstalling curl, please wait...\n\e[0m"; apt-get update > /dev/null && apt-get -y install curl > /dev/null || printf "\e[1;91mCurl Not installed.\n\e[0m"; }) & wait $!

(trap '' SIGINT SIGTSTP && command -v figlet > /dev/null 2>&1 || { printf >&2  "\e[1;92mInstalling figlet, please wait...\n\e[0m"; apt-get update > /dev/null && apt-get -y install figlet > /dev/null || printf "\e[1;91mFiglet Not installed.\n\e[0m"; }) & wait $!

(trap '' SIGINT SIGTSTP && command -v whiptail > /dev/null 2>&1 || { printf >&2  "\e[1;92mInstalling whiptail, please wait...\n\e[0m"; apt-get update > /dev/null && apt-get -y install whiptail > /dev/null || printf "\e[1;91mWhiptail Not installed.\n\e[0m"; }) & wait $!

printf "\e[1;92mAll Requires are installed!\n\e[0m"
