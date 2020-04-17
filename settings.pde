class Settings {
  int x, y, w, h, leftEdge, topEdge, rightEdge, bottomEdge;
  int menuWidth = 200;
  Button save;
  Button display;
  Button security;
  Slider r, g, b;
  Tab settingsTab;
  Settings(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    leftEdge = x-w/2;
    rightEdge = x+w/2;
    topEdge = y-h/2;
    bottomEdge = y+h/2;
    setup();
  }

  void setup() {

    r = new Slider(leftEdge+100, topEdge+100, 100, 255);
    g = new Slider(leftEdge+100, topEdge+200, 100, 255);
    b = new Slider(leftEdge+100, topEdge+300, 100, 255);
    save = new Button("Save", x+w/2-50, y+h/2-50, 30, 30, true, true, true, 100);
    settingsTab=new Tab(x, y, w, h, "Settings");
    display = new MenuButton(leftEdge+menuWidth/2,topEdge+padding*2,160,40,"Display");
    security = new MenuButton(leftEdge+menuWidth/2,topEdge+padding*3+20,160,40,"Security");
    
  }

  void draw() {
    navigationButtons();
    updateSettings();

    if (!settingsTab.minimised) {
      settingsTab.draw();
      r.draw();
      g.draw();
      b.draw();
      save.draw();
      rectCenter(r.output, g.output, b.output, 1);
      rect(leftEdge+400, topEdge+100, 30, 30);
      menu();
    } else {
    }
  }
  
  void menu(){
  stroke(255);
  strokeWeight(1);
  line(leftEdge +menuWidth,topEdge+40,leftEdge+menuWidth,bottomEdge);
  display.draw();
  security.draw();
  }
  
  void navigationButtons() {
    if (settingsTab.minimise.clicked()) {
      windows.settingsOpen = false;
    }
  }

  void updateSettings() {
    if (save.clicked()) {
      backgroundR = r.output;
      backgroundG = g.output;
      backgroundB = b.output;
      for (TableRow settings : userSettings.rows()) {
        println(currentUser.equals(settings.getString("Username")));
        if (currentUser.equals(settings.getString("Username"))) {
          println("saving settings");
          settings.setInt("BackgroundR", backgroundR);
          settings.setInt("BackgroundG", backgroundG); 
          settings.setInt("BackgroundB", backgroundB);
        }
      }
      saveTable(userSettings, "data/userSettings.csv");
    }
  }
}
