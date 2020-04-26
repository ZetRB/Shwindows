PFont clean;
Table userSettings;
  Table users;
LoginScreen login;
WindowsScreen windows;
Network network;
boolean loginScreen = true;
boolean windowsScreen = false;
boolean loggingOut;
float xoff;
int count;
int padding = 40; //works best at 40
int backgroundR,backgroundG,backgroundB;
String currentUser;
int itemsInTaskbar;
boolean noiseBackground = true;
ArrayList<ErrorMessage> errors;
void pageAssets(){
 login = new LoginScreen();
 windows = new WindowsScreen();
 network = new Network();
}

void setup() {
  background(backgroundR,backgroundG,backgroundB);
  clean = loadFont("MalgunGothic-100.vlw");
  userSettings = loadTable("userSettings.csv","header");
  frameRate(60);
  pageAssets();
  errors = new ArrayList();
  stroke(255);
  textFont(clean,20);
  fill(255);
  strokeWeight(2);
  text("Loading" , width/2,height/2);
  network.status();
}

void settings(){
  size(1300, 600);
}

void draw() {
  background(noiseBackground);
  count++;
  
  logout();
  if (loginScreen) {
    login.draw();
  } else if(windowsScreen){
    windows.draw();
  }
    showErrors();
}

void logout(){
 if (loggingOut == true){
  windowsScreen = false;
  loginScreen = true;
  loggingOut = false;
  noiseBackground = true;
 }
}


void showErrors() {
    for (ErrorMessage message : errors) {
      message.draw();
    }
    if (mousePressed) {
      if (errors.size()>0 && errors.get(0).life < millis()) {
        errors.remove(errors.size()-1);
      }
    }
  }
  
  void clearErrors(){
   if( errors.size() > 0){
    errors.remove(errors.size()-1); 
   }
  }
  
  void background(boolean noise){
   if(noise){
    background(map(noise(xoff),0,1,0,250),map(noise(1+xoff),0,1,0,250),map(noise(2+xoff),0,1,0,250)); 
    xoff+=0.001;
   } else {
    background(backgroundR, backgroundG, backgroundB);
   }
  }




void rectCenter(int fill, int stroke, int weight) {
  fill(fill);
  stroke(stroke);
  strokeWeight(weight);
  rectMode(CENTER);
}
void rectCenter(int fill, int r, int g, int b, int weight) {
  fill(fill);
  stroke(r, g, b);
  strokeWeight(weight);
  rectMode(CENTER);
}

void rectCenter(int r, int g, int b, int weight){
  fill(r,g,b);
  stroke(r,g,b);
  strokeWeight(weight);
  rectMode(CENTER);
}

void rect(int x, int y, int w, int h){
 beginShape();
 vertex(x+w/2,y-h/2);
 vertex(x+w/2,y+h/2);
 vertex(x-w/2,y+h/2);
 vertex(x-w/2,y-h/2);
 endShape(CLOSE);
}
