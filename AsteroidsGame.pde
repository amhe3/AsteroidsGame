int numStars = (int) (Math.random()*100)+100;
boolean twinkle = false;

SpaceShip ship = new SpaceShip();
Star[] stars = new Star[numStars];
Asteroids[] rocks = new Asteroids[5];

public void setup() 
{
  size(400, 400);
  background(0);
  for(int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
  for(int i = 0; i < rocks.length; i++)
  {
    rocks[i] = new Asteroids();
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i < stars.length; i++)
  {
    stars[i].show();
  }
  for(int i = 0; i < rocks.length; i++)
  {
    rocks[i].show();
    rocks[i].move();
  }
  ship.show();
  ship.move();
}
public void keyTyped()
{
  if(key == 'a') //rotate left
  {
    ship.rotate(-7);
    ship.show();
  }
  if(key == 'd') //rotate right
  {
    ship.rotate(7);
    ship.show();
  }
  if(key == 'w') //accelerate
  {
    ship.accelerate(1);
    ship.show();
  }
  if(key == ' ')
  {
    ship.accelerate(-1);
    ship.show();
  }
  if(key == 's') //hyperspace
  {
    ship.rotate((int) (Math.random()*361)-180);
    ship.setX((int) (Math.random()*401));
    ship.setY((int) (Math.random()*401));
    ship.setDirectionX(0);
    ship.setDirectionY(0);
  }
  if(key == 't'&& twinkle == false)
  {
    twinkle = true;
  } else
  if(key == 't' && twinkle == true)
  {
    twinkle = false;
  }
}

class Star
{
  private double myX, myY;
  private int size, colors1, colors2, colors3, myFillColor;
  public Star()
  {
    myX = Math.random()*400;
    myY = Math.random()*400;
    size = (int) (Math.random()*6)+1;
    colors1 = (int)(Math.random()*225);
    colors2 = (int)(Math.random()*225);
    colors3 = (int)(Math.random()*225);
    myFillColor = color(colors1, colors2, colors3); 
  }
  public void show()
  {
    noStroke();
    fill(myFillColor);
    if(twinkle == true)
    {
      myFillColor = color((int)(Math.random()*225), (int)(Math.random()*225), (int)(Math.random()*225));
    } else
      myFillColor = color(colors1, colors2, colors3); 
    ellipse((float)myX, (float)myY, (float)size, (float)size);
  } 
  public void setFillColor(int num){myFillColor = num;}
}

class SpaceShip extends Floater  
{  
  public SpaceShip()
  {
    myCenterX = 200;
    myCenterY = 200;
    myColor = color(255, 255, 255);
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    corners = 4;
    xCorners = new int [corners];
    yCorners = new int [corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3] = 0;
  }
  public void setX(int x){myCenterX = x;} 
  public int getX(){return (int) myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int) myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;}
}

class Asteroids extends Floater
{
  private int rotateSpeed;
  public Asteroids()
  {
    myCenterX = (int) (Math.random()*400);
    myCenterY = (int) (Math.random()*400);
    myColor = color(255, 255, 255);
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    corners = 4;
    xCorners = new int [corners];
    yCorners = new int [corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3] = 0;

    rotateSpeed = (int) (Math.random()*10)-5;
  }
  public void move()
  {
    myPointDirection += rotateSpeed; 
  }

  public void setX(int x){myCenterX = x;} 
  public int getX(){return (int) myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int) myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;}
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x); 
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

