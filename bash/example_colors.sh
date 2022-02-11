#!/bin/bash

#    .---------- constant part!
#    vvvv vvvv-- the code from above
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURLPLE='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

CYAN_BG="\e[1;46m"
RED_BG='\e[0;31m'
GREEN_BG='\e[0;32m'
ORANGE_BG='\e[0;33m'
BLUE_BG='\e[0;34m'
PURLPLE_BG='\e[0;35m'
GRAY_BG='\e[0;37m'
YELLOW_BG='\e[1;33m'
WHITE_BG='\e[1;37m'
NC_BG='\e[0m' # No Color

bold=$(tput bold)
normal=$(tput sgr0)


printf "${bold}#### BOLD TEXT ${GREEN} WITH GREEN ${RED} RED ${ORANGE} ORANGE ${NC}${normal}\n"
