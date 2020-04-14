PFont clean;
LoginScreen login;
WindowsScreen windows;
boolean loginScreen = false;
boolean windowsScreen = true;
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
  size(1000, 600);
  frameRate(60);
  pageAssets();
}

void draw() {
  count++;
  background(0);
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
  loggingOut = false;
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
