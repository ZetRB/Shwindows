class Messenger {
  Tab messengerTab;
  int x, y, w, h, leftEdge,rightEdge,topEdge,bottomEdge;
  int menuWidth = 200;
  Network network;
  MenuButton publicChat;
  TypeBar messageToSend;
  Messenger(PApplet parent, int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    leftEdge = x-w/2;
    rightEdge = x+w/2;
    topEdge = y-h/2;
    bottomEdge = y+h/2;
    setup();
    this.network = new Network(parent);
    GetRequest get = new GetRequest("https://processing-chat-api.herokuapp.com/status");
    get.send();
    println("Reponse Content: " + get.getContent());
  } 

  void setup() {
    messengerTab = new Tab(this.x, this.y, this.w, this.h, "Messenger");
    messageToSend = new TypeBar(x+menuWidth/2,bottomEdge-padding,w-menuWidth-padding,40, "Enter message",true);
    // x position, y position, width,height,text displayed, is text shown
    publicChat = new MenuButton (leftEdge+menuWidth/2,topEdge+2*padding,160,40,"Public");
  }

  void draw() {
    messengerTab.draw();
    navigationButtons();
    menu();
    getInput();
    recieveData();
    if(publicChat.active == true){
     display(); 
    }


  }
  
  void menu(){
    stroke(255);
    strokeWeight(1);
    line(leftEdge +menuWidth, topEdge+40, leftEdge+menuWidth, bottomEdge); 
    publicChat.draw();
    if(publicChat.clicked()){
     publicChat.active = true; 
    }
  }

  void navigationButtons() {
    if (messengerTab.minimise.clicked()) {
      windows.messengerOpen = false;
    }
  }
  
  void display(){ // this can go into a class but for now its just gonna be a chat room
    messageToSend.draw();
  }

  public void getInput(){
    if(keyPressed){
      this.network.send(str(key));
    }
  }
 void recieveData(){ 
   if(network.recieve() != null){
     background(255,0,0);
   }
 }
}
