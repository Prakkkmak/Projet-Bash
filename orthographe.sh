#!/bin/bash
#####################################################################################################
#Script orthographe									            #
#Version du script: V0.2									    #
#Derniere edition: 25/03/2016									    #
#Auteur(s): Lévy MARQUES, Révisé par Benjamin HUSSON						    #
#Description: Le script prend un fichier en parametre et affiche les fautes à lécran.               #
#												    #
#####################################################################################################

if [[ $# -ne 1 ]] #On vérifie le nombre de paramètres
then
	echo "Verif a besoin seulement de 1 seul paramètre: ./orthographe.sh [param1]" #Affichage du message d'erreur
	exit 2 #On sort la valeur 2
fi


declare -a tab #On créé un tableau tab
tab=($(cat $1)) #On affecte à tab via l'affectation composée l'évaluation de la commande cat
for i in ${!tab[@]} #On parcours les éléments du tableau
do
	if ! ./verif.sh ${tab[i]} Dictionnaire #On vérifie si le mot n'est pas dans le dico
	then
		egrep  --color=auto -i -n "(^| )${tab[i]}($| )" $1 #On utilise un egrep pour pouvoir utiliser le symbole " | " qui permet de déterminer si le mot est en debut de ligne OU bien après un éspace.
		echo "Le mot << ${tab[i]} >> n'est pas dans le dico que voulez vous faire? Voici des suggestions:"
		./propose.sh ${tab[i]}
		echo
		select var in Ajouter Remplacer Ignorer
		do
			case $var in
				Ajouter)
					./ajouter.sh ${tab[i]} Dictionnaire
					break;;
				Remplacer)
					read -p "Remplacer par : " remplacement
					./remplacer.sh ${tab[i]} $remplacement $1
					break;;
				Ignorer)
					break;;
			esac
		done
	fi
done
exit 0 #Tout est bon le code de retour est de 0.
