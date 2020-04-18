class Button {
  boolean pressed, pressable, highlight, ready,showName;
  String buttonName;
  int x, y, w, h,r,g,b;
  int buttonDelay;
  int lastCount;
  //name x,y, width,height,can the button be pressed, will it highlight ,will it have the name appear when highlighted, is there a delay 
  Button(String name, int x, int y, int w, int h, boolean press, boolean high, boolean show,int pause) { 
    buttonName = name;                                                                         
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    r = 255;
    g = 255;
    b = 255;
    pressable = press;
    highlight = high;
    showName = show;
    buttonDelay = pause;
  }
  
  Button(int x, int y, int w, int h,int r, int g, int b){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.r = r;
   this.g = g;
   this.b = b;
   
   pressable = true;
   highlight = true;
   showName = false;
   buttonDelay = 20;
  }

  void draw() {
    display();
  }

  void display() {
    if (mouseOver() && highlight) {
      rectCenter(60, r,g,b, 1);
      
    } else {
      rectCenter(0, r,g,b, 1);
    }
    rect(x, y, w, h);
    if(showName == true){
       textAlign(CENTER,CENTER);
       textFont(clean,10);
       stroke(255);
       strokeWeight(1);
       fill(255);
       text(buttonName,x,y);
      }
  }

  boolean mouseOver() {
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean clicked() {
    if (mouseOver() && mousePressed && pressable  && millis()-lastCount > buttonDelay){
      lastCount = millis();
      return true;
    } else {
      return false;
    }
  }
}
