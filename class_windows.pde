class WindowsScreen {
  StartMenu start;
  TaskBar taskbar;
  Settings settings;
  Messenger messenger;
  boolean settingsOpen,messengerOpen;
  PApplet parent;
  WindowsScreen() {
    setup();
  }
  void setup() {
    start = new StartMenu();
    taskbar = new TaskBar();
    settings = new Settings(width/2, height/2, width-100, height-100);
    messenger = new Messenger(width/2, height/2, width-100,height-100);
  }
  void draw() {
    taskbar.draw();
    start.draw();
    if (settingsOpen == true) {
      settings.draw();
    }else if(messengerOpen == true){
     messenger.draw(); 
    }
    taskbar.draw();
    start.draw();
  }

  void checkSettings() {
    for (TableRow row : userSettings.rows()) {
      if (currentUser.equals(row.getString("Username"))) {

        if (row.getString("NoiseBackground").equals("true")) {
          noiseBackground = true;
          settings.backgroundRandom.active = true;
          settings.backgroundCustom.active = false;
        } else {
          noiseBackground = false;
          println(noiseBackground);
          settings.backgroundRandom.active = false;
          settings.backgroundCustom.active = true;
        }
        println("user has colour settings");
        backgroundR = row.getInt("BackgroundR"); 
        backgroundG = row.getInt("BackgroundG"); 
        backgroundB = row.getInt("BackgroundB"); 

        settings.r.setPosition(backgroundR);
        settings.g.setPosition(backgroundG);
        settings.b.setPosition(backgroundB);
        settings.r.output = backgroundR;
        settings.g.output = backgroundG;
        settings.b.output = backgroundB;
      }
    }
  }
}
