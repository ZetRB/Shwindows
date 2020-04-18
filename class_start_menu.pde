class StartMenu {
  boolean startOpen;

  Button logout, settings, overlay, icon, name, messenger;
  StartMenu() {
    setup();
  }

  void setup() {
    icon = new Button("Start", int(1.5*padding), height-25, 60, 30, true, true, false, 400);
    overlay = new Button("Overlay", 125, height-200, 300, 300, true, false, false, 0);
    logout = new Button("Logout", int(1.5*padding), height -75, 60, 30, true, true, true, 200);
    settings = new Button("Settings", int(1.5*padding), height -115, 60, 30, true, true, true, 200);
    messenger = new Button("Messenger", int(1.5*padding), settings.y-padding, 60, 30, true, true, true, 200);
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
    } else if (mousePressed && !icon.mouseOver() && !overlay.mouseOver()) {
      startOpen = false;
    }
  }


  void startDisplay() {
    overlay.draw();
    logout.draw();
    settings.draw();
    messenger.draw();
    if (logout.clicked()) {
      loggingOut = true;
      startOpen = false;
    } else if (settings.clicked()) {
      if (windows.settingsOpen == false) {
        windows.settingsOpen = true;
      } else if (windows.settingsOpen == true) {
        ////////// - nothingh fgor now, maybe minimise feature in the future...
      }
    } else if (messenger.clicked()) {
      if (windows.messengerOpen == false) {
        windows.messengerOpen = true;
      }
    }
  }
}
