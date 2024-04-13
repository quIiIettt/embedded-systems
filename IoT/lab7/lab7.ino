#include <ESP8266WiFi.h>
#include <WiFiUdp.h>

const char* ssid = "Redmi";
const char* password = "123456789"; 

const unsigned int localPort = 7777; // локальний порт для прийому даних

char ReplyBuffer[] = "UDP data\r\n"; 

WiFiUDP Udp; // створення об'єкту для роботи з UDP

void setup() {
  Serial.begin(115200);
  
  // підключення до WiFi мережі
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print('.');
    delay(500);
  }
  Serial.print("Connected! IP address: ");
  Serial.println(WiFi.localIP());
  
  // початок роботи з UDP на визначеному порту
  if (!Udp.begin(localPort)) {
    Serial.println("Failed to begin UDP");
    while (1) {
      delay(1000);
    }
  }
  Serial.printf("UDP server on port %d\n", localPort);
}

void loop() {
  // отримання IP-адреси сервера через DNS
  IPAddress remoteIP;
  WiFi.hostByName("example.com", remoteIP);
  
  // відправлення UDP-пакету на сервер
  Udp.beginPacket(remoteIP, localPort);
  Udp.write(ReplyBuffer);
  Udp.endPacket();
  
  delay(10000);
}
