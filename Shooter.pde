public class Shooter
{

  private float xCoord;
  private float yCoord;
  //private int xSpeed;
  private int shooterSize;


  ///Constructor
  public Shooter(int shooterSize)
  {
    setShooterSize(shooterSize);
    xCoord = width; 
    yCoord = height - shooterSize;
  }

  public void update()
  {
    //xCoord = mouseX - shooterSize/2;

    if (xCoord < shooterSize)
    {
      xCoord = shooterSize;
    }
    if (xCoord > (width - shooterSize))
    {
      xCoord = width - shooterSize;
    }
  }

  public void setXCoord(float xCoord )
  {
    this.xCoord += xCoord;
  }
   public void setXCoord()
  {
    this.xCoord += 5;
  }
  public void setYCoord(float yCoord)
  {
    this.yCoord += yCoord;
  }
  public void setShooterSize(int shooterSize)
  {
    this.shooterSize = shooterSize;
  }


  // Draw paddle to the display window
  public void display()
  {
    fill(#FFA500);
    noStroke();
    ellipse(xCoord, yCoord, shooterSize, shooterSize);
  }

  //getter methods
  public float getXCoord()
  {
    return xCoord;
  }

  public float getYCoord()
  {
    return yCoord;
  }

  public int getShooterSize()
  {
    return shooterSize;
  }
}
