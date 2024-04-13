#include <ESP8266WiFi.h>

const char* ssid = "Redmi"; 
const char* password = "1234567890"; 

void setup() {
  delay(1000);
  Serial.begin(115200);
 
  connectToWiFi();
}

void loop() {
}

void connectToWiFi() {
  WiFi.begin(ssid, password);
  Serial.println();
  Serial.print("Connecting to WiFi");
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("\nWiFi connected successfully!");
  Serial.print("IP Address: ");
  Serial.println(WiFi.localIP());
}