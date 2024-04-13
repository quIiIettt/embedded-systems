int btstate = 0;

void setup() {
    Serial.begin(9600);
    pinMode(13, OUTPUT);
    pinMode(11, INPUT);
}

void loop() {
    btstate = digitalRead(11);
if (btstate == HIGH) {
    digitalWrite(13, HIGH);
    Serial.println("On");
} else if (btstate == LOW) {
    digitalWrite(13, LOW);
    Serial.println("Off");
}
}