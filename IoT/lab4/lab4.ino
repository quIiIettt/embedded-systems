void setup() {
  delay(1000);
  Serial.begin(115200);
  uart.begin(115200, SERIAL_8N1, 0, 2); // ініціалізація UART
  uart.write("Hello World"); // виведення рядка через UART
}

void loop() {
  // sss
}
