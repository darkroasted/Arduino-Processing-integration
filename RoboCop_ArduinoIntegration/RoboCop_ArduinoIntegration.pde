
void setup() {
  arduino = new Arduino(2, false);
  arduino.port = new Serial(this, arduino.serialPort, 9600);
}


void draw() {
  arduino.run();
}
