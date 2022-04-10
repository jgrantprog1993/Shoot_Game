public class Goal
{
  private float xCoord;
  private float yCoord;
  private float goalSpeed;
  private float goalSize;

  public Goal(float goalSize, float goalSpeed) {

    setGoalSize(goalSize);
    setGoalSpeed(goalSpeed);
    //resetGoal();
  }

  public void update() {

    //update Goal Coords
    xCoord = xCoord+goalSpeed;

    ///put in if ball goes "wide" restart

    //If ball hits the left edge of the display window, change direction of xCoord
    if ((xCoord > (width-goalSize))||(xCoord < 1)) {
      goalSpeed = goalSpeed * -1;
    }
  }

  public void display() {

    fill(0, 255, 0);
    noStroke();
    rect(xCoord, yCoord, goalSize, (goalSize*.1));
  }


  public float getXCoord() {

    return xCoord;
  }

  public float getYCoord() {

    return yCoord;
  }

  public float getGoalSpeed() {

    return goalSpeed;
  }

  public float getGoalSize() {

    return goalSize;
  }

  public void setGoalSpeed(float goalSpeed) {

    if ((goalSpeed>1)&& (goalSpeed<5)) {

      this.goalSpeed = goalSpeed;
    } else {
      this.goalSpeed = 3;
    }
  }

  public void setGoalSize(float goalSize) {

    if ((goalSize>199.0)&&(goalSize<301.0)) {
      this.goalSize = goalSize;
    } else {
      this.goalSize = 200.0;
    }
  }

  //private void resetGoal(){

  //  xCoord = 0;
  //  yCoord = 10;
  //  goalSpeed = 10;
  //  goalSize = 10;

  //}
}
