PImage img;
int num = 10;
int mx[] = new int[num];
int my[] = new int[num];
void setup(){
  size(1987,1450);
  img=loadImage("Surprising Click.jpg");
  img.resize(width,height);
  noStroke();
  background(255);
  frameRate(120);
}

void draw() {
  for (int i = 0; i < 100; i++) {
    int x = int(random(width));
    int y = int(random(height));
    
    color col = img.get(x, y);
    noStroke();
    float rotation = map(saturation(col), 0, 255, 0, TWO_PI);
    float length = map(brightness(col), 0, 255, 0, 100);
    
    fill(red(col), green(col), blue(col), 128);
    
    pushMatrix();
    translate(x,y); 
    rotate(rotation); 
    rectMode(CENTER);
    rect(0, 0, 2, length);
    popMatrix();
  }
}
void mouseDragged(){
   int which=frameCount%num;
   mx[which]=mouseX;
   my[which]=mouseY;
   for (int i=0;i<num;i++) {
    int index=(which+1+i)%num;
    color col=img.get(mx[index],my[index]);
    fill(col);
    ellipse(mx[index],my[index],i,i);
  }
}
