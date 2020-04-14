class WindowsScreen{
  StartMenu start;
  TaskBar taskbar;
  SettingsTab settings;
    boolean settingsOpen;
  WindowsScreen(){
   setup(); 
  }
  void setup(){
    start = new StartMenu();
    taskbar = new TaskBar();
    settings = new SettingsTab(width/2, height/2 , width-100,height-100);
  }
  void draw(){
    taskbar.draw();
    start.draw();
    if(settingsOpen == true){
     settings.draw(); 
    } 
  }
}
