#!/bin/bash
#####################################################################################################
#Script orthographe									            #
#Version du script: V0.5									    #
#Derniere edition: 01/04/2016									    #
#Auteur(s): Lévy MARQUES, Révisé par Benjamin HUSSON						    #
#Description: Le script prend un fichier en parametre et affiche les fautes à lécran avec           #
#proposition de mots ainsi que diverses options.                                                    #
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
		egrep  --color=auto -i -n "(^| )${tab[i]}($| )" $1 #On utilise un egrep pour pouvoir utiliser le symbole " | " qui permet de déterminer si le mot est en debut de ligne OU bien après un éspace ET Avant un espace OU en fin de ligne
		echo "Le mot << ${tab[i]} >> n'est pas dans le dico que voulez vous faire? Voici des éventuelles suggestions:"
		./propose.sh ${tab[i]} # Utilisation du script pour proposer
		echo #Retour à la ligne
		select var in Ajouter Remplacer Ignorer #Utilisation d'un menu
		do
			case $var in
				Ajouter) #Cas ou l'on ajoute le mot au dictionnaire
					./ajouter.sh ${tab[i]} Dictionnaire 
					break;;
				Remplacer) #Cas ou l'on remplace le mot dans le texte
					read -p "Remplacer par : " remplacement #On lit une entrée user
					./remplacer.sh ${tab[i]} $remplacement $1 #On applique le script de remplacement
					break;;
				Ignorer) #Cas ou l'on ignore le mot erroné
					break;;
			esac
		done
	fi
done
exit 0 #Tout est bon le code de retour est de 0.
