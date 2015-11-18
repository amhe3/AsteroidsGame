int numStars = (int) (Math.random()*100)+100;
boolean twinkle = false;
int screenSize = 500;
int rockNum = 5; //start with XX num of asteroids

SpaceShip ship = new SpaceShip();
Star[] stars = new Star[numStars];
//Asteroids[] rocks = new Asteroids[5]; //array
ArrayList <Asteroids> astroBelt = new ArrayList <Asteroids>(); //arrayList

public void setup() 
{
  size(screenSize, screenSize);
  background(0);
  for(int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
  /*for(int i = 0; i < rocks.length; i++) //for asteroids array
  {
    rocks[i] = new Asteroids();
  }*/
  for(int i = 0; i < rockNum; i++) //for asteroids arrayList
  {
    astroBelt.add(new Asteroids());
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i < stars.length; i++)
  {
    stars[i].show();
  }
  ship.show();
  ship.move();
  /*for(int i = 0; i < rocks.length; i++) //for asteroids array
  {
    rocks[i].show();
    rocks[i].move();
  }*/
  for(int i = 0; i < astroBelt.size(); i++) //for asteroids arrayList
  {
    Asteroids belt = astroBelt.get(i);
    belt.show();
    belt.move();
  }
  if(dist(astroBelt.get(), ship.getX(), ship.getY()) == 20) 
  {//how do we go into the arrayList and get the index num,then get the rock's getX and getY
    astroBelt.remove(i);
  }
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
  if(key == 's') //go backwards
  {
    ship.accelerate(-1);
    ship.show();
  }
  if(key == ' ') //hyperspace
  {
    ship.rotate((int) (Math.random()*361)-180); //point direction
    ship.setX((int) (Math.random()*(screenSize+1))); //position X
    ship.setY((int) (Math.random()*(screenSize+1))); //position Y
    ship.setDirectionX(0); //stop moving
    ship.setDirectionY(0); //stop moving
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
    myX = Math.random()*screenSize;
    myY = Math.random()*screenSize;
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
    myCenterX = screenSize/2;
    myCenterY = screenSize/2;
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
  public void show()
  {
    noFill();
    stroke(0, 255, 0);
    strokeWeight(5);
    //ellipse((float)myCenterX, (float)myCenterY, 10, 10); //shield
    strokeWeight(1);
    super.show();
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
    myCenterX = (int) (Math.random()*screenSize);
    myCenterY = (int) (Math.random()*screenSize);
    myColor = color(160, 160, 160);
    myDirectionX = Math.random()*10-5; //movement
    myDirectionY = Math.random()*10-5; //movement
    myPointDirection = 0;
    corners = 15;
    xCorners = new int [corners];
    yCorners = new int [corners];
    xCorners[0] = -14;
    yCorners[0] = 0;
    xCorners[1] = -14;
    yCorners[1] = 4;
    xCorners[2] = -12;
    yCorners[2] = 6;
    xCorners[3] = -10;
    yCorners[3] = 6;
    xCorners[4] = -4;
    yCorners[4] = 8;
    xCorners[5] = -2;
    yCorners[5] = 10;
    xCorners[6] = 2;
    yCorners[6] = 10;
    xCorners[7] = 4;
    yCorners[7] = 8;
    xCorners[8] = 10;
    yCorners[8] = 2;
    xCorners[9] = 12;
    yCorners[9] = -4;
    xCorners[10] = 8;
    yCorners[10] = -6;
    xCorners[11] = 4;
    yCorners[11] = -12;
    xCorners[12] = 2;
    yCorners[12] = -10;
    xCorners[13] = -8;
    yCorners[13] = -10;
    xCorners[14] = -10;
    yCorners[14] = -4;
    rotateSpeed = (int) (Math.random()*14)-7;
  }

  public void move ()
  {      
    rotate(rotateSpeed);
    super.move();
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

