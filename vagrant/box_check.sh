#!/bin/bash

if [ $# -eq 0 ]; then
	exit 1
fi

boxNames=($(vagrant box list))

boxNamePrefix=$(echo "$1" | sed 's/ie.*//')
if [[ $boxNamePrefix == "" ]]; then
	boxNamePrefix="win7"
fi
boxNameSuffix=$(echo "$1" | sed 's/^.*ie/ie/')
fullBoxName="$boxNamePrefix-$boxNameSuffix"

if [[ $2 == "" ]]; then
	hasBox=1
	for i in "${boxNames[@]}"
	do
		if [[ "$fullBoxName" =~ "$i" ]]; then
			hasBox=0
			break
		fi
	done

	if [[ $hasBox == 1 ]]; then

		boxURLs=( "http://aka.ms/vagrant-win7-ie8" "http://aka.ms/vagrant-win7-ie9" "http://aka.ms/vagrant-win7-ie10" "http://aka.ms/vagrant-win7-ie11" "http://aka.ms/vagrant-win8-ie10" "http://aka.ms/vagrant-win81-ie11" )
		boxURL=""
		for url in "${boxURLs[@]}"
		do
			if [[ $url =~ "$fullBoxName" ]]; then
				boxURL=$url
				break
			fi
		done
		vagrant box add $fullBoxName $url 
	else
		echo "Box already exists"
	fi

else
	vagrant box add $fullBoxName $2
fi