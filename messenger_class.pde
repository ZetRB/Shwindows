class Messenger {
  Tab messengerTab;
  int x, y, w, h;
  Network network;
  Messenger(PApplet parent, int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    setup();
    this.network = new Network(parent);
  } 

  void setup() {
    messengerTab = new Tab(this.x, this.y, this.w, this.h, "Messenger");
  }

  void draw() {
    messengerTab.draw();
    navigationButtons();
    getInput();
    recieveData();


  }

  void navigationButtons() {
    if (messengerTab.minimise.clicked()) {
      windows.messengerOpen = false;
    }
  }

  public void getInput(){
    if(keyPressed){
      this.network.send(key);
    }
  }
 void recieveData(){ 
   if(network.recieve() != null){
     background(255,0,0);
   }
 }
}
