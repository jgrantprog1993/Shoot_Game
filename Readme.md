/*

 Brief description of the animation achieved:
 
 The Game is based on the old 'basket ball style games. 
 Where the net moves across the screen and the user tries to score as its moving. As the levels get harder blockers are introduced.
 
 Game - ShootGame
 The user has to hit the target with the ball (1 at a time).
 If the user hits the target, the score is increased. If the user misses or hits a target, they lose a life.
 
 The user can specify the level of difficulty at the beginning of the game (1, 2, 3).
 This changes 
 - No. of blockers in the array.
 - Max no. lives
 - Speed of the goal moving
 - Size of the blockers
 - Multiplies the score at the end of the game to compensate for the difficulty of the game.
 
 Then the user can enter their name max of 6 chars (taken from PONG)
 
 Then the user can move the shooter left and right with the keyboard arrows and shoot to try and hit the goal with the SPACE bar.
 
 Every score increases the in game score by 1, at the end the score is mulitplied by the difficulty factor.
 
 Once the user runs out of lives they can restart or exit.
 Restart allws the user to try and beat their highscore, as the highscore is retained.
 If they cancel, the game is closed.
 
 Known bugs/problems:
 - Shooter and goal travel over the score/lives. blocking out the text.
 - Shooter can only shoot 1 ball at a time.
 - Have to make the screen 'active' before you can move the shooter with the arrows.
 - Functionality doesnt rogress or get harder after level 5, and 5 is the highest level.
 - Can't move and shoot at the same time.
 
 
 Any sources referred to during the development of the assignment.
 
 JOptionPane
 - https://mkyong.com/swing/java-swing-joptionpane-showoptiondialog-example/
 
 circle rect collision
 
 - https://developer.mozilla.org/en-US/docs/Games/Techniques/2D_collision_detection
 - https://happycoding.io/tutorials/processing/collision-detection
 - http://www.jeffreythompson.org/collision-detection/circle-rect.php
 
 Special characters CODED
 
 - https://processing.org/reference/keyPressed_.html
 - https://processing.org/reference/keyCode.html
 
 Text
 - https://processing.org/reference/textSize_.html
 
 */
