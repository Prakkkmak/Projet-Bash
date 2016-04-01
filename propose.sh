#!/bin/bash
#####################################################################################################
#Script orthographe									            #
#Version du script: V0.3									    #
#Derniere edition: 25/03/2016									    #
#Auteur(s): Lévy MARQUES                                  					    #
#Description: Le script prend un mot en parametre et affiche des propositions de correction à lécran#
#												    #
#####################################################################################################

if [[ $# -ne 1 ]] #On vérifie le nombre de paramètres
then
	echo "Propose a besoin de un paramètre" #Affichage du message d'erreur
	exit 2 #On sort la valeur 2
fi


mot=$1 #On met le mot dans une variable
declare -i proches=10 #On déclare et initialise le nombre de mots proches que l'on veut afficher
for i in `seq 1 ${#mot}` #Ici on parcours les indice de position des lettres du mot.
do
	motRemp=`echo $mot | sed s/././$i` #On créé un mot temporaire qui prend le caractere "." à la place de la lettre actuelle du mot.
	if [[ $proches -gt 0 ]] #Si il nous reste des mots à afficher alors:
	then
		grep -i --max-count=$proches ^$motRemp$ ./Dictionnaire | tr '\n' ' ' #On affiche les mots proches avec un maximum de $proches affichage
		proches=$proches-`grep -i --max-count=$proches ^$motRemp$ ./Dictionnaire | wc -l` #On compte le nombre de mots affichés et on le soustrais à $proches
	fi
done
grep --max-count=$proches -i $mot ./Dictionnaire | tr '\n' ' ' # On affiche les mots contenant le $mot avec toujours un nombre dem ots max.

exit 0 # Tout c'est bien passé
