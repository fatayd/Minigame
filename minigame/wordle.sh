#!/bin/bash

function getRandomWord() {
    words=('Abuse' 'Adult' 'Agent' 'Anger' 'Apple' 'Award' 'Basis' 'Beach' 'Birth' 'Block' 'Blood' 'Board' 'Brain' 'Bread' 'Break' 'Brown' 'Buyer' 'Cause' 'Chain' 'Chair' 'Chest' 'Chief' 'Child' 'China' 'Claim' 'Class' 'Clock' 'Coach' 'Coast' 'Court' 'Cover' 'Cream' 'Crime' 'Cross' 'Crowd' 'Crown' 'Cycle' 'Dance' 'Death' 'Depth' 'Doubt' 'Draft' 'Drama' 'Dream' 'Dress' 'Drink' 'Drive' 'Earth' 'Enemy' 'Entry' 'Error' 'Event' 'Faith' 'Fault' 'Field' 'Fight' 'Final' 'Floor' 'Focus' 'Force' 'Frame' 'Frank' 'Front' 'Fruit' 'Glass' 'Grant' 'Grass' 'Green' 'Group' 'Guide' 'Heart' 'Henry' 'Horse' 'Hotel' 'House' 'Image' 'Index' 'Input' 'Issue' 'Japan' 'Jones' 'Judge' 'Knife' 'Laura' 'Layer' 'Level' 'Lewis' 'Light' 'Limit' 'Lunch' 'Major' 'March' 'Match' 'Metal' 'Model' 'Money' 'Month' 'Motor' 'Mouth' 'Music' 'Night' 'Noise' 'North' 'Novel' 'Nurse' 'Offer' 'Order' 'Other' 'Owner' 'Panel' 'Paper' 'Party' 'Peace' 'Peter' 'Phase' 'Phone' 'Piece' 'Pilot' 'Pitch' 'Place' 'Plane' 'Plant' 'Plate' 'Point' 'Pound' 'Power' 'Press' 'Price' 'Pride' 'Prize' 'Proof' 'Queen' 'Radio' 'Range' 'Ratio' 'Reply' 'Right' 'River' 'Round' 'Route' 'Rugby' 'Scale' 'Scene' 'Scope' 'Score' 'Sense' 'Shape' 'Share' 'Sheep' 'Sheet' 'Shift' 'Shirt' 'Shock' 'Sight' 'Simon' 'Skill' 'Sleep' 'Smile' 'Smith' 'Smoke' 'Sound' 'South' 'Space' 'Speed' 'Spite' 'Sport' 'Squad' 'Staff' 'Stage' 'Start' 'State' 'Steam' 'Steel' 'Stock' 'Stone' 'Store' 'Study' 'Stuff' 'Style' 'Sugar' 'Table' 'Taste' 'Terry' 'Theme' 'Thing' 'Title' 'Total' 'Touch' 'Tower' 'Track' 'Trade' 'Train' 'Trend' 'Trial' 'Trust' 'Truth' 'Uncle' 'Union' 'Unity' 'Value' 'Video' 'Visit' 'Voice' 'Waste' 'Watch' 'Water' 'While' 'White' 'Whole' 'Woman' 'World' 'Youth')

    size=${#words[@]}
    index=$(($RANDOM % $size))
    echo ${words[$index]}
}

function getInput() {
    read -p "Le mot à deviner en 5 lettres est : " -r
    echo "$REPLY"
}

random_word=$(getRandomWord)
val_user=$(getInput)


while true; do
    length=$(echo -n $val_user | wc -c)
    
    if [ "$length" -ne 5 ]; then
        echo "Le mot doit comporter exactement 5 lettres."
        val_user=$(getInput)
        continue
    fi

    prem_let=$(echo "$val_user" | cut -c1)
    maj_prem_let=$(echo "$prem_let" | tr 'a-z' 'A-Z')

    if [ "$prem_let" != "$maj_prem_let" ]; then
        echo "La première lettre doit être une majuscule."
        val_user=$(getInput)
        continue
    fi

    reste_du_mot=$(echo "$val_user" | cut -c2-5)
    min_reste_du_mot=$(echo "$reste_du_mot" | tr 'A-Z' 'a-z')

    if [ "$reste_du_mot" != "$min_reste_du_mot" ]; then
        echo "Les 4 lettres suivantes doivent être en minuscules."
        val_user=$(getInput)
        continue
    fi

    affichage=""
    for ((j=0; j<5; j++)); do
        if [ "${random_word:j:1}" == "${val_user:j:1}" ]; then
            affichage+="${val_user:j:1}"
        else
            affichage+="_"
        fi
    done

    echo "Progression : $affichage"

    if [ "$val_user" == "$random_word" ]; then
        echo "Félicitations ! Vous avez deviné le mot : $random_word"
        break
    else
        echo "Ce n'est pas le bon mot. Essayez encore !"
        val_user=$(getInput)
    fi
done