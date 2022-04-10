public class Blocker
{

  private float xCoord;
  private float yCoord;
  private float blockerSize;
  private float xSpeed;
  private float ySpeed;
  private float blockerColor;


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


  void setBlockerXYCoord(float xCoord, float yCoord)
  {
    this.xCoord = xCoord;
    this.yCoord = yCoord;
  }

  void setBlockerSpeed(float xSpeed, float ySpeed)
  {
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
  }
  void setBlockerColor(float  blockerColor)
  {
    this.blockerColor =  blockerColor;
  }
  void setBlockerSize(float blockerSize)
  {
    this.blockerSize = blockerSize;
  }
  //void setXSpeedIncrease(float xSpeedIncrease)
  //{
  //  this.xSpeed = xSpeed + xSpeedIncrease ;
  //}

  public float getXCoord() {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  public float getblockerSize() {
    return blockerSize;
  }
  public float getXSpeed() {
    return xSpeed;
  }
  public float getYSpeed() {
    return ySpeed;
  }

  //void resetBlocker()
  //{

  //}
  public void display() {
    fill(255, 0, 0);
    noStroke();
    rect(xCoord, yCoord, blockerSize, blockerSize);
  } 
  public void displayArrayOverLoad() {
    fill(this.blockerColor-10, this.blockerColor+50, this.blockerColor-5);
    noStroke();
    rect(xCoord, yCoord, blockerSize, blockerSize);
  } 

  public void hit() {
    ball.resetBall();
  }

  public void update() {

    ///update Goal Coords
    xCoord = xCoord+xSpeed;

    ///put in if ball goes "wide" restart

    //If ball hits the left edge of the display window, change direction of xCoord
    if ((xCoord > (width-blockerSize))||(xCoord < 1)) {
      xSpeed = xSpeed * -1;
    }
  }
}
