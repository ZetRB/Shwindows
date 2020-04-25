import http.requests.*;
class Messenger {
  Tab messengerTab;
  VerticalSlider scroll;
  int x, y, w, h, leftEdge, rightEdge, topEdge, bottomEdge;
  int menuWidth = 200;
  int refreshTime = 10000;
  int lastRefresh;
  boolean resetNow;
  JSONArray messages = null;
  ArrayList<Message> messagesToShow = new ArrayList<Message>();
  MenuButton publicChat, send;
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
    scroll = new VerticalSlider(rightEdge-padding,topEdge+h/2-padding,200,100);
     //x,y,w,precision
  
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
      scroll.setPosition(0);
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
    scroll.draw();
  }
  
  boolean refresh(){
    if(millis()-lastRefresh > refreshTime || resetNow){
      resetNow = false;
      return true;
    } else {
     return false; 
    }
  }

  void messageHandling() {
    if (messages!= null) {
      for (int i = 0; i < messagesToShow.size(); i++) {
        Message current = messagesToShow.get(i);
        current.y = messageToSend.y-1 - (messagesToShow.size()-i)*40+scroll.output*10;
        if(current.y>topEdge+padding && current.y<messageToSend.y-padding){
        current.draw();
        }
      }
    }
    if (refresh()) { //test to see message reply
      messages = network.getMessages();
      if(messagesToShow.size()<messages.size()){
      for(int i = messagesToShow.size(); i<messages.size();i++){
           JSONObject message = messages.getJSONObject(i);
          messagesToShow.add(new Message(message.getString("name"),message.getString("message"),x+menuWidth/2,w-menuWidth));
       }
      }
      lastRefresh = millis();
      scroll.increment = 4*messages.size();
    }

  if (messageToSend.pauseInput || send.clicked()) {
    network.send(messageToSend.output);
    messageToSend.reset();
    resetNow = true;
  }
}
}
