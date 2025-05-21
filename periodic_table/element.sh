#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

INPUT=$1

if [[ -z $1 ]]
then 
    echo "Please provide an element as an argument."
else
    #if input is a number:
    if [[ $INPUT =~ ^[0-9]+$ ]]
    then
        #get data
        ATOMIC_NUMBER=$INPUT
        NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")
        SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")
    else
        #i try to get the atomic_number
        GET_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$INPUT';")
        if [[ -z $GET_ATOMIC_NUMBER ]]
        then
            ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$INPUT';")
            SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$INPUT';")
            NAME=$INPUT
        else
            ATOMIC_NUMBER=$GET_ATOMIC_NUMBER
            SYMBOL=$INPUT
            NAME=$($PSQL "SELECT name FROM elements WHERE SYMBOL='$INPUT';")
        fi
    fi

    if [[ -z $ATOMIC_NUMBER ]]
    then
        echo "I could not find that element in the database."
    else
        TYPE=$(echo "$($PSQL "SELECT properties.atomic_number, types.type FROM properties LEFT JOIN types ON properties.type_id=types.type_id WHERE atomic_number=$ATOMIC_NUMBER;")" | sed 's/^[0-9]\+|//')
        ##
        ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
        MELTING_POINT_CELCIUS=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
        BOILING_POINT_CELCIUS=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")

        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELCIUS celsius and a boiling point of $BOILING_POINT_CELCIUS celsius."
    fi
fi