///////////////////////////////////////////////////////////////////////////////
/////// PROGRAM FIRMWARE MODBUS RTU ARDUINO PYTHON ////////////////////////
/////// written by : muhammad husni                ////////////////////////
/////// FOR EDUCATIONAL PURPOSE                    /////////////////////////
/////////////////////////////////////////////////////////////////////////// 


#include <ModbusRtu.h>
#define ID   1 // slave id 
Modbus slave(ID, Serial, 0); 

uint16_t au16data[10]; //variabel au16data untuk pengiriman data modbus sebanyak 10 data

void setup() {
    Serial.begin(9600); 
    //DIGITAL OUTPUT
    pinMode(13,OUTPUT);
    pinMode(12,OUTPUT);
    pinMode(11,OUTPUT);
    //DIGITAL INPUT
    pinMode(3,INPUT_PULLUP);
    pinMode(4,INPUT_PULLUP);
    //ANALOG OUTPUT
    pinMode(6,OUTPUT);
    analogWrite(6,0);

    slave.start();
}

void loop() {
  if (slave.poll(au16data, 10) > 0) {
    slave.poll( au16data,10);
    //digital output 1
    digitalWrite(13, bitRead(au16data[0],0));  
    //digital output 2
    digitalWrite(12, bitRead(au16data[1],0));  
    //digital output 3
    digitalWrite(11, bitRead(au16data[2],0));  
    //analog output pwm                                          
    analogWrite(6, au16data[3]);              

    //analog input
    au16data[4] = analogRead(A0);             

    // digital input 1
    bitWrite(au16data[5], 0, digitalRead(3)); 

    // digital input 2
    bitWrite(au16data[6], 0, digitalRead(4)); 
  }
} 
