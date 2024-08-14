#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER=$((RANDOM%1000+1))

echo -e "\nEnter your username:"
read USERNAME

CHECK=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

if [[ -z $CHECK ]]
then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")

else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(try_id) FROM tries WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(n_guesses) FROM tries WHERE username='$USERNAME'")

  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  
fi

echo -e "\nGuess the secret number between 1 and 1000:"
GUESSES=1
while read INPUT
do 

  if [[ ! $INPUT =~ ^[0-9]+$ ]]
  then 
    echo -e "That is not an integer, guess again:"
  else
    if [[ $INPUT -eq $NUMBER ]]
    then
      echo -e "\nYou guessed it in $GUESSES tries. The secret number was $NUMBER. Nice job!"
      break;
    else
      if [[ $INPUT -gt $NUMBER ]]
      then
        echo -e "It's lower than that, guess again:"
        GUESSES=$((GUESSES + 1))
      else
        echo -e "It's higher than that, guess again:"
        GUESSES=$((GUESSES + 1))
      fi
    fi
  fi
done

INSERT_TO_TRIES_TABLE=$($PSQL "INSERT INTO tries(username,n_guesses) VALUES ('$USERNAME',$GUESSES)")
