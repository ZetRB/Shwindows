PFont clean;
Table userSettings;
  Table users;
LoginScreen login;
WindowsScreen windows;
boolean loginScreen = true;
boolean windowsScreen = false;
boolean loggingOut;
int count;
int padding = 40;
int backgroundR,backgroundG,backgroundB;
String currentUser;
int itemsInTaskbar;
ArrayList<ErrorMessage> errors;
void pageAssets(){
 login = new LoginScreen();
 windows = new WindowsScreen();
}

void setup() {
  background(backgroundR,backgroundG,backgroundB);
  clean = loadFont("MalgunGothic-100.vlw");
  userSettings = loadTable("userSettings.csv","header");
  frameRate(60);
  pageAssets();
  errors = new ArrayList();
}

void settings(){
  size(1000, 600);
}

void draw() {
  background(0);
  count++;
  background(backgroundR, backgroundG, backgroundB);
  logout();
  if (loginScreen) {
    login.draw();
  } else if(windowsScreen){
    windows.draw();
  }
    errors();
}

void logout(){
 if (loggingOut == true){
  windowsScreen = false;
  loginScreen = true;
  resetBackground();
  loggingOut = false;
 }
}

void resetBackground(){
 backgroundR = 0;
 backgroundG = 0;
 backgroundB = 0;
}

void errors() {
    for (ErrorMessage message : errors) {
      message.draw();
    }
    if (mousePressed) {
      if (errors.size()>0) {
        errors.remove(errors.size()-1);
      }
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
