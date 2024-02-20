#!/bin/bash
echo "Script executed from: ${PWD}"

BASEDIR=$(dirname $0)
echo "Script location: ${BASEDIR}"

echo "Script about to run another script."
sh ${BASEDIR}/focusone-crm.sh
