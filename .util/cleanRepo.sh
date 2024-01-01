#!/bin/env bash 

# Set command arg to 
#  "binary" to only do bin         folder
#  "test"   to only do test/output folder
#  "lib"    to only do lib         folder
#  "object" to only do the obj     folder
# Nothing to do both
#
#shopt -s nocasematch
#
#---- Get Shell Scripts path  ------------------------------------------------------------
#
ShellDirCleanRepo="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#
CwdCleanRepo="$(pwd)"
#
cd "$ShellDirCleanRepo"
#
#---- Get location of find  --------------------------------------------------------------
#
source ./findfind.sh
#
#
#---- Get NL and BLN variables  ----------------------------------------------------------
#
source ./setNL.sh
#
#
#---- Run Script  ------------------------------------------------------------------------
#
#
T="true"
F="false"

ALL=$F

NOARG=$T

BIN=$F
OBJ=$F
LIB=$F
EX=$F
PauseCleanRepo=$T

for ARG in "$@" 
do
  case "${ARG:0:1}" in
   b | B )
          BIN=$T
          NOARG=$F
           ;;
   l | L )
          LIB=$T
          NOARG=$F
           ;;
   o | O )
          OBJ=$T
          NOARG=$F
           ;;
   n | N )
          PauseCleanRepo=$F
           ;;
   t | T )
          EX=$T
          NOARG=$F
           ;;
   a | A )
          ALL=$T
          NOARG=$F
           ;;
   *) DUMDUM=$T;;
  esac
done

#---- Run Script  ------------------------------------------------------------------------
#
if [ $ALL = $T ]; then
                 BIN=$T
                 EX=$T
                 OBJ=$T
                 LIB=$T
fi

if [ $NOARG = $T ]; then
                 BIN=$F
                 EX=$T
                 OBJ=$T
                 LIB=$T
fi

#Clean out the bin folder
if [ $BIN = $T ]; then
   echo "${NL}BIN Clean: ${FND} ./bin -not -name 'bin' -not -name '.keep' -delete"
   touch ../bin/tmp.txt
   ${FND} ../bin -not -name 'bin' -not -name '.keep' -delete
fi

#Clean out the object file output
if [ $OBJ = $T ]; then
   echo "${NL}OBJ Clean: ${FND} ./obj -not -name 'obj' -not -name '.keep' -delete"
   touch ../obj/tmp.txt
   ${FND} ../obj -not -name 'obj' -not -name '.keep' -delete
fi

#Clean out the object file output
if [ $LIB = $T ]; then
   echo "${NL}LIB Clean: ${FND} ./lib -not -name 'lib' -not -name '.keep' -delete"
   touch ../lib/tmp.txt
   ${FND} ../lib -not -name 'lib' -not -name '.keep' -delete
fi

#Clean out the example problem output
if [ $EX = $T ]; then
   echo "${NL}Test Clean: ${FND} ./test/output -not -name 'output' -not -name '.keep' -delete"
   touch ../test/output/tmp.txt
   ${FND} ../test/output -not -name 'output' -not -name '.keep' -delete
fi

#
#---- Return to calling folder  ----------------------------------------------------------
#
cd "$CwdCleanRepo"

#
#
#---- Check For "nopause"  ---------------------------------------------------------------
#
if [ $PauseCleanRepo = $T ]
then
   read -p "${NL}Repo Now Clean.${BLN}Press [ENTER] to end script ... "
else
   echo "${BLN}Repo Now Clean.${NL}"
fi
#
#---- Delete local variables  -------------------------------------------------------------
#
#BLN=
#NL=
ShellDirCleanRepo=
CwdCleanRepo=
PauseCleanRepo=
T=
F=
ALL=
NOARG=
BIN=
OBJ=
LIB=
EX=
DUMDUM=

#unset BLN
#unset NL
unset ShellDirCleanRepo
unset CwdCleanRepo
unset PauseCleanRepo
unset T
unset F
unset ALL
unset NOARG
unset BIN
unset OBJ
unset LIB
unset EX
unset DUMDUM