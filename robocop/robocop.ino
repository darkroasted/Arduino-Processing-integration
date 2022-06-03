const int startBtn = 8;
const int yesBtn = 9;
const int noBtn = 10;
const int ledPin =  7;

bool startToggle = false;
bool yesToggle = false;
bool noToggle = false;
bool on = false; 

bool start = false;
void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(startBtn, INPUT);
  pinMode(yesBtn, INPUT);

  Serial.begin(9600);
}

void loop() {
  start = digitalRead(startBtn);
  if (start) {
    if (!startToggle) {
      startToggle = true; 
      on = !on;
      if (on) {
        Serial.println("sonx");
      } else{
        Serial.println("soffx");
      }
    }
  } else {
    startToggle = false;
  }
  if (digitalRead(yesBtn) == HIGH) {
    if (yesToggle == false) {
      Serial.println("yex");
      yesToggle = true;
    }
  } else {
    yesToggle = false;
  }
  if (digitalRead(noBtn) == HIGH) {
    if (!noToggle) {
     Serial.println("nox");
     noToggle = true;
    }
  } else {
    noToggle = false;
  }
  digitalWrite(ledPin,on);

  delay(2); // Quick and dirty delay for debouncing;
}
