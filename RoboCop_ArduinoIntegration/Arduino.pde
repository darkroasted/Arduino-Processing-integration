import processing.serial.*;
Arduino arduino;

class Arduino {
  private Serial port;
  boolean prevStart = false;
  String portOutput = "";
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
      portOutput += port.readString();
      println(portOutput);
    }
    // Look for all the toggles

    if (portOutput.contains("son")) {
      Interaction.startPressed(true);
      dbgPrintln("Press: {START}");
    }
    if (portOutput.contains("soff")) {
      Interaction.startPressed(false);
      dbgPrintln("Press: {STOP}");
    }
    if (portOutput.contains("no")) {
      Interaction.noPressed();
      dbgPrintln("Press: {NO}");
    }
    if (portOutput.contains("ye")) {
      Interaction.yesPressed();
      dbgPrintln("Press: {YES}");
    }

    // Cut the processed substrings
    while (portOutput.contains("\r\n")) {
      int lastMessageEnd = portOutput.indexOf("\r\n");
      //dbgPrintln("" + lastMessageEnd + " " + portOutput.length());
      if (lastMessageEnd > -1)
        portOutput = portOutput.subSequence(lastMessageEnd, portOutput.length() -1).toString();
    }
  }

  void dbgPrintln(String in) {
    if (DEBUG)
      println("[Arduino]: " + in);
  }
}
