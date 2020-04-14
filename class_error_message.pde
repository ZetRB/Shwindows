class ErrorMessage{
  String errorMessage;
  int x,y;
  int life;
  int r,g,b;
  ErrorMessage(String message,int tx, int ty, String colour){
    errorMessage = message;
    x = tx;
    y = ty;
    if (colour == "Red"){
      r = 150;
      g = 0;
      b = 0;
    } else if(colour == "Green"){
     r = 0;
     g = 150;
     b = 0;
    } else if(colour == "Blue"){
     r = 0;
     g = 0;
     b = 150;
    }
  }
  
  void draw(){
    rectCenter(0,r,g,b,1);
    rect(x,y,350,40);
   textFont(clean, 20);
   stroke(r,g,b);
   fill(r,g,b);
   textAlign(CENTER,CENTER);
   text(errorMessage,x,y);
  }
}


//hello there
