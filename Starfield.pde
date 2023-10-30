class Particle{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  Particle()
  {
   myX = myY =250;
   mySpeed = (Math.random()*6);
   myAngle = (int)(Math.random()*1000);
   myColor = (int)(Math.random()*255);
  }
  void move()
  {
      myX = myX + Math.cos(myAngle)*mySpeed;
      myY = myY + Math.sin(myAngle)*mySpeed;
  }
  void show()
  {
    fill(myColor);
    ellipse((float)myX, (float)myY, 4, 4);
  }
}

class Oddball extends Particle{
  Oddball(int x, int y){
    myX = x;
    myY = y;
  }
  void show(){
    fill(#A7A6A6);
    ellipse((float)myX, (float)myY, 30, 20);
    fill(0,255,0);
    ellipse((float)myX, (float)myY-7, 15, 12);
  }
  void move(){
    myX = myX + (int)(Math.random()*8-4);
    myY = myY + (int)(Math.random()*8-4);
  }
}

Particle[] cool = new Particle[5000];
int randomNum = cool.length-1 - (int)(Math.random()*10+10);

void setup(){
  noStroke();
  frameRate(1000);
  for(int i = 0; i < cool.length; i++){
    cool[i] = new Particle();
  }
  for(int i = randomNum; i < cool.length; i++)
    cool[i] = new Oddball((int)(Math.random()*250+100),(int)(Math.random()*250+100));
  background(0);
  size(500,500);
}

void draw(){
  background(0);
  for(int i = 0; i < cool.length; i++){
    cool[i].show();
    cool[i].move();
    }
  for(int i = randomNum; i < cool.length; i++){
    cool[i].show();
    cool[i].move();
  }
}

void mousePressed(){
  for(int i = 0; i < cool.length; i++){
    cool[i].myX = 250;
    cool[i].myY = 250;
  } 
}
