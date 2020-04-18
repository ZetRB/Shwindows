class TaskBar {
  Button settingsIcon, messengerIcon;
  int x = width/2;
  int w = width;
  int h = 50;
  int y = height - h/2;
  TaskBar() {
    setup();
  }

  void setup() {
    settingsIcon = new Button("S", 100+30, height-25, 30, 30, true, true, true, 200);
    messengerIcon = new Button("M", settingsIcon.x+padding, height-25, 30, 30, true, true, true, 200);
  }
  void draw() {
    rectCenter(0, 255, 1);
    rect(x, y, w, h);
    settingsIcon.draw();
    messengerIcon.draw();
    if (settingsIcon.clicked()) {
      if (windows.settingsOpen) {
        windows.settingsOpen = false;
      } else if (!windows.settingsOpen) {
        windows.settingsOpen = true;
      }
    } else if (messengerIcon.clicked()) {
      if (windows.messengerOpen) {
        windows.messengerOpen = false;
      } else if (!windows.messengerOpen) {
        windows.messengerOpen = true;
      }
    }
  }
}
