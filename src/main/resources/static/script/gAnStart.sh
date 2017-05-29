#!/bin/bash

source /home/andrea/Downloads/buildRoot/bin/thisroot.sh


echo "primo"
cd /opt/lampp/htdocs/test-interChangeble/gAn-SPERIMENTAL/
echo "secondo"
pwd

root -l -b rungAn.C\(31111\,\"mimito_default\"\,true\)
echo "terzo"
pwd

