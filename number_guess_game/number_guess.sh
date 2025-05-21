#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


echo "Enter your username:"
read NAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$NAME';")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $NAME! It looks like this is your first time here."
  SET_NAME=$($PSQL "INSERT INTO users(name) VALUES('$NAME');")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$NAME';")
  NEW_GAMES_PLAYED=1
else
  ##este ni idea
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID;")
  NEW_GAMES_PLAYED=$GAMES_PLAYED+1
  ##
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID;")

  echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

NUMBER=$(( RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true; do
  if [[ $1 ]]; then
    echo -e "\n$1"
  fi

  read GUESS

  if [[ $GUESS =~ ^[0-9]+$ ]]; then
    ((NUMBER_OF_GUESSES++))

    if [[ $GUESS -eq $NUMBER ]]; then
      # Save game result
      SET_GAME=$($PSQL "INSERT INTO games(number_of_guesses, user_id) VALUES($NUMBER_OF_GUESSES, $USER_ID);")
      GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED WHERE user_id=$USER_ID;")
      NEW_BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) AS best_game FROM games WHERE user_id=$USER_ID;")
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$NEW_BEST_GAME WHERE user_id=$USER_ID;")
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"
      break
    elif [[ $GUESS -gt $NUMBER ]]; then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
  else
    echo "That is not an integer, guess again:"
  fi
done
