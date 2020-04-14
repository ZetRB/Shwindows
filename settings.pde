class Settings {
  int x, y, w, h;
  Button save;
  Slider r, g, b;
  Tab settingsTab;
  Settings(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    setup();
  }

  void setup() {

    r = new Slider(x-w/2+100, y-h/2+100, 100, 255);
    g = new Slider(x-w/2+100, y-h/2+200, 100, 255);
    b = new Slider(x-w/2+100, y-h/2+300, 100, 255);
    save = new Button("Save", x+w/2-50, y+h/2-50, 30, 30, true, true, true, 100);
    settingsTab=new Tab(x, y, w, h, "Settings");
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
      rect(x-w/2+400, y-h/2+100, 30, 30);
    } else {
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
