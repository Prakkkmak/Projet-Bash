#!/bin/bash
#####################################################################################################
#Script orthographe									            #
#Version du script: V0.2									    #
#Derniere edition: 25/03/2016									    #
#Auteur(s): Lévy MARQUES						                            #
#Description: Avec 2 parametres le script permet d'ajouter $1 dans le fichier $2                    #
#												    #
#####################################################################################################

if [[ $# -ne 2 ]] #On vérifie le nombre de paramètres
then
	echo "ajouter.sh a besoin de deux paramètres" #Affichage du message d'erreur
	exit 2 #On sort la valeur 2
fi

echo $1 >> $2

exit 0 # Tout c'est bien passé
