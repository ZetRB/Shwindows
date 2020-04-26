class TypeBar {
  int x, y, w, h;
  String name;
  boolean active, typing;
  String output = null;
  //char[] inputs;
  ArrayList<String> inputs;
  boolean pauseInput;
  boolean releasedOnce, showText;
  char oldKey;

  // x position, y position, width,height,text displayed, is text shown
  TypeBar(int x, int y, int w, int h, String text, boolean showPass) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    name = text;
    showText = showPass;
    setup();
  }

  void setup() {
    //inputs = new char[1];
    inputs = new ArrayList();
  }

  void draw() {
    if (pauseInput == false) {
      typing();
    }
    barDraw();
    enter();
  }

  void barDraw() {
    active();
    if (active) {
      rectCenter(0, 255, 2);
      rect(x, y, w, h);
      //cursor();
      displayText();
    } else if (output == "") {
      rectCenter(0, 255, 1);
      rect(x, y, w, h);
      textFont(clean, 20);
      fill(255);
      textAlign(LEFT, CENTER);
      text(name, x-w/2+10, y);
    } else {
      rectCenter(0, 255, 1);
      rect(x, y, w, h);
      displayText();
    }
  }

  void displayText() {
    textFont(clean, 20);
    fill(255);
    textAlign(LEFT, CENTER);
    output = "";
    for (int i = 0; i < inputs.size(); i++) {
      output += inputs.get(i);
    }
    if (showText == true) {
      text(output, x-w/2+10, y);
    } else {
      for (int i = 0; i < inputs.size(); i++) {
        ellipseMode(CENTER);
        noStroke();
        ellipse(x-w/2+15+15*i, y, 8, 8);
      }
    }
  }

  void active() {
    if (mousePressed) {
      if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
        active = true;
      } else {
        active = false;
      }
    }
  }


  void typing() {

    if (keyPressed && typing == false && active) {
      typing = true;     
      oldKey = key;
      if (key == BACKSPACE && inputs.size()>0) { 
        inputs.remove(inputs.size()-1);
      } else if (key == ENTER || key == RETURN) {
        pauseInput = true;
      } else if (active) {
        String c = str(key);
        inputs.add(c);
      }
    } else if (typing == true && keyPressed == false || key!=oldKey) {
      typing = false;
    }
  }


  void enter() {
    if (releasedOnce == false) {
      releasedOnce = true; // released once stops the enter key being spammed basically
    }
  }

  void reset() {
    pauseInput = false;
    output = "";
    for (int i = inputs.size()-1; i >= 0; i--) {
      inputs.remove(i);
    }
  }
}
