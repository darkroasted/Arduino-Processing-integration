import processing.serial.*;
Arduino arduino;

class Arduino {
  private Serial port;

  boolean DEBUG;
  Arduino(PApplet parent, int initPort, boolean initDebug, int baudr) {
    DEBUG = initDebug;
    
    if (DEBUG) {
      println("Available serial ports:");
      printArray(Serial.list());
    }
    String serialPort = Serial.list()[initPort];
    port = new Serial(parent, serialPort, baudr);
    
  }
  void run() {
    while (port.available()>0) { // when there is incoming serial data
      String portOutput = port.readString();
      if (DEBUG) {
        println(portOutput);
      }
      if (portOutput.indexOf("start") > -1) {
        Interaction.startPressed();
         dbgPrintln("Press: {START/STOP}");
      }
      if (portOutput.indexOf("no") > -1) {
        Interaction.noPressed();
        dbgPrintln("Press: {NO}");
      }
      if (portOutput.indexOf("yes") > -1) {
        Interaction.yesPressed();
        dbgPrintln("Press: {YES}");
      }
    }

    //if ((char)port.read()
  }
  
  void dbgPrintln(String in){
    if(DEBUG)
      println("[Arduino]: " + in);
  }
}
