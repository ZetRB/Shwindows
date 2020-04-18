class MenuButton extends Button {
  boolean active = false;
  MenuButton (int x, int y, int w, int h, String name) {
    super(name, x, y, w, h, true, true, false, 100);
    //name x,y, width,height,can the button be pressed, will it highlight ,will it have the name appear when highlighted, is there a delay
  }
  @ Override 
    void display() {
    if (mouseOver() && highlight || active) {
      rectCenter(60, r, g, b, 1);
    } else {
      rectCenter(0, r, g, b, 1);
    }
    rect(x, y, w, h);
    textAlign(CENTER, CENTER);
    textFont(clean, 16);
    stroke(255);
    strokeWeight(1);
    fill(255);
    text(buttonName, x, y);
  }

}
