class Slider {
  int sliderWidth;
  int increment;
  int x, y,output;
  Button slider;
  boolean moving;
  int sliderX, sliderY;
  Slider(int tx, int ty, int tw, int precision) {
    x = tx;
    y = ty;
    sliderX = x;
    sliderY = y;
    sliderWidth = tw;
    increment = precision;
    setup();
  }
  void setup() {
    slider = new Button(x-sliderWidth/2, y, 30, 30, 255, 255, 255);
  }
  void draw() {
    bar();
    slider();
  }

  void bar() {
    stroke(100);
    strokeWeight(5);
    line(x-sliderWidth/2, y, x+sliderWidth/2, y);
  }
  void slider() {
    output = output();
    stroke(255);
    fill(255);
    textFont(clean,20);
    textAlign(LEFT,CENTER);
    text("Red value: "+ output, x-50, slider.y+50);
    slider.draw();
    if (slider.clicked()) {
      moving = true;
    } else {
      moving = false;
    }
    if (moving) {
      if (mouseX > x-sliderWidth/2 && mouseX < x+sliderWidth/2) {
        slider.x = mouseX;
      } else if (mouseX > x+sliderWidth/2) {
        slider.x = x+sliderWidth/2;
        moving = false;
      } else if (mouseX < x-sliderWidth/2) {
        slider.x = x-sliderWidth/2;
        moving = false;
      }
    }
  }

  int output() {
    int relativePos = slider.x-(x-sliderWidth/2);
    int output = int(map(relativePos, 0, sliderWidth, 0, increment));
    return output;
  }
  
  void setPosition(int sliderOutput){
   int relativePos = int(map(sliderOutput,0,increment,0,sliderWidth));
   slider.x = x-sliderWidth/2 + relativePos;
  }
}
