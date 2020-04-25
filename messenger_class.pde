import http.requests.*;
class Messenger {
  Tab messengerTab;
  int x, y, w, h, leftEdge, rightEdge, topEdge, bottomEdge;
  int menuWidth = 200;
  JSONArray messages = null;
  ArrayList<Message> messagesToShow = new ArrayList<Message>();
  MenuButton publicChat, send, test;
  TypeBar messageToSend;
  Messenger(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    leftEdge = x-w/2;
    rightEdge = x+w/2;
    topEdge = y-h/2;
    bottomEdge = y+h/2;
    setup();
  } 

  void setup() {
    messengerTab = new Tab(this.x, this.y, this.w, this.h, "Messenger");
    messageToSend = new TypeBar(x+int(0.15*(menuWidth)), bottomEdge-padding, int(0.8*(w-menuWidth)), 40, "Enter message", true);
    send = new MenuButton (messageToSend.x+messageToSend.w/2+int(0.075*(w-menuWidth)), messageToSend.y, int(0.1*(w-menuWidth)), 40, "Send");
    // x position, y position, width,height,text displayed, is text shown
    publicChat = new MenuButton (leftEdge+menuWidth/2, topEdge+2*padding, 160, 40, "Public");
    test = new MenuButton (x, y, 100, 100, "test");
  }

  void draw() {
    messengerTab.draw();
    navigationButtons();
    menu();
    if (publicChat.active == true) {
      display(); 
      messageHandling();
    }
  }

  void menu() {
    stroke(255);
    strokeWeight(1);
    line(leftEdge +menuWidth, topEdge+40, leftEdge+menuWidth, bottomEdge); 
    publicChat.draw();
    if (publicChat.clicked()) {
      publicChat.active = true;
    }
  }

  void navigationButtons() {
    if (messengerTab.minimise.clicked()) {
      windows.messengerOpen = false;
    }
  }

  void display() { // this can go into a class but for now its just gonna be a chat room
    messageToSend.draw();
    send.draw();
    test.draw();
  }

  void messageHandling() {
    if (messages!= null) {
      for (int i = 0; i < messagesToShow.size(); i++) {
        Message current = messagesToShow.get(i);
        current.y = topEdge + i*40;
        current.draw();
      }
    }
    if (test.clicked()) { //test to see message reply
      messages = network.getMessages();
      if(messagesToShow.size()<messages.size()){
      for(int i = messagesToShow.size(); i<messages.size();i++){
           JSONObject message = messages.getJSONObject(i);
          messagesToShow.add(new Message(message.getString("name"),message.getString("message"),x+menuWidth/2,w));
       }
      }
    }

  if (messageToSend.pauseInput || send.clicked()) {
    network.send(messageToSend.output);
    messageToSend.reset();
  }
}
}
