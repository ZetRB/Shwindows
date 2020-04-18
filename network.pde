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
    this.s = new Server(this.parent, port);
  }

  public void send(String data){
    s.write(data);
  }

  public String recieve(){
    c = s.available();
    if(c != null){
      return c.readString();
    }
    return null;
  }
}
