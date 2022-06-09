void setup() {
  arduino = new Arduino(this, 0, true, 9600);
}


void draw() {
  arduino.run();
}
