class Tab{
  int x,y,w,h;
  Button close, minimise;
  String tabName;
  boolean minimised;
 Tab(int tx,int ty, int tw,  int th, String name){
   x =tx;
   y = ty;
   w = tw;
   h = th;
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
  line(x-w/2,y-h/2+40,x+w/2,y-h/2+40);
  textFont(clean,20);
  textAlign(LEFT,CENTER);
  text(tabName,x-w/2+20,y-h/2+20);
  close.draw();
  minimise.draw();
 }
}
