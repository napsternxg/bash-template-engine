#!/usr/bin/env bash
if [[ ! -z $2 ]]; then
	. $2
else
	. ./variables.sh
fi
##########################################################
# SIMPLE BASH TEMPLATING ENGINE
# AUTHOR: Shubhanshu Mishra
# DATE: Wed 13 Feb 2013 10:16:06 PM IST
# USAGE: render
##########################################################


render(){
	File="$1"
	while read -r line ; do
	    while [[ "$line" =~ (\$\{[a-zA-Z_][a-zA-Z_0-9]*\}) ]] ; do
		LHS=${BASH_REMATCH[1]}
		RHS="$(eval echo "\"$LHS\"")"
		line=${line//$LHS/$RHS}
	    done
	    echo -e "\e[00;34m$line\e[00m"
	done < $File
}

render $1 $2

