public class Player
{
  private String playerName;
  private int[] scores;
  //no accessor and mutator is created for the count field as it is an internal field that 
  //has a dual purpose:
  //   1. represents the next available index in the array 
  //   2. represents the number of high scores added to the array
  private int count;
  private int gameDif;

  //Constructor to create a player with a starting name and sets the size of the array
  //to the number of games in the tournament, as entered by the player.
  public Player(String playerName, int gameDif )
  {
    if (playerName.length() < 6) 
    {
      this.playerName = playerName;
    } else
    {
      this.playerName = playerName.substring(0, 6);
    }
    scores = new int[10]; // Limites the amount of restarts to 10, not sure of another way to configure this now.
    count = 0;
    this.gameDif = gameDif;
  }

  //accessors
  public String getPlayerName()
  {
    return playerName;
  }


  public int getscores(int gameOverCount)
  {
    int gameScore = scores[gameOverCount]; 
    return gameScore;
  }

  //mutator for player name
  public void setPlayerName(String playerName)
  {
    this.playerName = playerName.substring(0, 6);
  }

  //mutator for high score array
  public void setscores(int[] scores)
  {
    this.scores = scores;
  }

  //method to add a score at the next available location in the scores array   
  public void addScore(int score, int gameDif)
  {
    if (score >= 0) {
      scores[count] = score*gameDif;
      count++;
    }
  } 

  public int gameDifficulty (int gameDif)
  {
    int maxLivesPerGame = 0;
    if (gameDif == 1)                                                                //                                                
    {
      maxLivesPerGame = gameDif*10;                                                  //maximum number of lives that can be lost before the game ends
    }
    if (gameDif == 2)
    {
      maxLivesPerGame = gameDif*3;
    }

    if (gameDif == 3)
    {
      maxLivesPerGame = gameDif*1;
    }

    return maxLivesPerGame;
  }

  //method returns the highest score stored in the scores array   
  //if there is only one element in the scores array, this value is returned as the highest
  public int highestScore()
  {
    int highestScore = scores[0];
    for (int i = 0; i < count; i++) 
    {
      if (scores[i] > highestScore) 
      {
        highestScore = scores[i];
      }
    }   
    return highestScore;
  }

  public float averageScore(int gameOverCount)
  {
    float totalScore =0;
    float averageScore = 0;
    for (int i = 0; i < gameOverCount; i++) 
    {
      totalScore += scores[i];

      averageScore = totalScore/gameOverCount;
    }

    return averageScore;
  }
}
