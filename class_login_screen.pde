class LoginScreen {

  Button addNewUser, showPassword, showNewPassword;
  boolean correctDetails, makingNewUser;
  Button cancel;
  TypeBar user, password, newUser, newPassword, confirmPassword;
  void loadScreenAssets() {
    user = new TypeBar(width/2, height/2 -40, 400, 40, "Username", true); 
    password = new TypeBar(width/2, height/2+40, 400, 40, "Password", false);
    newUser = new TypeBar(width/2, height/2 -40, 400, 40, "Enter new username", true);
    newPassword = new TypeBar(width/2, height/2+40, 400, 40, "Enter new password", false);
    confirmPassword = new TypeBar(width/2, height/2+120, 400, 40, "Confirm new password", false);
    addNewUser = new MenuButton( width/2, height/2 - 100, 4*padding,padding,"Create new user");  
    showPassword = new Button("Show", width/2+password.w/2-20, password.y, 30, 30, false, true, false, 0);
    showNewPassword = new Button("Show", width/2+newPassword.w/2-20, newPassword.y, 30, 30, false, true, false, 0);
    cancel = new MenuButton(showNewPassword.x-20, int(confirmPassword.y+padding*1.5),2*padding, padding, "Cancel");
    users = loadTable("users.csv", "header");
  }
  LoginScreen() {
    setup();
  }
  void setup() {
    loadScreenAssets();
  }

  void draw() {
    if (makingNewUser == false) {
      loginDraw();
    } else {
      newUserDraw();
    }
  }


  // -------------------------------------------------------------------------login begins
  void loginDraw(){ 
    user.draw();
    password.draw();
    addNewUser.draw();
    showPassword.draw();
    if (showPassword.mouseOver()) {
      password.showText = true;
    } else {
      password.showText = false;
    }
    if (addNewUser.clicked() == true) {
      makingNewUser = true;
    }
    if (user.pauseInput == true || password.pauseInput == true) {
      if (detailsCheck(user.output, password.output) == true) {
        loginScreen = false;
        windowsScreen = true;
        windows.checkSettings();
      }
    }
  }


  boolean detailsCheck(String username, String password) {
    if (username.equals(null) || password.equals(null) || username.equals("") ||password.equals("")) {
      resetDetails();
      loginError();
      return false;
    }
    for (TableRow row : users.rows()) {
      if (username.equals(row.getString("Username")) && password.equals(row.getString("Password"))) {
        currentUser = username;
        resetDetails();
        return true;
      }
    }
    resetDetails();
    loginError();
    return false;
  }

  void loginError() {
    errors.add(new ErrorMessage("Username or Password incorrect", password.x, password.y+100, "Red"));
  }

  void resetDetails() {
    user.pauseInput = false;
    password.pauseInput = false;

    user.output = ""; 
    password.output = "";
    for (int i = user.inputs.size()-1; i >= 0; i--) {
      user.inputs.remove(i);
    }
    for (int i = password.inputs.size()-1; i >= 0; i--) {
      password.inputs.remove(i);
    }
  }
  //-------------------------------------------------- login ends
  //---------------------------------------------------new user begins
  void newUserDraw() {
    newUser.draw();
    newPassword.draw();
    confirmPassword.draw();
    showNewPassword.draw();
    cancel.draw();
    if (cancel.clicked()){
     makingNewUser = false; 
    }
    if (showNewPassword.mouseOver()) {
      newPassword.showText = true; 
      confirmPassword.showText = true;
    } else {
      newPassword.showText = false;
      confirmPassword.showText = false;
    }

    if (newUser.pauseInput == true || newPassword.pauseInput == true || confirmPassword.pauseInput == true) {
      if (validDetails(newUser.output, newPassword.output, confirmPassword.output) == true) {
        saveInputs();

        resetNewInputs();
        errors.add(new ErrorMessage("Details updated", confirmPassword.x, confirmPassword.y+100, "Green"));
        saveTable(users, "data/users.csv");
        saveTable(userSettings, "data/userSettings.csv");
        makingNewUser = false;
      }
    }
  }

  void saveInputs() {
    TableRow newInputs = users.addRow();
    newInputs.setString("Username", newUser.output);
    newInputs.setString("Password", newPassword.output);
    TableRow settings = userSettings.addRow();
    settings.setString("Username", newUser.output);
  }

  boolean validDetails(String username, String password, String checkPassword) {
    if (username.equals(null) || username.equals("")) {
      errors.add(new ErrorMessage("Invalid username", confirmPassword.x, confirmPassword.y+100, "Red"));
      unpauseInputs();
      return false;
    }
    for (TableRow row : users.rows()) {
      if (username.equals(row.getString("Username"))) {
        errors.add(new ErrorMessage("A user with this name already exists", confirmPassword.x, confirmPassword.y+100, "Red"));
        unpauseInputs();
        return false;
      }
    } 
    if (password.equals("") || checkPassword.equals("")) {
      errors.add(new ErrorMessage("Password field cannot be empty", confirmPassword.x, confirmPassword.y +100, "Red"));
      unpauseInputs();
      return false;
    } else if (password.equals(checkPassword)) {
      unpauseInputs();
      return true;
    } else {    
      errors.add(new ErrorMessage("Passwords do not match", confirmPassword.x, confirmPassword.y+100, "Red"));
      unpauseInputs();
    } 
    return false;
  }

  void unpauseInputs() {
    newUser.pauseInput = false;
    newPassword.pauseInput = false;
    confirmPassword.pauseInput = false;
  } 

  void resetNewInputs() {
    newUser.output = "";
    newPassword.output = "";
    confirmPassword.output = "";
    for (int i = newUser.inputs.size()-1; i >= 0; i--) {
      newUser.inputs.remove(i);
    }
    for (int i = newPassword.inputs.size()-1; i >= 0; i--) {
      newPassword.inputs.remove(i);
    }
    for (int i = confirmPassword.inputs.size()-1; i >= 0; i--) {
      confirmPassword.inputs.remove(i);
    }
  }
}
