// Mega 
cube([53.3, 101.6, 11.96], center = true); // height non-official.  Dimensions exclude USB socket sticking out. 

/*  Pin Out and how to make it work
54 digital I/O pins, 15 of which can be used as 8-bit PWM outputs and 5 provide interrupts.  
16 analogue inputs of 10-bits each.  An analogue input can be used as a comparator to callibrate the levels for a digital input that is not exactly 0 and 5v.  Saves on op amps complexity and reliability impact. 
4 UARTS (hardware serial ports)
ICSP Header

USB Power - is via A plug to B plug cable from Raspberry Pi

1) Select Board under Tools >> Board >> Arduion Mega 2560
2) Select Serial Port under Tools >> Serial Port >> /dev/tty.usbmodem262471  or /dev/tty.usbmodem1421
3) Select Processor under Tools >> Processor


*/