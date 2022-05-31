import processing.serial.*;
Arduino arduino;

class Arduino {
  Interaction interaction;
  Serial port;
  String serialPort;

  boolean debug;
  Arduino(int initPort, boolean initDebug) {
    interaction = new Interaction();
    if (initDebug == true) {
      debug = true;
    }
    if (debug) {
      println("Available serial ports:");
      for (int i = 0; i<Serial.list().length; i++)
      {
        print("[" + i + "] ");
        println(Serial.list()[i]);
      }
    }
    serialPort = Serial.list()[initPort];
  }
  void run() {
    while (port.available()>0) { // when there is incoming serial data
      String portOutput = port.readString();
      if (debug) {
        println(portOutput);
      }
      if (portOutput.indexOf("start") > -1) {
        interaction.startPressed();
        if (debug) {
          println("yes pressed");
        }
      }
      if (portOutput.indexOf("no") > -1) {
        interaction.noPressed();
        if (debug) {
          println("no pressed");
        }
      }
      if (portOutput.indexOf("yes") > -1) {
        interaction.yesPressed();
        if (debug) {
          println("yes pressed");
        }
      }
    }

    //if ((char)port.read()
  }
}
