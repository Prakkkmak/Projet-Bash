#! /bin/bash
#####################################################################################################
#Script Verif											    #
#Version du script: V0.2									    #
#Derniere edition: 10/03/2016									    #
#Auteur(s): Lévy MARQUES									    #
#Description: Le script vérifie si le mot passé en paramètre 1 est contenu dans le		    #
#fichier mis en parametre 2. Chaque mot du fichier (param.2) doit être au nombre de 1 par ligne.    #
#####################################################################################################

if [[ $# -ne 2 ]] #On vérifie le nombre de paramètres
then
	echo "Verif a besoin de deux paramètres" #Affichage du message d'erreur
	exit 2 #On sort la valeur 2
fi

if grep -q -i ^$1$ $2 #On cherche une ligne qui contient strictement $1 dans le fichier $2. Le -q permet de ne pas afficher le résultat. Le -i permet d'éviter la casse. grep renvoie 1 si il ne trouve rien et 0 s'il trouve quelque chose.
then
	exit 0 #Tout est bon le code de retour est de 0
else
	exit 1 #Le mot n'existe pas, le code de retour est 1
fi
