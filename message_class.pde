class Message{
  String name, text;
  int x,w,y;
  Message(String name, String text,int x, int w){
    this.name = name;
    this.text = text;
    this.x = x;
    this.w = w;
    y = 100;
  }
  
  boolean UserMessage(String name){
   if(name == currentUser){
     println("user message");
     return true;
   } else {
     println("not user message");
    return false; 
   }
  }
  
  void draw(){
   if(UserMessage(name)){
    userMessage(); 
   } else {
    incomingMessage(); 
   }
  }
  
  void userMessage(){
   fill(backgroundR,backgroundG,backgroundB,255);
   rect(x,y,w,30);
   textAlign(RIGHT,CENTER);
   fill(255);
   text(text,x+w/4,y); 
  }
  
  void incomingMessage(){
   fill(100);
   rect(x,y,w,30);
   textAlign(LEFT,CENTER);
   fill(255);
   text(name + ": " + text,x-w/4,y);
  }
}
