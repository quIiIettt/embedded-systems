#include <ESP8266WiFi.h>
#include <WiFiUdp.h>

unsigned char* ssid = "Redmi";
unsigned char* password = "123456789";

unsigned int localPort = 7777;  // local port to listen on

char ReplyBuffer[] = "UDP data\r\n";        // a string to send back

WiFiUDP Udp;

void setup() {
  Serial.begin(115200);
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print('.');
    delay(500);
  }
  Serial.print("Connected! IP address: ");
  Serial.println(WiFi.localIP());
  Serial.printf("UDP server on port %d\n", localPort);
  Udp.begin(localPort);
}

void loop() {
    Udp.beginPacket(192.168.100.1, Udp.remotePort());
    Udp.write(ReplyBuffer);
    Udp.endPacket();
    delay(10000);
  }
}

