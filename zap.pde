 class Zap extends Floater{

public Zap(){
if(screenLock==true){
myCenterX=400;
myCenterY=400;
myPointDirection=tt.getPointDirection();
double dRadians =myPointDirection*(Math.PI/180);
for(int i=0;i<ww.size();i++){
myDirectionX=5 * Math.cos(dRadians); 
myDirectionY=5 * Math.sin(dRadians);
} 
}
  
if(screenLock==false){
myCenterX=tt.getX();
myCenterY=tt.getY();
myPointDirection=tt.getPointDirection();
double dRadians =myPointDirection*(Math.PI/180);

myDirectionX=12 * Math.cos(dRadians) + (tt.getDirectionX());
myDirectionY=12 * Math.sin(dRadians) + (tt.getDirectionY());
}


}

public void move(){
 


}
public void show(){
double dRadians = myPointDirection*(Math.PI/180);
double rrx=200*Math.cos(dRadians);
double rry=200*Math.sin(dRadians);    

 fill(225);
line ((float)myCenterX,(float)myCenterY,(float)rrx, (float)rry );



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