import http.requests.*;
class Network {

  void setup() {
    
  }
  
  void status(){
    GetRequest get = new GetRequest("https://processing-chat-api.herokuapp.com/status");
    get.send();
    println("Reponse Content: " + get.getContent());
  }
}
