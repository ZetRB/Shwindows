class Message{
  String name, text;
  int x,w,y;
  boolean userMessage;
  Message(String name, String text,int x, int w){
    this.name = name;
    this.text = text;
    this.x = x;
    this.w = w;
    y = 100;
    if(name.equals(currentUser)){
     userMessage = true; 
    }
  }
  

  
  void draw(){
   if(userMessage){
    userMessage(); 
   } else {
    incomingMessage(); 
   }
  }
  
  void userMessage(){
    if(noiseBackground){
      fill(map(noise(xoff),0,1,0,250),map(noise(1+xoff),0,1,0,250),map(noise(2+xoff),0,1,0,250));
    } else if(!noiseBackground){
      fill(backgroundR,backgroundG,backgroundB,255);      
    }
    noStroke();
    rect(x-2*padding+w/2-textWidth(text)/2,y,textWidth(text) + padding,30);
   textAlign(RIGHT,CENTER);
   fill(255);
   text(text,x-2*padding+w/2,y); 
  }
  
  void incomingMessage(){
   fill(100);
   noStroke();
   rect(x+padding-w/2+textWidth(name + ": " + text)/2,y,textWidth(name + ": " + text)+padding,30);
   textAlign(LEFT,CENTER);
   fill(255);
   text(name + ": " + text,x+padding-w/2,y);
  }
}
