import processing.net.*;
class Network{
  Client c;
  Server s;
  boolean actingServer = false;
  String localNetworkPrefix = "192.168.0";
  //String ip = KetaiNet.getIP(); 
  int port = 5204;
  PApplet parent;
   
  public Network(PApplet parent){
    this.parent = parent;
    c = new Client(parent, 192.168.0.4, port)
  }

  public void send(String data){
    c.write(data)
  }

  public String recieve(){
    if (c.available() > 0){
      return c.readString();
    }
    return null;
  }
}
