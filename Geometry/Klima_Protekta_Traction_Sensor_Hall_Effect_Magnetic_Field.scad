/* Hall Effect sensor measures Magnetic Fields.  Some Hall Effect Sensor are calibrated by manufacturer in millivolts per Gauss. 
Others are not

First sensor evaluated: Honeywell S& D SN35865 (that is Farnell's order code).  Also known as a SS441A (that is manufacturer's part nunber).  We use the UA, 3 pin SIP package (not the LH 3 pin surface mount)

Straight Leads (three) at 14.99mm
Spacing 1.30mm of leads.

Looking at smaller flat face
   ** Left lead is Vcc, + 5V DC
   ** centre lead is ground
   ** right lead is V output - that varies with magnetic presence
   
   Honeywell says use a 10K Ohm resistor from Vcc to teh variable pin. 
   
   Use Arduion Analogue Read
   ---> with no magnet nearby it reads 0.97 volt
   ---> with South pole of cm cube magnets within 3 cm it goes to zero volts
   --> the transition from 0.97 to 0 is rapid at almost exaclty 3cm. Its a switch
   
   Conclusion: Not a useful hall sensor for detecting analogue variation in field strength for rotor position sensing. 
   
Second sensor evaluated:    
    See playground.arduino.cc/Code/HallEffect
    where it recommends A1301 or A1302 Hall Effect Sensors from Allegromicro/en/Products/Part_Numbers/1301/1301.pdf
    When there is no field they read half VCC, ie 2.5 volts. 
    They resopond to North or South poles
    A) The A1301 is 2.5 millivolts per Gauss
    B) The A1302 is 1.3 millivolts per Gauss (so able to measure larger fields). 
    
    Note 1 Tesla = 10,000 Gauss.  So a 2.5 volt range is 1000 Gauss for A1301 and 2000 Gauss for A1302, but still one fifth of a Gauss. The permanent magnets make 1 Tesla so these sensors won't do. 
    
Third Sensor Evaluated.  Needs to be Ratiometric Linear for large fields. SN496B goes up to + or - 840 Gauss, versus 670 gauss for SS495A. 
   


Detects when South pole of magnet is near the smaller flat face 

*/