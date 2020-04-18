class Messenger {
  Tab messengerTab;
  int x, y, w, h;
  Network network;
  Messenger(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    setup();
    this.network = new Network();
  } 

  void setup() {
    messengerTab = new Tab(this.x, this.y, this.w, this.h, "Messenger");
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
