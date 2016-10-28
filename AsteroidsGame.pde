SpaceShip tt=new SpaceShip();
Star [] qq;
boolean screenLock= false;
public void setup() 
{
  size(800, 800); 
  qq= new Star[2000];

  for(int i=0;i<qq.length;i++){
qq[i] =new Star();

}

}
public void draw() 
{
  background(0);
  tt.move();
  tt.accelerate(0);
  tt. rotate(0);
 tt.show();
  for(int i=0;i<qq.length;i++){

qq[i].move();
qq[i].accelerate(0);
 qq[i].setPointDirection((int)tt.getPointDirection());
 qq[i].show();

if(screenLock==false&&(tt.getX()==width)){qq[i].setDirectionX(-0.5);}
if(screenLock==false&&(tt.getX()==0)){qq[i].setDirectionX(0.5);}
if(screenLock==false&&(tt.getY()==0)){qq[i].setDirectionY(0.5);}
if(screenLock==false&&(tt.getY()==height)){qq[i].setDirectionY(-0.5);}
if(screenLock==false&&(tt.getY()!=height)&&(tt.getX()!=width)&&(tt.getX()!=0)&&(tt.getX()!=0)){qq[i].setDirectionX(0);
    qq[i].setDirectionY(0);}
}
  

}

public void keyPressed() {
  if(screenLock==true){
 if( keyCode==LEFT)
  {tt.rotate(-5);}
    
if( keyCode==RIGHT) 
  {tt.rotate(5);}
 for(int i=0;i<qq.length;i++){
if( keyCode==DOWN)
  {qq[i].accelerate(0.5);}
if( keyCode==UP)
  {qq[i].accelerate(-0.5);}
if(keyCode==70)
  { 


    qq[i].setDirectionX(0);
    qq[i].setDirectionY(0);
    
  }
}
}
if(screenLock==false){
 if( keyCode==LEFT)
  {tt.rotate(-5);}
  
if( keyCode==RIGHT) 
  {tt.rotate(5);}
 
if( keyCode==DOWN)
  {tt.accelerate(-0.5);}
if( keyCode==UP)
  {tt.accelerate(0.5);}
if(keyCode==70)
  { tt.setDirectionX(0);
    tt.setDirectionY(0);
    tt.setX((int)(Math.random()*801));
    tt.setY((int)(Math.random()*801));
  }
 if(keyCode==83) {
tt.setDirectionX(0);
tt.setDirectionY(0);

 }

}

if(keyCode==84&&screenLock==true){
  screenLock=false;
} 
 if (keyCode==32&&screenLock==false){

  screenLock=true;
 
tt.setX(400);
tt.setY(400);

}


} 
 

class Star extends Floater
{

  public Star(){

    myCenterX=(Math.random()*801);
    myCenterY=(Math.random()*801);
     myDirectionX=0;
     myDirectionY=0;
  
  }

  

  public void show(){
   
    noStroke();
    fill((int)(Math.random()*226),(int)(Math.random()*226),(int)(Math.random()*226));
    ellipse((float)myCenterX,(float)myCenterY,3,3);



  }

  public void setX(int x)  {myCenterX=x;}
   public int getX()   {return (int)myCenterX;}
   public void setY(int y)  {myCenterY=y;}   
   public int getY()   {return (int)myCenterY ;}
   public void setDirectionX(double x) {myDirectionX=x; }  
   public double getDirectionX()   {return myDirectionX;}
   public void setDirectionY(double y) {myDirectionY=y; }  
   public double getDirectionY()   {return myDirectionY;} 
   public void setPointDirection(int degrees)  {myPointDirection=degrees;} 
   public double getPointDirection() {return myPointDirection;}
}

class SpaceShip extends Floater  
{    

  public SpaceShip(){

    corners=6;
      int[] xS ={-9, 16, -9, -8, -2, -8};
      int[] yS ={-8, 0, 8, 4, 0, -4};
      xCorners=xS;
      yCorners=yS;
      myColor=color (225,225,225);
      myCenterX=400;
      myCenterY=400;
      myDirectionX=0;
      myDirectionY=0;
      myPointDirection=0;
  
  }

  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = width;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = 0;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = height;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = 0;    
    }   
  }   
 



   public void setX(int x)  {myCenterX=x;}
   public int getX()   {return (int)myCenterX;}
   public void setY(int y)  {myCenterY=y;}   
   public int getY()   {return (int)myCenterY ;}
   public void setDirectionX(double x) {myDirectionX=x; }  
   public double getDirectionX()   {return myDirectionX;}
   public void setDirectionY(double y) {myDirectionY=y; }  
   public double getDirectionY()   {return myDirectionY;} 
   public void setPointDirection(int degrees)  {myPointDirection=degrees;} 
   public double getPointDirection() {return myPointDirection;}
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

