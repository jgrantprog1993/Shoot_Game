public class Ball
{
  private float xCoord;
  private float yCoord;
  private int ballDiameter;
  private int xSpeed;
  private int ySpeed;

  ////Constructor
  public Ball(int ballDiameter, int ySpeed)
  {

    setBallSize(ballDiameter);
    setBallSpeed(ySpeed);
    resetBall();
  }

  public void setBallXCoord(float xCoord)
  {
    this.xCoord = xCoord;
  }

  public void setBallSize(int ballDiameter)
  {
    if ((ballDiameter>50)&&(ballDiameter<100)) {
      this.ballDiameter = ballDiameter;
    } else {
      this.ballDiameter = 70;
    }
  }
  
   public void setBallSize()
  {
      this.ballDiameter = 70;
  }

  public void setBallSpeed(int ySpeed)
  {
    if ((ySpeed>10)&&(ySpeed<40)) {
      this.ySpeed = ySpeed*(-1);
    } else {
      this.xSpeed = -20;
    }
  }
  
  
  public float shootBall(float xCoord)
  {
    return this.xCoord = xCoord;
  }

  public void setYCoord(float yCoord)
  {
    this.yCoord = yCoord;
  }

  public float getXCoord() {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  public int getBallDiameter() {
    return ballDiameter;
  }
  public int getXSpeed() {
    return xSpeed;
  }
  public int getYSpeed() {
    return ySpeed;
  }

  public void display() {
    fill(255);
    noStroke();
    ellipse(xCoord, yCoord, ballDiameter, ballDiameter);
  } 

  public void hit() {
    resetBall();
  }

  public void resetBall() {
    xCoord = mouseX;
    yCoord = 600;
  }

  public boolean update() {
    boolean lifeLost = false;

    //update ball coordinates

    //reset position if ball leaves the screen
    if (yCoord < 1) {
      resetBall();
      lifeLost = true;
    }

    return lifeLost;
  }
}
