 //<>//
/*
Name : Jason Grant
 Student Number: 12430732
 Game - ShootBall Game
*/

import javax.swing.*;                           // Importing lib so that I can use JOptionPane 

Blocker[] blockerArray;                        //Declaring blockerArray[] of type Blocker
Blocker[] blockerArrayOverLoad;                //Declaring blockerArrayOverLoad[] of type Blocker
Goal goal;                                     //Declaring goal of type Goal 
Ball ball;                                     //Declaring ball of type Ball
Player player;                                 //Declaring player of type Player
Shooter shooter;                               //Declaring shooter of type Shooter
Blocker blocker;                               //Declaring blocker of type Blocker

//Current game data
int livesLost = 0;                             //variable to keep track of number of lives lost in the game, declared and initialized to zero
int score = 0;                                 //variable to keep track of score in the game, declared and initialized to zero
int maxLivesPerGame = 3;                       //maximum number of lives that can be lost before the game ends. (initialised to 3 here but modified later depending on difficulty chosen)
int gameOverCount = 0;                         //Variable used as a parameter pass to player.getscores. counts number of times the game has been reset. allows the scores array to hold values as it iterates to the next space
int gameDif;                                   // variable to hold value of the game difficulty
boolean shootBall = false;                     //boolean value to shoot ball, set to false at the begininng   
int currentLevel= 1;                           //set current Level to 1


void setup()
{
  textSize(32);                                                                    //sets font size to 32
  size(1280, 720);                                                                 //sets frame 
  String[] difLevel = {"1", "2", "3"};                                             //declares an array of string objects

  gameDif = JOptionPane.showOptionDialog(null, //sets gameDif variable to the value of 'position' of the array diflevel chosen
    " Level 1, 2 or 3 (Easy, Medium, Hard) ", "Choose Difficulty", 
    JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, 
    difLevel, difLevel[0]);

  gameDif++;                                                                       //As its zero index'd, increment by one to get its correct numerical position

  if (gameDif == 1)                                                                //If statements to determine 1)what difficulty was chosen and 2)what the maxlives will be due to difficulty chosen                                                
  {
    maxLivesPerGame = gameDif*10;
  }
  if (gameDif == 2)
  {
    maxLivesPerGame = gameDif*3;
  }

  if (gameDif == 3)
  {
    maxLivesPerGame = gameDif*1;
  }

  goal = new Goal(300, (2*gameDif));                                                //Creating goal object
  ball = new Ball(50, 15);                                                          //Creating ball object
  shooter = new Shooter(ball.getBallDiameter());                                    //Creating shooter object
  blocker = new Blocker(0, height/2, 50, 4*gameDif, 0 );                            //Creating blocker object

  blockerArray = new Blocker[5+gameDif];                                            //creating array of blockers named blockerArray object - 5+gameDif - gives length of array depending on gamedif, i.e. if the game is harder, have more blockers
  blockerArrayOverLoad = new Blocker[5+gameDif];                                    //creating array of blockers named blockerArrayOverLoad object - ^^
  player = new Player(JOptionPane.showInputDialog("Enter player name (max 4 chars: "), gameDif);     //Creating player object. Player constructor accepts two parameters (String playerName, int gameDif ), determines hame and difficulty

  int i=0;                                                                          //Initialising 'i' for while loop
  while (i<blockerArray.length)                                                     //while loop
  {
    fill(100);
    blockerArray[i] = new Blocker(random(50, width-50), random(((height/2)-200), ((height/2)+200)), (random(20, 50)*gameDif), random(1, 8), 0);                                  //creates array of objects of type Blocker
    blockerArrayOverLoad[i] = new Blocker(random(50, width-50), random(((height/2)-200), ((height/2)+200)), (random(20, 50)*gameDif), random(1, 8), 0, random(50, 220));         //creates array of objects of type Blocker, overload constructor to creat new blockers of a different color
    i++;                                                                            //increment i
  } 

  println("LEVEL 1");                                                                //used in debuggin and early stages of developent
}


