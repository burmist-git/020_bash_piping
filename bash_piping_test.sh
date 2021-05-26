#!/bin/bash

# Date        : Wed May 26 13:36:10 CEST 2021
# Autor       : Leonid Burmistrov
# Description : 

function bash_piping {
    ${0} -m | bash -s -- -d
    ${0} -m | bash -s -- -m
    ${0} -m | bash -s -- -p
}

function bash_piping_test_sh {
    date
    echo "bash_piping_test_sh"
}

function more_sh {
    if [ ${0} = "bash" ]; then
	bash_help_sh
    else
	more ${0}
    fi
}

function bash_help_sh {
    echo
    echo "# arguments called with ---->  ${@}     "
    echo "# \$1  ---------------------->  $1      "
    echo "# \$2  ---------------------->  $2      "
    echo "# path to me --------------->  ${0}     "
    echo "# parent path -------------->  ${0%/*}  "
    echo "# my name ------------------>  ${0##*/} "
    echo
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -p     : Run piping "
    echo " -d     : Default "
    echo " -m     : more "
    echo " -b     : bash help "
    echo "    [1] : par "
    echo " -h : print help "
}

function init_sh {
    if [ $# -eq 0 ]; then
	printHelp
    else
	if [ "$1" = "-d" ]; then
	    bash_piping_test_sh
	elif [ "$1" = "-h" ]; then
	    printHelp
	elif [ "$1" = "-p" ]; then
	    bash_piping
	elif [ "$1" = "-b" ]; then
	    if [ $# -eq 2 ]; then
		bash_help_sh $1 $2
	    else
		printHelp
	    fi
	elif [ "$1" = "-m" ]; then
	    more_sh
	else
            printHelp
	fi
    fi
}

init_sh "$@"
