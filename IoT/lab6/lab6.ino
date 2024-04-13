#include <ESP8266WiFi.h> 

int btstate = 0;
const int LED_PIN = 13; // визначаємо піни для підключення світлодіода та кніпки
const int BUTTON_PIN = D5; 

void setup() {
    Serial.begin(9600);
    pinMode(LED_PIN, OUTPUT); // встановлюємо режим виводу
}

void loop() {
    btstate = digitalRead(BUTTON_PIN);

    if (btstate == HIGH) {
        digitalWrite(LED_PIN, HIGH); 
        Serial.println("On");
    } else {
        digitalWrite(LED_PIN, LOW);
        Serial.println("Off");
    }
}
