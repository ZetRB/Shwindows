class Tab{
  int x,y,w,h;
  Button close, minimise;
  String tabName;
  boolean minimised;
 Tab(int x,int y, int w,  int h, String name){
   this.x =x;
   this.y = y;
   this.w = w;
   this.h = h;
   tabName = name;
   setup();
 }
 void setup(){
    close = new Button(x+w/2-20,y-h/2+20,20,20,255,0,0);
  minimise = new Button(x+w/2-60,y-h/2+20,20,20,255,255,0); 
 }
 
 void draw(){
  rectCenter(0,255,1);
  rect(x,y,w,h);
  strokeWeight(1);
  stroke(255);
  fill(255);
  line(x-w/2,y-h/2+padding,x+w/2,y-h/2+padding);
  textFont(clean,20);
  textAlign(LEFT,CENTER);
  text(tabName,x-w/2+padding/2,y-h/2+padding/2);
  close.draw();
  minimise.draw();
 }
}
