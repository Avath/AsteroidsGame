SpaceShip tt=new SpaceShip();
SpaceShip rr=new SpaceShip();
Star [] qq;
ArrayList <Asteroids> ww= new ArrayList <Asteroids> ();
public  boolean screenLock= true;
public void setup() 
{
  size(800, 800); 
  qq= new Star[2000];
 

  for(int i=0;i<qq.length;i++){
qq[i] =new Star();
  
}

for(int i=0;i<200;i++){
ww.add (i, new Asteroids());

}  

}
public void draw() 
{
  background(0);
  
  for(int i=0;i<qq.length;i++){


 qq[i].show();

}
  for(int i=0;i<ww.size();i++){
ww.get(i).move();
if(screenLock==true){
ww.get(i).setDirectionX(-rr.getDirectionX());
ww.get(i).setDirectionY(-rr.getDirectionY());
}


ww.get(i).show();
    
 
ww.get(i).rotate((int)(Math.random()*21)-10);
if(screenLock==false&&(tt.getX()==width)){ww.get(i).setDirectionX(-0.5);}
if(screenLock==false&&(tt.getX()==0)){ww.get(i).setDirectionX(0.5);}
if(screenLock==false&&(tt.getY()==0)){ww.get(i).setDirectionY(0.5);}
if(screenLock==false&&(tt.getY()==height)){ww.get(i).setDirectionY(-0.5);}
if(screenLock==false&&(tt.getY()!=height)&&(tt.getX()!=width)&&(tt.getX()!=0)&&(tt.getX()!=0)){ww.get(i).setDirectionX(0);
    ww.get(i).setDirectionY(0);}
}

tt.move();
  tt.rotate(0);
  tt.accelerate(0);
  
 tt.show();
 rr.rotate(0);
 rr.move(); 
  
 for(int i=0;i<ww.size();i++){
  Double distance =Math.sqrt((tt.getX()-ww.get(i).getX())*(tt.getX()-ww.get(i).getX()) + (tt.getY()-ww.get(i).getY())*(tt.getY()-ww.get(i).getY()));
if((distance<20)){

ww.remove(i);
i--;
}  


}
}

public void keyPressed() {
  if(screenLock==true){
 if( keyCode==LEFT)
  {tt.rotate(-5);
    rr.rotate(-5);}
    
if( keyCode==RIGHT) 
  {tt.rotate(5);
  rr.rotate(5);}

 
  for(int j=0;j<ww.size() ;j++){
if( keyCode==DOWN)
  {
    
    rr.accelerate(-00.1);
  }
if( keyCode==UP) 
  {
  
  rr.accelerate(00.1);
  }
if(keyCode==83)
  { 
 

    
    ww.get(j).setDirectionX(0);
    ww.get(j).setDirectionY(0);
    
  }
}   

}
/*if(screenLock==false){
 if( keyCode==LEFT)
  {tt.rotate(-5);}
  
if( keyCode==RIGHT) 
  {tt.rotate(5);}
 
if( keyCode==DOWN)
  {tt.accelerate(-0.2);}
if( keyCode==UP)
  {tt.accelerate(0.2);}
if(keyCode==70)
  { tt.setDirectionX(0);
    tt.setDirectionY(0);
    tt.setX((int)(Math.random()*801));
    tt.setY((int)(Math.random()*801));
    tt.setPointDirection((int)(Math.random()*361));
  }
 if(keyCode==83) {
tt.setDirectionX(0);
tt.setDirectionY(0);

 }

}  */

if(keyCode==89&&screenLock==true){
  screenLock=false;
} 
 if (keyCode==32&&screenLock==false){

  screenLock=true;
  tt.setDirectionX(0);
    tt.setDirectionY(0);
    tt.setPointDirection(0);
    for(int i=0;i<ww.size();i++){
  ww.get(i).setDirectionX(0);
    ww.get(i).setDirectionY(0);
  }
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
    fill((int)(Math.random()*100),(int)(Math.random()*100),(int)(Math.random()*200));
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

  public void move ()   
  {      
   
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = width; 
      myDirectionX=0;
      myDirectionY=0;   
    }    
   if (myCenterX<0)
    {     
      myCenterX = 0;  
      myDirectionX=0; 
      myDirectionY=0; 
    }    
    if(myCenterY >height)
    {    
      myCenterY = height; 
      myDirectionY=0;
       myDirectionX=0;   
    }   
    if (myCenterY < 0)
    {     
      myCenterY = 0;  
      myDirectionY=0; 
       myDirectionX=0; 
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

class Asteroids extends Floater{
 private int spin;

public Asteroids(){

myCenterX=(int)(Math.random()*801);
myCenterY=(int)(Math.random()*801);
spin=(int)((Math.random()*21)-10);
myColor= color(40,40,0);
corners=8;
int[] xS ={-9, -7, -9, 0, 4, 11, 4, -2};
int[] yS ={-8, 0, 8, 13, 3, -1, -8, -11};
myDirectionX=0;
myDirectionY=0;
myPointDirection=0;
xCorners=xS;
yCorners=yS;

}
public void move(){

rotate(spin);
super.move();


}

public void show(){
super.show();




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

