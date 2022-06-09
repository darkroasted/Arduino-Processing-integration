void setup() {
  arduino = new Arduino(this, 0, true, 9600);
  
  TestInteractible a = new TestInteractible();
  arduino.interactibles.add(a);
}


void draw() {
  arduino.run();
}