void draw()                                                                          
{
  fill(0, 255, 255);                                                                 //sets text to bluey/magenta color                                                              
  if (livesLost< maxLivesPerGame)                                                    //checks if the lives lost is less than the max number of lives set by difficulty
  {
    if (currentLevel ==1)
    {
      if (score>4)                                                                    //if the score goes over 4, level up
      {
        currentLevel++;
        println("LEVEL 2");
      } else
      {
        background(0);                                                                //black background
        fill(0, 255, 255);                                                      
        text("Points: "+ score, 20, height-60);                                      //prints Points/Level/Lives onscreen
        text("Lives: "+  (maxLivesPerGame - livesLost), 20, height-20);              
        text("Level: "+ currentLevel, width-200, 40);
        goal.update();                                                               //this accesses the update method in the goal class using the dot notation. updates the object goal
        goal.display();                                                              // same thinking for all dot notations
        shooter.display();
        shooter.update();
        boolean collision = scoreGoal(goal, ball);                                  //creates boolean variable called collision through the scoreGoal method that takes two parameters. Checks if object goal and ball have collided, if the have set score goal to true.
        if (shootBall == true)                                                      //if you shoot the ball then update the ball display and move it up the screen
        {
          ball.update();
          ball.display();
          ball.setYCoord(ball.getYCoord() + ball.getYSpeed());

          if (collision == true)                                                    // and if the collision is true, the signal that the ball has hit. increment score. also set shoot to false, which resets and allows user to shoot again.
          {  
            ball.hit(); 
            float varGS = goal.getGoalSize();
            score++;                                                                //increase score in the current game by 1, if the player hit the ball.
            println("Score:  "  + score);
            goal.setGoalSize(varGS);
            shootBall = false;
          } else if ((collision == false) && (ball.getYCoord()<1))                  //if you dont score and it goes wide, the reset the shoot bool to allow a new shot
          {
            shootBall = false;
          }
        } 

        if (ball.update()==true)                                                     
        {
          livesLost++;
          println("Lost " + livesLost + " lives !");
        }
      }
    }
    if (currentLevel ==2)                                                           //Level 2 is the same as level 1, except the 'goal' gets smaller after every score.
    {
      if (score>9)
      {
        currentLevel++;
        println("Level 3 !!");
      } else
      {
        background(0);
        fill(0, 255, 255);
        text("Points: "+ score, 20, height-60);
        text("Lives: "+  (maxLivesPerGame - livesLost), 20, height-20);
        text("Level: "+ currentLevel, width-200, 40);
        goal.update();
        goal.display();
        shooter.display();
        shooter.update();
        boolean collision = scoreGoal(goal, ball);
        if (shootBall == true)
        {
          ball.update();
          ball.display();
          ball.setYCoord(ball.getYCoord() + ball.getYSpeed());

          if (collision == true)
          {  
            ball.hit();   
            //int goalSize = 
            float varGS = goal.getGoalSize()- 20;                                        //reduces goalsize variable temporarill then passes it into the setGoalsize
            score++;                                                                    //increase score in the current game by 1, if the player hit the ball.
            println("Score:  "  + score);
            goal.setGoalSize(varGS);
            shootBall = false;
          } else if ((collision == false) && (ball.getYCoord()<1))
          {
            shootBall = false;
          }
        } 

        if (ball.update()==true) 
        {
          livesLost++;
          println("Lost " + livesLost + " lives !");
        }
      }
    }

    if (currentLevel ==3)                                                                  //Level three a blocker appears. Therefore there is collision detection between the ball and blocker.
    {
      if (score>14)
      {
        currentLevel++;
        println("Level 4 !!");
      } else
      {
        background(0);
        fill(0, 255, 255);
        text("Points: "+ score, 20, height-60);
        text("Lives: "+  (maxLivesPerGame - livesLost), 20, height-20);
        text("Level: "+ currentLevel, width-200, 40);
        goal.update();
        goal.display();
        shooter.display();
        shooter.update();
        blocker.display();
        blocker.update();
        boolean collision = scoreGoal(goal, ball);
        boolean collisionBlocker = collisionDetectionCircleRect(ball, blocker);
        if (shootBall == true)
        {
          ball.update();
          ball.display();
          ball.setYCoord(ball.getYCoord() + ball.getYSpeed());

          if (collisionBlocker == true)
          {
            ball.hit();
            shootBall = false;
            livesLost++;
            println("Lost " + livesLost + " lives !");
          }
          if (collision == true)
          {  
            ball.hit(); 
            float varGS = goal.getGoalSize();
            score++;                                                                      //increase score in the current game by 1, if the player hit the ball.
            println("Score:  "  + score);
            goal.setGoalSize(varGS);
            shootBall = false;
          } else if ((collision == false) && (ball.getYCoord()<1))
          {
            shootBall = false;
          }
        } 

        if (ball.update()==true) 
        {
          livesLost++;
          println("Lost " + livesLost + " lives !");
        }
      }
    }
    if (currentLevel ==4)                                                                  //Level 4 there is an array of blockers
    {
      if (score>20)
      {
        currentLevel++;
        println("Level 5!!");
      } else
      {
        background(0);
        fill(0, 255, 255);
        text("Points: "+ score, 20, height-60);
        text("Lives: "+  (maxLivesPerGame - livesLost), 20, height-20);
        text("Level: "+ currentLevel, width-200, 40);
        goal.update();
        goal.display();
        shooter.display();
        shooter.update();

        int varI = 0;                                                                        //Do while loop
        do
        {
          blockerArray[varI].display();                                              
          blockerArray[varI].update();
          varI++;
        }
        while (varI<blockerArray.length);

        //for (int i=0; i<blockerArray.length; i++)
        //{
        //  blockerArray[i].display();
        //  blockerArray[i].update();
        //}
        boolean collision = scoreGoal(goal, ball);

        if (shootBall == true)
        {

          ball.update();
          ball.display();
          ball.setYCoord(ball.getYCoord() + ball.getYSpeed());
          for ( int i = 0; i< blockerArray.length; i++)
          {
            boolean collisionBlocker2 = collisionDetectionCircleRect(ball, blockerArray[i]);  //collision detection method for collision between ball and blocker array, with two parameters, returns bool and stores it in variable collisionblocker2

            if (collisionBlocker2 == true )
            {
              ball.hit();
              shootBall = false;
              livesLost++;
              println("Lost " + livesLost + " lives !");
            }
          }
          if (collision == true)
          {  
            ball.hit(); 
            float varGS = goal.getGoalSize();
            score++;                                                                          //increase score in the current game by 1, if the player hit the ball.
            println("Score:  "  + score);
            goal.setGoalSize(varGS);
            shootBall = false;
          } else if ((collision == false) && (ball.getYCoord()<1))
          {
            shootBall = false;
          }
        } 

        if (ball.update()==true) 
        {
          livesLost++;
          println("Lost " + livesLost + " lives !");
        }
      }
    }
    if (currentLevel==5)                                                                      //Level 5 uses adds a new array of blockers. This was to show overloading methods. The overloaded blocker array takes an extra parameter to give a different color
    {
      background(0);
      fill(0, 255, 255);
      text("Points: "+ score, 20, height-60);
      text("Lives: "+  (maxLivesPerGame - livesLost), 20, height-20);
      text("Level: "+ currentLevel, width-200, 40);
      goal.update();
      goal.display();
      shooter.display();
      shooter.update();

      for (int i=0; i<blockerArray.length; i++)
      {
        blockerArray[i].display();
        blockerArray[i].update();
        blockerArrayOverLoad[i].displayArrayOverLoad();
        blockerArrayOverLoad[i].update();
      }
      boolean collision = scoreGoal(goal, ball);

      if (shootBall == true)
      {

        ball.update();
        ball.display();
        ball.setYCoord(ball.getYCoord() + ball.getYSpeed());
        for ( int i = 0; i< blockerArray.length; i++)
        {
          boolean collisionBlocker2 = collisionDetectionCircleRect(ball, blockerArray[i]);
          boolean collisionBlocker3 = collisionDetectionCircleRect(ball, blockerArrayOverLoad[i]);

          if (collisionBlocker2 == true || collisionBlocker3 == true)
          {
            ball.hit();
            shootBall = false;
            livesLost++;
            println("Lost " + livesLost + " lives !");
          }
        }
        if (collision == true)
        {  
          ball.hit(); 
          float varGS = goal.getGoalSize();
          score++;      //increase score in the current game by 1, if the player hit the ball.
          println("Score:  "  + score);
          goal.setGoalSize(varGS);
          shootBall = false;
        } else if ((collision == false) && (ball.getYCoord()<1))
        {
          shootBall = false;
        }
      } 

      if (ball.update()==true) 
      {
        livesLost++;
        println("Lost " + livesLost + " lives !");
      }
    }
  } else                                                                                                  //If your lives lost is over the max amount of lives add score to the player object and go to gameover method
  {
    player.addScore(score, gameDif); 
    println("Game Over!");
    gameOver();
  }
}
void keyPressed()                                                                                         //__Key Handler__
{

  if ( key == ' ')                                                                                        //checks if the key that was pressed was space
  {
    shootBall = true;                                                                                     // if it was it shoots
    ball.shootBall(shooter.getXCoord());                                                                  //
  }

  if (key ==CODED)                                                                                         //checks if the key pressed is a 'coded' key i.e. enter, left, right etc.
  {
    if (keyCode == LEFT)                                                                                  //left button makes the shooter go left byt reducing the x value, vice versa for right key
    {
      shooter.setXCoord(-10);                                    ///////////////////Fix setting xCoord
    }
    if (keyCode == RIGHT)
    {
      shooter.setXCoord(10);
    }
  }
}

