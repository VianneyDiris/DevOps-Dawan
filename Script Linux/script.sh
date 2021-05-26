#!/bin/bash

# vérification des arguments dans une fonction
function testParameter
{

	if [ "$1" -ne 2 ]
	then
        	echo "il faut 2 arguments"
		exit 2
	fi
}

testParameter $#

# vérifier que le répertoire existe
function testDirectoryExist
{
	if [ ! -d "$1" ]
	then
		echo "le répertoire $1 n'existe pas"
		exit 3
	fi
}

# boucle sur les arguments
for arg in "$@"; do
	testDirectoryExist $arg
done

# sauvegarde le répertoire sélectionné en argument 1 dans le répertoire en argument 2
DATE=$(date +%Y-%m-%d-%H%M%S)
tar -cvzpf $2/backup-$DATE.tar.gz $1
exit 0
