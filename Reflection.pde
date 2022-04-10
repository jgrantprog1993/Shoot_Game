/* Reflection
 
 Name : Jason Grant
 
 Student Number: 12430732
 
 Link to Video on Youtube: https://youtu.be/Gmdo97OzwFE
 
 
 
 Part A - Mark (11 /11)
-----------------------------

Includsion of completed:
- Readme             (1)
- Reflection        (5)
- Video            (5)

My Opinnion: 11
 
 
 
 Part B - Mark (4 /4)
-----------------------------

Comments, 
- indentation, 
- naming, 
- structure of code.

My Opinnion: 4

 
 
 Part C - Use of Standard programming control constructs (if, loop, nesting) (5/5)
 -----------------------------
 If
 -Main Line 41 - 53
 
 While Loop
 -Main Line 65 - 71
 
 do While Loop
 -Main Line 247 - 254
 
 For
 -Main Line 314 - 320
 
 Nesting
 -If & else if: Main Line 83 - 126
 -for & if: Main Line 269 - 280
 if/for/else if: Main Line 324 - 354
 
 Part D - Working game with inclusion of bespoke methods in
 the main sketch (handling key events, collision detection/avoidance). (10/10)
 -----------------------------
 
 KeyHandler:
 Main Line 369 - 389
 
 
 Collision detection methods : 
 ball_Goal
 -Main Line 267 - 285 (method)

 ball_blocker
 -Main Line 391 - 423
 
 Scoring
 -Main starts with the score being set to zero, if the ball hits the goal the score is incremented
 -If the increments get above 4, goes to level 2 and so on.
 -Main Line 364 player.addScore(score, gameDif); passes 2 parameters to player object.
 
 Lives
 -Max lives per game is determined by the difficulty chosen.
 -Once you hit blocker or goes wide lose life.
 
 New Game
 There is a JOptionPane that asks does the user want to restart or cancel.
 Main Line 426 - 464
  - Resets values.  currentLevel, livesLost,    score        
 
 Highscore
 -If the user restarts, the 'gameover count increments, and shifts down the scores array and stores the score.
 -set scores to player object Main Line 364  player.addScore(score, gameDif); 
 -Main Line 434 player.highestScore()
 
 
 Part E1 -  With appropriate fields, constructors, getters, setters, overloaded constructor, access modifiers.
 This is referring to the additional tabs defining classes. (10/10)
 -----------------------------
 -5 User defined classes (Ball, Blocker, Goal, Player, Shooter)
   All showing fields, constructors, getters, setters, access modifiers
   
   Showing Fields
   -Blocker Line 4 - 9
   
   Showing Access modifiers
   -Main Line 16 Declaring blocker of type Blocker
   -Main Line 58 Creating blocker object
   -Main Line 400 'blocker.getblockerSize()', As the attributes are set to private in the Blocker class, the way to access and modify them is through the access modifier
   
   Example of setters
   -Bloker Line 29 - 47
   
    Example of getters
   -Bloker Line 53 - 69
   
   Example of overloaded Constructor
   -Blocker Line 12 - 26 Constructor
   -Main Line 60-61 Initialising
       -Forcing Overloading putting in an extra parameter. This shows the new array in a different color in Level 5.
      
      public Blocker(float xCoord, float yCoord, float blockerSize, float xSpeed, float ySpeed )
  {
    setBlockerXYCoord(xCoord, yCoord);
    setBlockerSpeed(xSpeed, ySpeed);
    setBlockerSize(blockerSize);
    //resetBlocker();
  }

  public Blocker(float xCoord, float yCoord, float blockerSize, float xSpeed, float ySpeed, float blockerColor)
  {
    setBlockerXYCoord(xCoord, yCoord);
    setBlockerSpeed(xSpeed, ySpeed);
    setBlockerSize(blockerSize);
    setBlockerColor(blockerColor);
  }
   
 
 
 Part E2 - Class bespoke methods (no return value, return value, parameters, overloading)
 THESE EXAMPLES MUST ALL BE DIFFERENT TO THOSE PROVIDED IN E1  (8/10)
 -----------------------------
 Class - Ball
 
 Bespoke Methods
 No return value
 -Ball Line Line 75 - 77 hit()
 
 Return Value
 -Ball Line 84 - 96 update() returns boolean lifeLost
 
 Parameters
 -Ball Line Line 42 - 45 shootBall(float xCoord)
   
 Overloading
 -Ball Line 23 - 35 setBallSize(int ballDiameter) && setBallSize()
 
 
 Part E3 - The user-defined class(es) are used in an appropriate manner (multiple declarations of user
 defined classes, getters/setters, default/overloaded constructors)
 THIS IS HOW YOU HAVE USED THE CLASSES THROUGH USE OF THE OBJECT VARIABLES CREATED IN THE MAIN PROGRAM. 
 IT SHOLD IT SHOLD RESPECT ENCAPSULATION RULES (10/10)
 -----------------------------
 5 Classes (Ball, Blocker, Goal, Player, Reflection)
 
 Class Shooter
 Declaration: Main Line 15
 Initialisation: MAin Line 57
 Getter: Main Line 375
 Setter: Main Line 282
 Overloading: Main Line 68,69
 
 Ordinarry Variable -  blocker
 2 x Arrays - blockerArray & blockerArrayOverLoad
 
 Part F1 -  Mark (18/20)
 Use of a data structure(s) to store information
 -----------------------------
 
 
 - Use of an array to store blockers - blockerArray and blockerArrayOverload
 Line 60 - 71
 - The size of the array is defined by the user input i.e. gameDif (Game difficulty) the harder you chose the more blockers in the game.
 
 
 Array that has a user input values
 - class player, Line 57 - 58.
    array scores, the indexes of this array are cycled through  
    and the score of the game is inputted into the current index, then the index is incremented.
 
 
 
 
 Part F2 - Calculations performed on the information stored
 (e.g. min, max, average) (20/20)
 ______________________________
 
 Example .length Main Line 65, 254, 269.. and so on.
 
 Example calculation i.e. avalue of an array is updated
 Player Line 84 - 95 
 Initially sets the first score to the highest score, then it loops through the array. if any of the elements of the array are greater than the highest score, update the varibale to hold the new highest score.
 
 Average score
 Player Line 97 - 111.
 used in main 433.

 I have checked the constraints, and I am not breaking any constraints.
 
 */

/*
Total Grade = 
 Part A - Mark 11
 Part B - Mark 4
 Part C - Mark 5
 Part D - Mark 10
 Part E - Mark 28
 Part F - Mark 38
 
 
 Total (96/100)
 Difficulty rating 1
 
 Overall score 96%
 
 
 */
