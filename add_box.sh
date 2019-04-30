#!/bin/bash

if [ $# -eq 0 ]; then
	exit 1
fi

boxName="$1"

mkdir -p boxes

hasBox=0
boxNames=($(vagrant box list))
for i in "${boxNames[@]}"
do
	if [[ "$boxName" =~ "$i" ]]; then
		hasBox=1
		break
	fi
done

if [[ $hasBox == 1 ]]; then
	echo "Box $boxName already exists"
	exit 0
fi

boxesDir="./boxes"
boxFile="$boxesDir/$boxName.box"
if [ -f $boxFile ]; then
	echo "Box file for $boxName already exists, adding to vagrant.."
	vagrant box add $boxName $boxFile
	exit 0
fi

boxURLs=(
	"http://aka.ms/ie6.xp.vagrant"
	"http://aka.ms/ie8.xp.vagrant"
	"http://aka.ms/ie7.vista.vagrant"
	"http://aka.ms/ie8.win7.vagrant"
	"http://aka.ms/ie9.win7.vagrant"
	"http://aka.ms/ie10.win7.vagrant"
	"http://aka.ms/ie11.win7.vagrant"
	"http://aka.ms/ie10.win8.vagrant"
	"http://aka.ms/ie11.win81.vagrant"
	"http://aka.ms/msedge.win10.vagrant"
)
boxURL=""
boxNameInUrl=$(echo "$boxName" | sed 's/-/\./')

for url in "${boxURLs[@]}"
do
	if [[ $url =~ "$boxNameInUrl" ]]; then
		boxURL=$url
		break
	fi
done

if [ -f ./$boxesDir/$boxNameInUrl.vagrant ]; then
	echo "Zip file for $boxName already exists"
else
	echo "Downloading image for $boxName from $boxURL. This may take a while."
	wget -P $boxesDir -q $boxURL
fi

echo "Unzipping..."
unzip -p ./$boxesDir/$boxNameInUrl.vagrant > $boxFile

vagrant box add $boxName $boxFile
