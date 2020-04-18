class Settings {
  int x, y, w, h, leftEdge, topEdge, rightEdge, bottomEdge;
  int menuWidth = 200;
  int spacing;
  boolean displaySettings = true;
  boolean securitySettings;
  boolean settingsLocked = true;
  Button save;
  Button display;
  Button security;
  Slider r, g, b;
  Tab settingsTab;
  TypeBar securityCheck;
  MenuButton backgroundRandom, backgroundCustom;
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
    // x position, y position, width,height,text displayed, is text shown
    spacing = (w-menuWidth-padding)/3;
    securityCheck = new TypeBar(x+menuWidth/2, topEdge+300, 400, 40, "Confirm Password", false);
    r = new Slider(x+menuWidth/2-spacing, topEdge+80, 100, 255, "Red");
    g = new Slider(x+menuWidth/2, topEdge+80, 100, 255, "Green");
    b = new Slider(x+menuWidth/2+spacing, topEdge+80, 100, 255, "Blue");
    save = new Button("Save", x+w/2-50, y+h/2-50, 30, 30, true, true, true, 100);
    settingsTab=new Tab(x, y, w, h, "Settings");
    display = new MenuButton(leftEdge+menuWidth/2, topEdge+padding*2, 160, 40, "Display");
    security = new MenuButton(leftEdge+menuWidth/2, topEdge+padding*3+20, 160, 40, "Security");
    backgroundRandom = new MenuButton(x+menuWidth/2, b.y+padding*5, padding*6, padding, "Use random background");
    backgroundCustom = new MenuButton(x+menuWidth/2, b.y+padding*7, padding*6, padding, "Use custom background");
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
      securityCheck.pauseInput = false;
    }
  }

  void displaySettings(boolean show) {
    if (show) {
      r.draw();
      g.draw();
      b.draw();
      backgroundRandom.draw();
      backgroundCustom.draw();
      backgroundType();
      rectCenter(r.output, g.output, b.output, 1);
      stroke(255);
      rect(x+menuWidth/2, g.y+3*padding, spacing*3-80, 50);
    }
  }

  void backgroundType() {
    if (backgroundRandom.clicked() && backgroundRandom.active == false) {
      backgroundRandom.active = true;
      backgroundCustom.active = false;
    } else if (backgroundCustom.clicked() && backgroundCustom.active == false) {
      backgroundCustom.active = true;
      backgroundRandom.active = false;
    }
  }

  void securitySettings(boolean show) {
    if (show) {
      securityCheck.draw();
      if (securityCheck.pauseInput) {
        if (login.detailsCheck(currentUser, securityCheck.output)) {
          securityCheck.pauseInput = false;
          settingsLocked = false;
        } else {
          securityCheck.pauseInput = false;
          securityCheck.output = "";
          for (int i = securityCheck.inputs.size()-1; i >= 0; i--) {
            securityCheck.inputs.remove(i);
          }
        }
      }
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
            if (backgroundRandom.active == true) {
              settings.setString("NoiseBackgrount", "true");
              noiseBackground = true;
              println("user selected noise background");
            } else {
              println("saving settings");
              settings.setInt("BackgroundR", backgroundR);
              settings.setInt("BackgroundG", backgroundG); 
              settings.setInt("BackgroundB", backgroundB);
              settings.setString("NoiseBackgrount", "false");
              noiseBackground = false;
            }
          }
        }
      }
      catch (NullPointerException e) {
        errors.add(new ErrorMessage( "Settings not saved to user", x, y+200, "Red"));
        return;
      }
      saveTable(userSettings, "data/userSettings.csv");
    }
  }
}
