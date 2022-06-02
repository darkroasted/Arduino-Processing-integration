
void setup() {
  arduino = new Arduino(this, 2, false, 9600);
}


void draw() {
  arduino.run();
}
