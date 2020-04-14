PFont clean;
Table userSettings;
  Table users;
LoginScreen login;
WindowsScreen windows;
boolean loginScreen = true;
boolean windowsScreen = false;
boolean loggingOut;
int count;
int backgroundR,backgroundG,backgroundB;
String currentUser;
int itemsInTaskbar;
void pageAssets(){
 login = new LoginScreen();
 windows = new WindowsScreen();
}

void setup() {
  background(backgroundR,backgroundG,backgroundB);
  clean = loadFont("MalgunGothic-100.vlw");
  userSettings = loadTable("userSettings.csv","header");
  size(1000, 600);
  frameRate(60);
  pageAssets();
}

void draw() {
  count++;
  background(backgroundR, backgroundG, backgroundB);
  logout();
  if (loginScreen) {
    login.draw();
  } else if(windowsScreen){
    windows.draw();
  }
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
}

void rect(int x, int y, int w, int h){
 beginShape();
 vertex(x+w/2,y-h/2);
 vertex(x+w/2,y+h/2);
 vertex(x-w/2,y+h/2);
 vertex(x-w/2,y-h/2);
 endShape(CLOSE);
}
