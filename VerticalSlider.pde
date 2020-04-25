class VerticalSlider {
  int sliderWidth;
  int increment;
  int x, y,output;
  Button slider;
  boolean moving;
  String sliderName;
  int sliderX, sliderY;
  VerticalSlider(int x, int y, int w, int precision) {
    this.x = x;
    this.y = y;
    sliderX = x;
    sliderY = y;
    sliderWidth = w;
    increment = precision;
    setup();
  }
 
  VerticalSlider(int tx, int ty, int tw, int precision,String name) {
    x = tx;
    y = ty;
    sliderX = x;
    sliderY = y;
    sliderWidth = tw;
    increment = precision;
    sliderName = name;
    setup();
  }
  void setup() {
    slider = new Button(x, y+sliderWidth/2, 30, 30, 255, 255, 255);
  }
  void draw() {
    bar();
    slider();
    println(mouseY > y+sliderWidth/2);
  }

  void bar() {
    stroke(100);
    strokeWeight(5);
    line(x, y-sliderWidth/2, x, y+sliderWidth/2);
  }
  void slider() {
    output = output();
    stroke(200);
    fill(200);
    textFont(clean,15);
    textAlign(LEFT,CENTER);
    text(sliderName +" value: "+ output, x-50, slider.y+50);
    slider.draw();
    if (slider.clicked()) {
      moving = true;
    } else {
      moving = false;
    }
    if (moving) {
      if (mouseY > y-sliderWidth/2 && mouseY < x+sliderWidth/2) {
        slider.y = mouseY;
      } else if (mouseY > y+sliderWidth/2) {
        println("slider should stop");
        slider.y = y+sliderWidth/2;
        moving = false;
      } else if (mouseY < y-sliderWidth/2) {
        println("slider should stop"); 
        slider.y = y-sliderWidth/2;
        moving = false;
      }
    }
  }

  int output() {
    int relativePos = slider.y-(y-sliderWidth/2);
    int output = int(map(relativePos, 0, sliderWidth, increment, 0));
    return output;
  }
  
  void setPosition(int sliderOutput){
   int relativePos = int(map(sliderOutput,0,increment,sliderWidth,0));
   slider.y = y-sliderWidth/2 + relativePos;
  }
}
