#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
#not include the headers
  if [[ $YEAR != year ]]
  then

  # --------------- TEAMS TABLE ---------------

  #get team_name from winner column
  TEAM_NAME_W=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")

  # if not found
    if [[ -z $TEAM_NAME_W ]]
    then
      #insert team_name 
      INSERT_TEAM_NAME_W=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_NAME_W == 'INSERT 0 1' ]]
          then
            echo Inserted into teams, $WINNER
      fi
      # get new team_name
      TEAM_NAME_W=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    fi
    


  #get team_name from opponent column
  TEAM_NAME_O=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")

  # if not found
    if [[ -z $TEAM_NAME_O ]]
    then
      #insert team_name 
      INSERT_TEAM_NAME_O=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_NAME_O == 'INSERT 0 1' ]]
          then
            echo Inserted into teams, $OPPONENT
      fi
      # get new team_name
      TEAM_NAME_O=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    fi


  # --------------- GAMES TABLE ---------------

  #get winner_id,opponent_id,
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  #insert columns
  INSERT_GAME=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$W_GOALS,$O_GOALS)")
  if [[ $INSERT_GAME == 'INSERT 0 1' ]]
          then
            echo Inserted into games, $YEAR : $ROUND : $WINNER_ID : $OPPONENT_ID : $W_GOALS : $O_GOALS
      fi

  fi
done