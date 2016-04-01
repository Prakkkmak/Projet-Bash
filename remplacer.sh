#!/bin/bash
#####################################################################################################
#Script orthographe									            #
#Version du script: V0.2									    #
#Derniere edition: 25/03/2016									    #
#Auteur(s): Lévy MARQUES						                            #
#Description: Avec 3 parametres le script permet de remplacer dans $3 le mot $2 par $1              #
#												    #
#####################################################################################################

if [[ $# -ne 3 ]] #On vérifie le nombre de paramètres
then
	echo "Verif a besoin seulement de 1 seul paramètre: ./remplacer.sh [motaremplacer] [nouveaumot] [fichier]" #Affichage du message d'erreur
	exit 2 #On sort la valeur 2
fi

sed -i.bak 's/'$1'/'$2'/g' $3

exit 0 #Tout c'est bien passé
