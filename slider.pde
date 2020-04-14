class Slider{
  int sliderWidth;
  int increment;
  int x,y;
  Button slider;
  boolean moving;
  int sliderX,sliderY;
 Slider(int tx, int ty,int tw,int precision){
   x = tx;
   y = ty;
   sliderX = x;
   sliderY = y;
   sliderWidth = tw;
   increment = precision;
   setup();
 }
 void setup(){
   slider = new Button(x,y,30,30,255,255,255);
 }
void draw(){
 bar();
 slider();
 println(moving);
 }
 
 void bar(){
 stroke(100);
 strokeWeight(5);
 line(x-sliderWidth/2,y,x+sliderWidth/2,y);
}
void slider(){
 slider.draw();
 if(slider.clicked()){
  moving = true;
 } else {
  moving = false; 
 }
 if (moving){
  if(mouseX > x-sliderWidth/2 && mouseX < x+sliderWidth/2){
   slider.x = mouseX; 
  } else {
   moving = false; 
  }
 }
}

}
