class StartMenu {
  boolean startOpen;

  Button logout, settings,overlay,icon,name;
  StartMenu() {
    setup();
  }

  void setup() {
    icon = new Button("Start", 40, height-25, 40, 30, true, true,false, 200);
    overlay = new Button("Overlay", 125, height-200, 300, 300, true, false,false, 0);
    logout = new Button("Logout",40, height -75,40,30,true,true,true,200);
    settings = new Button("Settings",40,height -115,40,30,true,true,true,200);
  }

  void draw() {
    iconDisplay();
    iconPressed();
    if (startOpen) {
      startDisplay();
    }
  }

  void iconDisplay() {
    icon.draw();
  }

  void iconPressed() {
    if (icon.clicked()) {
      if (startOpen == false) {
        startOpen = true;
      } else {
        startOpen = false;
      }
    }
  }


  void startDisplay() {
    overlay.draw();
    logout.draw();
    settings.draw();
    if(logout.clicked()){
      loggingOut = true;
      startOpen = false;
    } else if(settings.clicked()){
      if(windows.settingsOpen == false){
       windows.settingsOpen = true; 
      } else if(windows.settingsOpen == true){
        ////////// - nothingh fgor now, maybe minimise feature in the future...
      }
    }
  }
}
