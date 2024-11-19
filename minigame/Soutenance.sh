#!/bin/bash -x

# commencer le jeu / interaction avec l'utilisateur 

PS3='Entrez votre choix : '
options=( " Jouer " "Ouitter" )
select opt in "${options[@]}"
do
    case $opt in
        " Jouer ")
        Nm_alt=(10 +$RANDOM % 90)
        list=$(shuf -i 1-20 -n 5) 
        tableau=($mlist);
        echo ${};
        
            ;;
        "Quitter")
            break
            ;;
        *)
    esac
done