class Settings {
  int x, y, w, h, leftEdge, topEdge, rightEdge, bottomEdge;
  int menuWidth = 200;
  int spacing;
  boolean displaySettings, securitySettings;
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
    spacing = (w-menuWidth-padding)/3;
    r = new Slider(x+menuWidth/2-spacing, topEdge+100, 100, 255, "Red");
    g = new Slider(x+menuWidth/2, topEdge+100, 100, 255, "Green");
    b = new Slider(x+menuWidth/2+spacing, topEdge+100, 100, 255, "Blue");
    save = new Button("Save", x+w/2-50, y+h/2-50, 30, 30, true, true, true, 100);
    settingsTab=new Tab(x, y, w, h, "Settings");
    display = new MenuButton(leftEdge+menuWidth/2, topEdge+padding*2, 160, 40, "Display");
    security = new MenuButton(leftEdge+menuWidth/2, topEdge+padding*3+20, 160, 40, "Security");
  }

  void draw() {
    navigationButtons();
    updateSettings();

    if (!settingsTab.minimised) {
      settingsTab.draw();
      save.draw();
      menu();
      displaySettings(displaySettings);
      securitySettings(securitySettings);
    } else {
    }
  }

  void menu() {
    stroke(255);
    strokeWeight(1);
    line(leftEdge +menuWidth, topEdge+40, leftEdge+menuWidth, bottomEdge);
    display.draw();
    security.draw();
    if (display.clicked()) {
      displaySettings = true;
      securitySettings = false;
    } 
    if (security.clicked()) {
      displaySettings = false;
      securitySettings = true;
    }
  }

  void displaySettings(boolean show) {
    if (show) {
      r.draw();
      g.draw();
      b.draw();
      rectCenter(r.output, g.output, b.output, 1);
      stroke(255);
      rect(x+menuWidth/2, g.y+3*padding, spacing*3-80, 50);
    }
  }

  void securitySettings(boolean show) {
    if (show) {
    }
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
      try {
        for (TableRow settings : userSettings.rows()) {


          if (currentUser.equals(settings.getString("Username"))) {
            println("saving settings");
            settings.setInt("BackgroundR", backgroundR);
            settings.setInt("BackgroundG", backgroundG); 
            settings.setInt("BackgroundB", backgroundB);
          }
        } 
      }catch (NullPointerException e) {
          errors.add(new ErrorMessage( "Settings not saved to user", x, y+200, "Red"));
          return;
        }
        saveTable(userSettings, "data/userSettings.csv");
      }
   
  }
}
