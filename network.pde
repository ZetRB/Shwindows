//import ketai.net.KetaiNet;
import processing.net.*

Class network{
  Client c;
  Server s;
  boolean actingServer = false;
  String localNetworkPrefix = "192.168.0."
  //String ip = KetaiNet.getIP(); 
  int port = 5204;
   
  public network(){
    if(!findServer){
      actingServer = true;
      this.s = new Server(this, port);
    }else{
      c.write("connected");
  }

  private boolean findServer(){
    for (int i = 0; i <= 100; i ++){
      try{
        this.c = new Client(this, localNetworkPrefix + Str(i), 5204);
        return true;
      }catch(Exception e){
        println("Could not connect to server on: " + localNetworkPrefix + str(i))
      }
    }
    return false;
  }

  public void send(String data){
    if(actingServer){
      s.write(data)
    }else{
      c.write(data)
    }
  }

  public String recieve(){
    if (actingServer){
      c = s.available();
      if(c != null){
        return c.readString();
      }

    }else{
      if (c.available() > 0){
        return c.readString();
      }
    }
  }
}