#!/bin/bash
#####################################################################################################
#Script orthographe									            #
#Version du script: V0.2									    #
#Derniere edition: 25/03/2016									    #
#Auteur(s): Lévy MARQUES, Révisé par Benjamin HUSSON						    #
#Description: Le script prend un fichier en parametre et affiche les fautes à lécran.               #
#												    #
#####################################################################################################

mot=$1
#grep --max-count=10 -i --color=auto $mot ./Dictionnaire
declare -i proches=10
for i in `seq 1 ${#mot}`
do
	motRemp=`echo $mot | sed s/././$i`
	if [[ $proches -gt 0 ]]
	then
		grep -i --max-count=$proches ^$motRemp$ ./Dictionnaire | tr '\n' ' '
		proches=$proches-`grep -i --max-count=$proches ^$motRemp$ ./Dictionnaire | wc -l`
	fi
done
grep --max-count=$proches -i $mot ./Dictionnaire | tr '\n' ' '
