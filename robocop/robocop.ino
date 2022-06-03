const int startBtn = 2;
const int yesBtn = 3;
const int noBtn = 4;
const int ledPin =  13;

bool startToggle = false;
bool yesToggle = false;
bool noToggle = false;

bool on = false; 

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(startBtn, INPUT);
  pinMode(yesBtn, INPUT);

  Serial.begin(9600);
}

void loop() {
  if (digitalRead(startBtn) == HIGH) {
    if (!startToggle) {
      Serial.println("start");
      startToggle = true;
    }
  } else {
    startToggle = false;
  }
  if (digitalRead(yesBtn) == HIGH) {
    if (yesToggle == false) {
      Serial.println("yes");
      yesToggle = true;
    }
  } else {
    yesToggle = false;
  }
  if (digitalRead(noBtn) == HIGH) {
    if (!noToggle) {
     Serial.println("no");
     noToggle = true;
    }
  } else {
    noToggle = false;
  }
}
