class WindowsScreen{
  StartMenu start;
  TaskBar taskbar;
  Settings settings;
    boolean settingsOpen;
  WindowsScreen(){
   setup(); 
  }
  void setup(){
    start = new StartMenu();
    taskbar = new TaskBar();
    settings = new Settings(width/2, height/2 , width-100,height-100);
    
  }
  void draw(){
    taskbar.draw();
    start.draw();
    if(settingsOpen == true){
     settings.draw(); 
    }
  }
  
  void checkSettings(){
   for(TableRow row : userSettings.rows()){
     if(currentUser.equals(row.getString("Username"))){
       println("user has colour settings");
      backgroundR = row.getInt("BackgroundR"); 
      backgroundG = row.getInt("BackgroundG"); 
      backgroundB = row.getInt("BackgroundB"); 
      settings.r.setPosition(backgroundR);
      settings.g.setPosition(backgroundG);
      settings.b.setPosition(backgroundB);
     }
    } 
  } 
}
