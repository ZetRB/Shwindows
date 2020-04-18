class Messenger {
  Tab messengerTab;
  int x, y, w, h;
  Messenger(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;

    setup();
  } 

  void setup() {
    messengerTab = new Tab(x, y, w, h, "Messenger");
  }

  void draw() {
    messengerTab.draw();
    navigationButtons();
  }

  void navigationButtons() {
    if (messengerTab.minimise.clicked()) {
      windows.messengerOpen = false;
    }
  }
}
