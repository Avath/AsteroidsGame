SpaceShip tt=new SpaceShip();
SpaceShip rr=new SpaceShip();
Star [] qq;
ArrayList <Asteroids> ww= new ArrayList <Asteroids> ();
ArrayList <Bullet> speed =new ArrayList <Bullet> (); 

 
public double distance=0;
public double distance2=20;   
public Boolean pls=false;  
public Boolean reignover =false; 
public int e=0;
public int rre;
public int rrr;
public int rrt;
public int rru;
public int shieldCooldownTimer=0;
public Boolean shield=false;  
public Boolean atspBuff=false;   
public int atspCooldown=0;
public int atspBuffTimer=0;  
public int shieldTimer=0;
public  boolean screenLock= false;
public int counter=0;
public void setup() 
{
  size(800, 800); 
  qq= new Star[2000];
 

  for(int i=0;i<qq.length;i++){
qq[i] =new Star();
  
}

for(int i=0;i<80;i++){
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


if(ww.get(i).getX()>400){
rre=-1;
}
if(ww.get(i).getX()<400){
rre=1;
}
if(ww.get(i).getY()>400){
rrr=-1;
} 
if(ww.get(i).getY()<400){
rrr=1;
}
if(screenLock==true){
  
ww.get(i).setDirectionX(-rr.getDirectionX()+rre);
ww.get(i).setDirectionY(-rr.getDirectionY()+rrr);

}

if(ww.get(i).getX()>tt.getX()){
rru=3;
}
if(ww.get(i).getX()<tt.getX()){
rru=-3;
}
if(ww.get(i).getX()>tt.getY()){
rrt=3;
}
if(ww.get(i).getX()>tt.getY()){ 
rrt=-3;
}
if(screenLock==false){
ww.get(i).setDirectionY(rrt);
ww.get(i).setDirectionX(rru);


}



ww.get(i).show();
    
 
ww.get(i).rotate((int)(Math.random()*21)-10);
if(screenLock==false&&(tt.getX()==width)){ww.get(i).setDirectionX(-0.5);}
if(screenLock==false&&(tt.getX()==0)){ww.get(i).setDirectionX(0.5);}
if(screenLock==false&&(tt.getY()==height-height)){ww.get(i).setDirectionY(0.5);}
if(screenLock==false&&(tt.getY()==height)){ww.get(i).setDirectionY(-0.5);}
if(screenLock==false&&(tt.getY()!=height)&&(tt.getX()!=width)&&(tt.getX()!=0)&&(tt.getX()!=0)){ww.get(i).setDirectionX(0);
    ww.get(i).setDirectionY(0);}
}

tt.move();
  tt.rotate(0);
  tt.accelerate(0);
  
 tt.show();
 rr.rotate(0);
 rr.move2(); 
  for(int i=0;i<speed.size();i++){

    speed.get(i).move();

    speed.get(i).show();
  }
  
 for(int i=0;i<ww.size();i++){
 for(int j=0;j<speed.size();j++){
   distance2 = Math.sqrt((tt.getX()-ww.get(i).getX())*(tt.getX()-ww.get(i).getX()) + (tt.getY()-ww.get(i).getY())*(tt.getY()-ww.get(i).getY()));

   distance =Math.sqrt((speed.get(j).getX()-ww.get(i).getX())*(speed.get(j).getX()-ww.get(i).getX()) + (speed.get(j).getY()-ww.get(i).getY())*(speed.get(j).getY()-ww.get(i).getY()));
if((distance<20)){

ww.remove(i);
speed.remove(j);  
i--;
j--;
break;
}  

  



} 
}


if(distance2<20&&shield==false){
  reignover=true;
}


if(distance2<20&&shield==true){
  shieldTimer=0; 
}

 if(e!=0){
  e--;
}

if(shield==true){
fill(225,0,0,100);
ellipse(tt.getX(),tt.getY(), 30, 30 );
 shieldCooldownTimer=540;
 shieldTimer--;
}


if(shieldTimer==0){
  shield=false;

  
}
if(shieldCooldownTimer!=0){
  shieldCooldownTimer--;
}

if(atspBuff==true){
  atspCooldown=540;
  atspBuffTimer--;
  
}
if(atspBuffTimer==0){
  atspBuff=false;
}
if(atspCooldown!=0){
  atspCooldown--;
}


if(reignover==true){

  background(225,0,0);
  stroke(20);
  textSize(72);
  text("GAME OVER", 100,400);
}
}

public void keyPressed() {
  if(screenLock==true){
 if( keyCode==LEFT)
  {tt.rotate(-11);
    rr.rotate(-11);}
    
if( keyCode==RIGHT) 
  {tt.rotate(11);
  rr.rotate(11);}

 
  for(int j=0;j<ww.size() ;j++){
if( keyCode==DOWN)
  {
    
    rr.accelerate(-00.001);
  }
if( keyCode==UP) 
  {
  
  rr.accelerate(00.001);
  }
if(keyCode==83)
  { 
 

    
    ww.get(j).setDirectionX(0);
    ww.get(j).setDirectionY(0);
    rr.setDirectionX(0);
    rr.setDirectionY(0);
  }
}   

}
if(screenLock==false){
 if( keyCode==LEFT)
  {tt.rotate(-11);}
  
if( keyCode==RIGHT) 
  {tt.rotate(11);}
 
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

}  

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

if(keyCode==81&&e==0){
 
speed.add (0, new Bullet(tt));
if(atspBuff==false){
e=31;
}
 
}
  if(keyCode==69&&shieldCooldownTimer==0 ){
 shield=true;
shieldTimer=120;
  } 
   
 
 if(keyCode==87&&atspCooldown==0){
  atspBuff=true;
 atspBuffTimer=300;
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
  public void move2 ()   
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

