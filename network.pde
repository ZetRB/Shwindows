import http.requests.*;
class Network {
  void setup() {
    
  }
  
  void status(){
    GetRequest get = new GetRequest("https://processing-chat-api.herokuapp.com/status");
    get.send();
    println("Reponse Content: " + get.getContent());
  }
  
  
//https://processing-chat-api.herokuapp.com/


//Post - messages?name=<name>&message=<message>

  
  void send(String message){
   String link =  "https://processing-chat-api.herokuapp.com/" + "messages?name=" + currentUser + "&message=" + message;
   PostRequest post = new PostRequest(link);
   post.send();
  } 
  
  JSONArray getMessages(){ // could have a string in here for specific user mssgs
    GetRequest recieve = new GetRequest("https://processing-chat-api.herokuapp.com/messages");
    recieve.send();
    println("Response Content; " + recieve.getContent());
  return parseJSONArray(recieve.getContent());
  }
  
}
