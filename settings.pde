class SettingsTab{
  int x,y,w,h;
  boolean minimised;
  Button close,minimise;
  Slider r,g,b;
 SettingsTab(int tx, int ty, int tw, int th){
   x = tx;
   y = ty;
   w = tw;
   h = th;
  setup();
 }

 void setup(){
  close = new Button(x+w/2-20,y-h/2+20,20,20,255,0,0);
  minimise = new Button(x+w/2-60,y-h/2+20,20,20,255,255,0);
  r = new Slider(x-w/2+100,y-h/2+100,100,255);
  g = new Slider(x-w/2+100,y-h/2+200,100,255);
  b = new Slider(x-w/2+100,y-h/2+300,100,255);

}
 
 void draw(){
   navigationButtons();
   if(!minimised){
  rectCenter(0,255,1);
  rect(x,y,w,h);
  close.draw();
  minimise.draw();
  r.draw();
  g.draw();
  b.draw();

   } else {
    
   }
 }
 
 void navigationButtons(){
  if(minimise.clicked()){
   windows.settingsOpen = false; 
  }
 }
}
