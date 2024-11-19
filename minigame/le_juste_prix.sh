#!/bin/bash 
 Nm_alt=$((($RANDOM % 100)+ 1))
 echo "$Nm_alt"
 read val_user
i=0
while true
do
  ((i++))

    echo -n "Coup $i : "
    read val_user
    if [ $val_user -gt $Nm_alt ]; then 
        echo $ "trop haut !"
    elif [ $val_user -lt $Nm_alt ]; then
            echo $ " trop bas !"
        
    else
                echo  "Félicitations ! Vous avez trouvé le juste prix $Nm_alt en $i coups"
                 break      
       
    fi

done