#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Clear tables
echo $($PSQL "TRUNCATE games, teams RESTART IDENTITY")

# Read CSV and insert data
tail -n +2 games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Insert winner team if not exists
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  if [[ -z $WINNER_ID ]]; then
    $PSQL "INSERT INTO teams(name) VALUES('$WINNER')"
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    echo "Inserted into teams: $WINNER"
  fi

  # Insert opponent team if not exists
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  if [[ -z $OPPONENT_ID ]]; then
    $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')"
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    echo "Inserted into teams: $OPPONENT"
  fi

  # Insert game
  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)"
  echo "Inserted game: $WINNER vs $OPPONENT ($YEAR $ROUND)"
done