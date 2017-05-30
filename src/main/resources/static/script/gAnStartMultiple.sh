#!/bin/bash

source /home/andrea/Downloads/buildRoot/bin/thisroot.sh

cd $1
#cd /opt/lampp/htdocs/test-interChangeble/gAn-SPERIMENTAL/

root -l -b rungAn.C\($2\, $3\,\"$4\"\,true\)
#root -l -b rungAn.C\(31111\,\"mimito_default\"\,true\)