boolean collisionDetectionCircleRect(Ball ball, Blocker blocker)                                         // http://www.jeffreythompson.org/collision-detection/circle-rect.php
{                                                                                                        //used this to research collision detection
  float testX = ball.getXCoord();                        
  float testY = ball.getYCoord();

  // which edge is closest?
  if (ball.getXCoord() < blocker.getXCoord())
  {
    testX = blocker.getXCoord();      // test left edge
  } else if (ball.getXCoord() >blocker.getXCoord()+blocker.getblockerSize()) 
  {
    testX =  blocker.getXCoord()+blocker.getblockerSize();   // right edge
  }
  if (ball.getYCoord() <  blocker.getYCoord())  
  {
    testY = blocker.getYCoord();      // top edge
  } else if (ball.getYCoord() >blocker.getYCoord()+(blocker.getblockerSize())) 
  {
    testY = blocker.getYCoord()+(blocker.getblockerSize());   // bottom edge
  }

  // get distance from closest edges
  float distX = ball.getXCoord()-testX;
  float distY = ball.getYCoord()-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the radius, collision!
  if (distance <= (ball.getBallDiameter()/2)) 
  {
    return true;
  }
  return false;
}


void gameOver()
{
  String[] options = {"Restart", "Cancel"};


  JOptionPane.showMessageDialog(null, "Player Name : " +player.getPlayerName()  +
    "\n\nPlayed on Difficulty -  "+ gameDif +
    "\n\nScore this Game: "+ player.getscores(gameOverCount) + "\n\nAverage Score: "+ player.averageScore(gameOverCount+1) +
    "\n\nHigh Score: "+ player.highestScore(), "Game Over !", JOptionPane.INFORMATION_MESSAGE);
  gameOverCount++;

  int decision = JOptionPane.showOptionDialog(null, " Restart / Cancel ", "Game Over - Try Again", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, options, options[0]);


  if (decision == 0)
  {
    currentLevel = 1;
    //player.scores[0] = 0;
    livesLost = 0;             //keeps track of the number of lives lost in the current game
    score = 0;                 //high score of the current game
    if (gameDif == 1)
    {
      maxLivesPerGame = gameDif*10;       //maximum number of lives that can be lost before the game ends
    }
    if (gameDif == 2)
    {
      maxLivesPerGame = gameDif*3;
    }

    if (gameDif == 3)
    {
      maxLivesPerGame = gameDif*1;
    }
  }
  if (decision == 1)
  {
    exit();
  }
}

                                                                           //returns true if the ball and goal overlap 
boolean scoreGoal(Goal goal, Ball ball)
{
                                                                           //magnitude of the gap between the ball and goal.  
  float circleDistanceX = abs(ball.getXCoord() - goal.getXCoord() - goal.getGoalSize()/2);
  float circleDistanceY = abs(ball.getYCoord() - goal.getYCoord() - goal.getGoalSize()*.1);

  //No Collision
  if (circleDistanceY > (ball.getBallDiameter()/2)) {
    return false;
  }

  //No Collision
  if (circleDistanceX > (goal.getGoalSize()/2 + ball.getBallDiameter()/2)) {  
    return false;
  }


  return true;                                                              //Collision detected
}
