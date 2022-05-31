const int startBtn = 2;
const int yesBtn = 3;
const int noBtn = 4;
const int startBtnLed = 12;
const int ledPin =  13;
int buttonState = 0;

bool startToggle = false;
bool yesToggle = false;
bool noToggle = false;

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(startBtn, INPUT);
  pinMode(yesBtn, INPUT);
  pinMode(noBtn, INPUT);
  pinMode(startBtnLed, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (digitalRead(startBtn) == HIGH) {
    // turn LED on:
    
    digitalWrite(ledPin, HIGH);
    if (startToggle == false) {
      Serial.println("start");
      startToggle = true;
    }
  } else {
    digitalWrite(ledPin, LOW);
    startToggle = false;
  }
  if (digitalRead(yesBtn) == HIGH) {
    // turn LED on:
    digitalWrite(ledPin, HIGH);
    if (yesToggle == false) {
      Serial.println("yes");
      yesToggle = true;
    }
  } else {
    // turn LED off:
    digitalWrite(ledPin, LOW);
    yesToggle = false;
  }
  if (digitalRead(noBtn) == HIGH) {
    // turn LED on:
    digitalWrite(ledPin, HIGH);
    if (noToggle == false) {
     Serial.println("no");
     noToggle = true;
    }
  } else {
    // turn LED off:
    digitalWrite(ledPin, LOW);
    noToggle = false;
  }
}
